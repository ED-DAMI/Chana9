#!/usr/bin/env python3

import requests
import random
import mimetypes
from datetime import date, timedelta
from time import sleep
from pathlib import Path

BASE_URL = "http://localhost:8080"
AUTH_URL = f"{BASE_URL}/api/v1/auth/login"
ANNONCES_URL = f"{BASE_URL}/api/v1/annonces"

USERS = [
    {"phone": "0611111111", "password": "password123", "name": "Ahmed Benali"},
    {"phone": "0622222222", "password": "password456", "name": "Sara El Amrani"},
    {"phone": "0633333333", "password": "password789", "name": "Youssef Alaoui"},
]

PHOTOS_DIR = Path("./mouton")

ANNONCES_PAR_UTILISATEUR = 5
PAUSE_ENTRE_REQUETES = 0.4
PAUSE_ENTRE_PHOTOS = 0.2
MIN_PHOTOS_PAR_ANNONCE = 1
MAX_PHOTOS_PAR_ANNONCE = 3

BREEDS = [
    "SARDI",
    "TIMAHDITE",
    "BENI_GUIL",
    "D_MAN",
    "BOUJAAD",
    "BERGUI",
    "DRAA",
    "NOIR_DU_SUD",
    "ATLAS",
    "OULMES_ZAER",
    "NOIR_PIE",
    "BRUNE_ATLAS",
    "CROSSBRED",
    "OTHER",
]

DENTITIONS = [
    "MILK_TEETH",
    "TWO_TEETH",
    "FOUR_TEETH",
    "SIX_TEETH",
    "FULL_MOUTH",
]

PRICE_TYPES = ["FIXED", "NEGOTIABLE", "PER_KG"]

REGIONS = [
    "Casablanca-Settat",
    "Rabat-Salé-Kénitra",
    "Marrakech-Safi",
    "Fès-Meknès",
    "Tanger-Tétouan-Al Hoceïma",
    "Souss-Massa",
    "Oriental",
    "Béni Mellal-Khénifra",
    "Drâa-Tafilalet",
]

GENDERS = ["MALE", "FEMALE"]

BREED_LABELS = {
    "SARDI": "Sardi",
    "TIMAHDITE": "Timahdite",
    "BENI_GUIL": "Beni Guil",
    "D_MAN": "D'man",
    "BOUJAAD": "Boujaad",
    "BERGUI": "Bergui",
    "DRAA": "Drâa",
    "NOIR_DU_SUD": "Noir du Sud",
    "ATLAS": "Atlas",
    "OULMES_ZAER": "Oulmès Zaer",
    "NOIR_PIE": "Noir Pie",
    "BRUNE_ATLAS": "Brune Atlas",
    "CROSSBRED": "Croisé",
    "OTHER": "Autre",
}

TITLES = [
    "Bélier de race {} à vendre",
    "Belle brebis {} disponible",
    "Agneau {} en bonne santé",
    "Mouton {} de qualité supérieure",
    "{} reproducteur à céder",
    "Lot de moutons {} à vendre",
]

DESCRIPTIONS = [
    "Animal en excellente santé, vacciné et bien entretenu.",
    "Bel animal bien charnu, nourri naturellement.",
    "Reproducteur de qualité, issu d'un élevage familial.",
    "Animal sain avec suivi régulier.",
    "Bête robuste élevée à la ferme depuis sa naissance.",
    "Très bon état général, disponible immédiatement.",
]


def random_birth_date(min_months=6, max_months=48):
    days_ago = random.randint(min_months * 30, max_months * 30)
    return date.today() - timedelta(days=days_ago)


def generate_annonce_payload():
    breed = random.choice(BREEDS)
    breed_label = BREED_LABELS.get(breed, breed)
    title = random.choice(TITLES).format(breed_label)[:200]

    region = random.choice(REGIONS)
    birth_date = random_birth_date()

    has_delivery = random.choice([True, False])
    has_boarding = random.choice([True, False])
    price_type = random.choice(PRICE_TYPES)

    payload = {
        "title": title,
        "description": random.choice(DESCRIPTIONS),
        "breed": breed,
        "gender": random.choice(GENDERS),
        "birthDate": birth_date.isoformat(),
        "weightKg": round(random.uniform(30.0, 120.0), 1),
        "dentition": random.choice(DENTITIONS),
        "price": round(random.uniform(1500.0, 12000.0), 2),
        "priceType": price_type,
        "priceNegotiable": price_type == "NEGOTIABLE",
        "headCount": random.randint(1, 5),
        "region": region,
        "addressLabel": f"Ferme, {region}",
        "latitude": round(random.uniform(27.5, 35.9), 6),
        "longitude": round(random.uniform(-13.0, -1.0), 6),
        "deliveryAvailable": has_delivery,
        "deliveryPrice": round(random.uniform(50.0, 500.0), 2) if has_delivery else None,
        "boardingAvailable": has_boarding,
        "boardingDailyPrice": round(random.uniform(10.0, 80.0), 2) if has_boarding else None,
    }

    return payload


def extract_token(response_json):
    source = response_json.get("data", response_json)
    if isinstance(source, dict):
        return (
                source.get("token")
                or source.get("accessToken")
                or source.get("access_token")
                or source.get("jwt")
        )
    return None


def extract_data(response_json):
    return response_json.get("data", response_json)


def list_photo_files():
    if not PHOTOS_DIR.exists() or not PHOTOS_DIR.is_dir():
        print(f"[PHOTO] ❌ Dossier introuvable: {PHOTOS_DIR.resolve()}")
        return []
    exts = {".jpg", ".jpeg", ".png", ".webp"}
    return sorted(p for p in PHOTOS_DIR.iterdir() if p.is_file() and p.suffix.lower() in exts)


def authenticate(phone: str, password: str, name: str):
    print(f"[AUTH] Connexion avec {name} ({phone})...")
    try:
        resp = requests.post(AUTH_URL, json={"phone": phone, "password": password}, timeout=15)
        print(f"[AUTH-DEBUG] status={resp.status_code}")
        print(f"[AUTH-DEBUG] response={resp.text}")
        resp.raise_for_status()

        token = extract_token(resp.json())
        if not token:
            print(f"[AUTH] ❌ Token introuvable pour {name}")
            return None

        print(f"[AUTH] ✅ JWT récupéré pour {name}")
        return token

    except requests.exceptions.HTTPError as e:
        print(f"[AUTH] ❌ Erreur HTTP {e.response.status_code} pour {name}: {e.response.text}")
    except requests.exceptions.RequestException as e:
        print(f"[AUTH] ❌ Erreur réseau pour {name}: {e}")
    except ValueError as e:
        print(f"[AUTH] ❌ Réponse JSON invalide pour {name}: {e}")
    return None


def create_annonce(token: str, payload: dict, index: int, owner_name: str):
    headers = {
        "Authorization": f"Bearer {token}",
        "Content-Type": "application/json",
    }
    try:
        resp = requests.post(ANNONCES_URL, json=payload, headers=headers, timeout=15)
        print(f"  [CREATE-DEBUG] status={resp.status_code}")
        print(f"  [CREATE-DEBUG] response={resp.text}")
        resp.raise_for_status()

        annonce = extract_data(resp.json())
        print(f"  [{index}] ✅ {owner_name} → annonce créée : {annonce.get('id')} — {payload['title']}")
        return annonce

    except requests.exceptions.HTTPError as e:
        print(f"  [{index}] ❌ {owner_name} → Erreur {e.response.status_code}: {e.response.text}")
        print(f"      Payload envoyé: {payload}")
    except requests.exceptions.RequestException as e:
        print(f"  [{index}] ❌ {owner_name} → Erreur réseau: {e}")
    except ValueError as e:
        print(f"  [{index}] ❌ {owner_name} → Réponse JSON invalide: {e}")
    return None


def upload_photo(token: str, annonce_id: str, photo_path: Path, owner_name: str):
    url = f"{ANNONCES_URL}/{annonce_id}/medias"
    headers = {"Authorization": f"Bearer {token}"}
    mime_type, _ = mimetypes.guess_type(photo_path.name)
    if mime_type is None:
        mime_type = "image/jpeg"

    try:
        with open(photo_path, "rb") as f:
            resp = requests.post(url, headers=headers, files={"file": (photo_path.name, f, mime_type)}, timeout=30)
            print(f"      [UPLOAD-DEBUG] file={photo_path.name} mime={mime_type} status={resp.status_code}")
            print(f"      [UPLOAD-DEBUG] response={resp.text}")
            resp.raise_for_status()
            print(f"      📷 ✅ Photo uploadée pour {owner_name}: {photo_path.name}")
            return extract_data(resp.json())

    except requests.exceptions.HTTPError as e:
        print(f"      📷 ❌ Erreur upload {photo_path.name} ({e.response.status_code}): {e.response.text}")
    except requests.exceptions.RequestException as e:
        print(f"      📷 ❌ Erreur réseau upload {photo_path.name}: {e}")
    except ValueError as e:
        print(f"      📷 ❌ Réponse JSON invalide pour {photo_path.name}: {e}")
    return None


def upload_photos_for_annonce(token: str, annonce_id: str, owner_name: str):
    photo_files = list_photo_files()
    if not photo_files:
        print("      📷 ⚠️ Aucune photo trouvée dans le dossier mouton/")
        return 0, 0

    count = random.randint(
        min(MIN_PHOTOS_PAR_ANNONCE, len(photo_files)),
        min(MAX_PHOTOS_PAR_ANNONCE, len(photo_files)),
    )
    success, failed = 0, 0
    for photo in random.sample(photo_files, count):
        if upload_photo(token, annonce_id, photo, owner_name):
            success += 1
        else:
            failed += 1
        sleep(PAUSE_ENTRE_PHOTOS)

    return success, failed


def main():
    total_annonces_ok = 0
    total_annonces_ko = 0
    total_photos_ok = 0
    total_photos_ko = 0

    photo_files = list_photo_files()
    print("\n[START] Création des annonces + upload photos")
    print(f"[INFO] Utilisateurs      : {len(USERS)}")
    print(f"[INFO] Annonces/user     : {ANNONCES_PAR_UTILISATEUR}")
    print(f"[INFO] Photos disponibles: {len(photo_files)} dans {PHOTOS_DIR.resolve()}\n")

    for user in USERS:
        token = authenticate(user["phone"], user["password"], user["name"])
        if not token:
            print(f"[SKIP] Impossible de continuer pour {user['name']}\n")
            continue

        print(f"\n[CREATE] {ANNONCES_PAR_UTILISATEUR} annonces pour {user['name']}\n")

        for i in range(1, ANNONCES_PAR_UTILISATEUR + 1):
            payload = generate_annonce_payload()
            annonce = create_annonce(token, payload, i, user["name"])

            if annonce:
                total_annonces_ok += 1
                annonce_id = annonce.get("id")
                if annonce_id:
                    s, f = upload_photos_for_annonce(token, annonce_id, user["name"])
                    total_photos_ok += s
                    total_photos_ko += f
                else:
                    print("      📷 ❌ ID annonce introuvable, upload ignoré")
            else:
                total_annonces_ko += 1

            sleep(PAUSE_ENTRE_REQUETES)

        print()

    print("[END] Terminé.")
    print(f"✅ Annonces créées  : {total_annonces_ok}")
    print(f"❌ Annonces échouées: {total_annonces_ko}")
    print(f"📷 Photos uploadées : {total_photos_ok}")
    print(f"📷 Photos échouées  : {total_photos_ko}")


if __name__ == "__main__":
    main()