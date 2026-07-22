#!/usr/bin/env python3
"""
Script de génération d'annonces pour chana9.ma
Authentification → JWT → Création des annonces
"""

import requests
import json
import random
from datetime import date, timedelta
from time import sleep

# ─── Configuration ────────────────────────────────────────────────────────────

BASE_URL = "http://localhost:8080"   # ← adapte si nécessaire
AUTH_URL = f"{BASE_URL}/api/v1/auth/login"      # ← adapte l'endpoint d'auth
ANNONCES_URL = f"{BASE_URL}/api/v1/annonces"

USERNAME = "0653995947"
PASSWORD = "20032003"

# ─── Données de test ──────────────────────────────────────────────────────────

BREEDS = [
    "Beni Guil", "Timahdite", "Sardi", "Ouled Djellal", "D'man",
    "Boujad", "Béni Ahsen", "Chaouia"
]

REGIONS = [
    "Casablanca-Settat", "Rabat-Salé-Kénitra", "Marrakech-Safi",
    "Fès-Meknès", "Tanger-Tétouan-Al Hoceïma", "Souss-Massa",
    "Oriental", "Béni Mellal-Khénifra", "Drâa-Tafilalet"
]

GENDERS = ["MALE", "FEMALE"]

TITLES = [
    "Bélier de race {} à vendre",
    "Belle brebis {} disponible",
    "Agneau {} en bonne santé",
    "Mouton {} de qualité supérieure",
    "{} reproducteur à céder",
    "Lot de moutons {} à vendre",
    "Agnelle {} prête pour l'Aid",
    "Mâle {} de boucherie",
]

DESCRIPTIONS = [
    "Animal en excellente santé, vacciné et vermifugé. Elevé en plein air.",
    "Bel animal bien charnu, nourri aux céréales. Idéal pour l'Aid Al Adha.",
    "Reproducteur de qualité, issu d'un élevage familial traditionnel.",
    "Animal sain, pesé et certifié. Possibilité de livraison dans la région.",
    "Mouton robuste élevé à la ferme depuis sa naissance. Très bon tempérament.",
    "Belle bête bien entretenue. Alimentation naturelle et soins réguliers.",
]


def random_date_in_past(min_months=6, max_months=48):
    days_ago = random.randint(min_months * 30, max_months * 30)
    return date.today() - timedelta(days=days_ago)


def generate_annonce_payload():
    breed = random.choice(BREEDS)
    gender = random.choice(GENDERS)
    title_template = random.choice(TITLES)
    title = title_template.format(breed)[:200]

    weight = round(random.uniform(30.0, 120.0), 1)
    price = round(random.uniform(1500.0, 12000.0), 2)
    region = random.choice(REGIONS)
    birth_date = random_date_in_past()
    age_months = (date.today() - birth_date).days // 30

    has_delivery = random.choice([True, False])

    payload = {
        "title": title,
        "description": random.choice(DESCRIPTIONS),
        "breed": breed,
        "estimatedWeight": weight,
        "price": price,
        "priceNegotiable": random.choice([True, False]),
        "region": region,
        "gender": gender,
        "birthDate": birth_date.isoformat(),
        "ageMonths": age_months,
        "latitude": round(random.uniform(27.5, 35.9), 6),
        "longitude": round(random.uniform(-13.0, -1.0), 6),
        "addressLabel": f"Ferme, {region}",
        "deliveryAvailable": has_delivery,
        "deliveryRadiusKm": random.randint(10, 100) if has_delivery else 0,
        "deliveryPrice": round(random.uniform(50.0, 500.0), 2) if has_delivery else 0.0,
    }
    return payload


# ─── Authentification ─────────────────────────────────────────────────────────

def authenticate():
    print(f"[AUTH] Connexion avec {USERNAME}...")
    try:
        resp = requests.post(
            AUTH_URL,
            json={"phone": USERNAME, "password": PASSWORD},
            timeout=10
        )
        resp.raise_for_status()
        data = resp.json()

        # Adapte la clé selon ta réponse JSON ("token", "accessToken", "jwt"...)
        token = (
                data.get("token") or
                data.get("accessToken") or
                data.get("access_token") or
                data.get("jwt")
        )

        if not token:
            print(f"[AUTH] ❌ Token introuvable dans la réponse: {data}")
            return None

        print(f"[AUTH] ✅ JWT récupéré avec succès")
        print("token ",token)
        return token

    except requests.exceptions.HTTPError as e:
        print(f"[AUTH] ❌ Erreur HTTP {e.response.status_code}: {e.response.text}")
        return None
    except requests.exceptions.RequestException as e:
        print(f"[AUTH] ❌ Erreur réseau: {e}")
        return None


# ─── Création des annonces ────────────────────────────────────────────────────

def create_annonce(token: str, seller_id: str, payload: dict, index: int):
    headers = {
        "Authorization": f"Bearer {token}",
        "Content-Type": "application/json",
        "X-User-Id": seller_id,
    }
    try:
        resp = requests.post(ANNONCES_URL, json=payload, headers=headers, timeout=10)
        resp.raise_for_status()
        data = resp.json()
        print(f"  [{index}] ✅ Créée : {data.get('id', '?')} — {payload['title']}")
        return data
    except requests.exceptions.HTTPError as e:
        print(f"  [{index}] ❌ Erreur {e.response.status_code}: {e.response.text}")
        return None
    except requests.exceptions.RequestException as e:
        print(f"  [{index}] ❌ Erreur réseau: {e}")
        return None


# ─── Main ─────────────────────────────────────────────────────────────────────

def main():
    # Paramètres
    NOMBRE_ANNONCES = 20        # ← change selon tes besoins
    SELLER_ID = "cdc64936-bbd3-429c-bfbc-b4e19a2be9b8"  # ← UUID du vendeur (si tu le connais)
    PAUSE_ENTRE_REQUETES = 0.3  # secondes

    # 1. Authentification
    token = authenticate()
    if not token:
        print("\n[STOP] Impossible de continuer sans JWT.")
        return


if __name__ == "__main__":
    main()