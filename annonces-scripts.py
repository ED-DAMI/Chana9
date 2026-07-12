"""
Simulateur d'annonces - 10 annonces par minute
API: POST /api/v1/annonces
"""

import requests
import time
import random
import uuid
from datetime import datetime, timedelta
from typing import Optional

# ─── Configuration ────────────────────────────────────────────────────────────
BASE_URL = "http://localhost:8080"
ENDPOINT = f"{BASE_URL}/api/v1/annonces"
ANNONCES_PER_MINUTE = 10
INTERVAL_SECONDS = 60 / ANNONCES_PER_MINUTE  # 6 secondes entre chaque annonce

# IDs vendeurs de test (à remplacer par de vrais UUIDs)
SELLER_IDS = [
    "11111111-1111-1111-1111-111111111111",
    "22222222-2222-2222-2222-222222222222",
    "33333333-3333-3333-3333-333333333333",
]

# ─── Données de simulation ─────────────────────────────────────────────────────
BREEDS = [
    "Sardi", "Timahdite", "Beni Guil", "Boujaâd", "D'man",
    "Béni Ahsen", "Dokkali", "Méchoui", "Beni Snassen", "Oulad Jellal"
]

REGIONS = [
    "Casablanca-Settat", "Rabat-Salé-Kénitra", "Fès-Meknès",
    "Marrakech-Safi", "Tanger-Tétouan-Al Hoceïma", "Souss-Massa",
    "Drâa-Tafilalet", "Oriental", "Béni Mellal-Khénifra", "Guelmim-Oued Noun"
]

GENDERS = ["MALE", "FEMALE"]

TITLES = [
    "Beau mouton à vendre",
    "Mouton de qualité supérieure",
    "Excellent mouton pour Aid",
    "Mouton bien entretenu",
    "Mouton race pure disponible",
    "Grand mouton sain et fort",
    "Mouton idéal pour sacrifice",
    "Belle brebis reproductrice",
    "Mouton bien nourri à céder",
    "Agneau de lait disponible",
]

DESCRIPTIONS = [
    "Animal en parfaite santé, vacciné et vermifugé. Idéal pour les fêtes.",
    "Élevé en plein air, nourri naturellement. Poids certifié.",
    "Mouton de ferme, très docile. Livraison possible dans la région.",
    "Animal de qualité, suivi vétérinaire régulier. Prix à débattre.",
    "Bel animal bien charpenté, excellent pour la boucherie ou reproduction.",
    None,  # description optionnelle
]

# ─── Générateur d'annonce aléatoire ───────────────────────────────────────────
def generate_annonce() -> dict:
    birth_date = datetime.now() - timedelta(days=random.randint(90, 900))
    age_months = random.randint(3, 30)
    price = round(random.uniform(800, 5000), 2)
    delivery = random.choice([True, False])

    return {
        "title": random.choice(TITLES),
        "description": random.choice(DESCRIPTIONS),
        "breed": random.choice(BREEDS),
        "estimatedWeight": round(random.uniform(20.0, 120.0), 1),
        "price": price,
        "priceNegotiable": random.choice([True, False]),
        "region": random.choice(REGIONS),
        "gender": random.choice(GENDERS),
        "birthDate": birth_date.strftime("%Y-%m-%d"),
        "ageMonths": age_months,
        "latitude": round(random.uniform(27.5, 35.9), 6),
        "longitude": round(random.uniform(-13.0, -1.0), 6),
        "addressLabel": f"Ferme {random.choice(REGIONS)}",
        "deliveryAvailable": delivery,
        "deliveryRadiusKm": random.randint(10, 100) if delivery else 0,
        "deliveryPrice": round(random.uniform(50, 300), 2) if delivery else 0.0,
    }

# ─── Envoi d'une annonce ───────────────────────────────────────────────────────
def post_annonce(seller_id: str) -> Optional[dict]:
    payload = generate_annonce()
    headers = {
        "Content-Type": "application/json",
        "X-User-Id": seller_id,
    }

    try:
        response = requests.post(ENDPOINT, json=payload, headers=headers, timeout=10)
        if response.status_code == 201:
            data = response.json()
            print(f"  ✅ [{response.status_code}] Annonce créée — ID: {data.get('id', 'N/A')} | "
                  f"Race: {payload['breed']} | Prix: {payload['price']} MAD")
            return data
        else:
            print(f"  ❌ [{response.status_code}] Erreur — {response.text[:120]}")
            return None
    except requests.exceptions.ConnectionError:
        print(f"  🔴 Connexion refusée. Vérifiez que le serveur tourne sur {BASE_URL}")
        return None
    except requests.exceptions.Timeout:
        print(f"  ⏱️  Timeout — le serveur ne répond pas.")
        return None
    except Exception as e:
        print(f"  💥 Erreur inattendue: {e}")
        return None

# ─── Boucle principale ─────────────────────────────────────────────────────────
def run(total_annonces: int = None, minutes: int = None):
    """
    Paramètres :
      total_annonces : nombre total d'annonces à envoyer (None = infini)
      minutes        : durée en minutes (None = infini)
    """
    print("=" * 60)
    print("  🐑 Simulateur d'annonces — Chana9")
    print(f"  Rythme : {ANNONCES_PER_MINUTE} annonces/minute "
          f"(1 toutes les {INTERVAL_SECONDS}s)")
    print(f"  Endpoint : {ENDPOINT}")
    if total_annonces:
        print(f"  Objectif : {total_annonces} annonces")
    elif minutes:
        print(f"  Durée    : {minutes} minute(s)")
    else:
        print("  Mode     : infini (Ctrl+C pour arrêter)")
    print("=" * 60)

    sent = 0
    success = 0
    start_time = time.time()
    deadline = start_time + (minutes * 60) if minutes else None

    try:
        while True:
            # Vérification des conditions d'arrêt
            if total_annonces and sent >= total_annonces:
                break
            if deadline and time.time() >= deadline:
                break

            seller_id = random.choice(SELLER_IDS)
            print(f"\n[{sent + 1}] Envoi — Vendeur: {seller_id}")

            result = post_annonce(seller_id)
            if result:
                success += 1
            sent += 1

            # Attendre avant la prochaine annonce (sauf pour la dernière)
            if (not total_annonces or sent < total_annonces) and \
               (not deadline or time.time() < deadline):
                time.sleep(INTERVAL_SECONDS)

    except KeyboardInterrupt:
        print("\n\n⛔ Arrêt manuel demandé.")

    # ─── Résumé ───────────────────────────────────────────────────────────────
    elapsed = time.time() - start_time
    print("\n" + "=" * 60)
    print("  📊 Résumé de simulation")
    print(f"  Annonces envoyées : {sent}")
    print(f"  Succès            : {success}")
    print(f"  Échecs            : {sent - success}")
    print(f"  Durée totale      : {elapsed:.1f}s")
    if elapsed > 0:
        print(f"  Débit réel        : {sent / (elapsed / 60):.1f} annonces/min")
    print("=" * 60)


# ─── Point d'entrée ────────────────────────────────────────────────────────────
if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Simulateur d'annonces Chana9")
    parser.add_argument(
        "--total", type=int, default=None,
        help="Nombre total d'annonces à envoyer (défaut: infini)"
    )
    parser.add_argument(
        "--minutes", type=int, default=None,
        help="Durée de simulation en minutes (défaut: infini)"
    )
    parser.add_argument(
        "--url", type=str, default=BASE_URL,
        help=f"URL de base de l'API (défaut: {BASE_URL})"
    )
    args = parser.parse_args()

    if args.url != BASE_URL:
        ENDPOINT = f"{args.url}/api/v1/annonces"

    run(total_annonces=args.total, minutes=args.minutes)