# Chana9 Mobile 📱

Application Flutter pour le marché marocain du bétail.

---

## Table des matières

- [Architecture](#architecture)
- [Structure du projet](#structure-du-projet)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Configuration](#configuration)
- [Fonctionnalités](#fonctionnalités)
- [Packages principaux](#packages-principaux)
- [Localisation](#localisation)
- [Conventions](#conventions)

---

## Architecture

Le projet suit une **Clean Architecture stricte en 3 couches** :

```
Presentation → Domain ← Data
```

### Couches

| Couche | Rôle | Contenu |
|---|---|---|
| **Domain** | Logique métier pure | Entités, Use Cases, Repository interfaces |
| **Data** | Accès aux données | Models, DataSources, Repository implementations |
| **Presentation** | UI + état | BLoC, Pages, Widgets |

### Règles strictes
- Le **Domain** ne dépend d'aucune autre couche
- La **Data** implémente les interfaces du Domain
- La **Presentation** appelle uniquement les Use Cases
- Aucune logique métier dans les widgets
- Aucune couleur hardcodée — toujours `Theme.of(context).colorScheme`

---

## Structure du projet

```
lib/
├── core/
│   ├── constants/          # ApiConstants, AppLocale, MoroccoRegions
│   ├── error/              # Failure (freezed)
│   ├── network/            # DioClient, TokenStorage, Interceptors
│   ├── theme/              # AppTheme
│   └── usecases/           # UseCase<Type, Params> base class
│
├── features/
│   ├── annonces/           # Module annonces
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/     # Freezed + json_serializable
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/   # Freezed
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── bloc/       # AnnonceBloc + AnnonceDetailBloc
│   │       ├── pages/
│   │       └── widgets/
│   │
│   ├── auth/               # Module authentification
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │       ├── bloc/       # AuthBloc
│   │       └── pages/      # Login, Register, Splash, ChangePassword
│   │
│   ├── profile/            # Module profil + dashboard vendeur
│   │   ├── data/
│   │   │   ├── datasources/ # StatsRemoteDataSource
│   │   │   ├── models/      # 6 models Freezed
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/    # 4 entités stats
│   │   │   ├── repositories/
│   │   │   └── usecases/    # 4 use cases stats
│   │   └── presentation/
│   │       ├── bloc/        # StatsDashboardBloc
│   │       ├── pages/       # ProfilePage, MyAnnoncesPage
│   │       └── widgets/     # KPI, Chart, Revenue, AnnonceStats
│   │
│   ├── messaging/          # Module chat (en cours)
│   └── sequestre/          # Module paiement séquestre
│
├── shared/
│   ├── bloc/               # LocaleBloc (i18n)
│   ├── enums/              # AnimalBreed, AnimalGender, AnnonceStatus...
│   ├── localization/       # locale_labels.dart
│   ├── model/              # PaginatedResponse<T>
│   └── widgets/            # CustomButton, ErrorWidget, LanguageSelector
│
├── l10n/                   # Traductions FR / AR
├── injection_container.dart
└── main.dart
```

---

## Prérequis

| Outil | Version minimale |
|---|---|
| Flutter | 3.0.0 |
| Dart | 3.0.0 |
| Android SDK | 36 |
| Java | 17 |

---

## Installation

### 1. Cloner le repo

```bash
git clone https://github.com/ED-DAMI/Chana9.git
cd Chana9/mobile
```

### 2. Installer les dépendances

```bash
flutter pub get
```

### 3. Générer les fichiers Freezed

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Lancer l'application

```bash
flutter run
```

---

## Configuration

### Variables d'environnement

Dans `lib/core/constants/api_constants.dart` :

```dart
class ApiConstants {
  static const String baseUrl = 'http://TON_IP:8080';
  static const String storageBaseUrl = 'http://TON_IP/uploads';
}
```

> Remplace `TON_IP` par l'IP de ton serveur (ex: `192.168.1.155`).

### Android — Permissions requises

Dans `android/app/src/main/AndroidManifest.xml` :

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
<uses-permission android:name="android.permission.INTERNET"/>
```

### Android — SDK

Dans `android/app/build.gradle.kts` :

```kotlin
android {
    compileSdk = 36
    defaultConfig {
        minSdk = 21
        targetSdk = 36
    }
}
```

---

## Fonctionnalités

### 🔐 Authentification
- Connexion par téléphone + mot de passe
- Inscription avec rôle (Vendeur / Acheteur)
- Changement de mot de passe
- Persistance de session via `flutter_secure_storage`
- Refresh token automatique

### 📋 Annonces
- Liste avec pagination infinie (scroll infini)
- Recherche et filtres avancés :
  - Race, région, ville, prix min/max, poids, genre
  - Livraison disponible, prix négociable, éligible aide
  - Top Lot uniquement
- Détail complet : photos, caractéristiques, localisation, services
- Création en 4 étapes (Stepper) :
  1. Photos (jusqu'à 5)
  2. Animal (race, âge, poids, dentition, ONSSA...)
  3. Prix & détails
  4. Localisation avec GPS automatique
- Modification, suspension, réactivation, marquage vendu
- Suppression avec confirmation
- Signalement avec motif
- Favoris

### 📍 Localisation GPS
- Détection automatique de la position
- Mapping GPS → région/ville marocaine officielle
- Dropdowns cascadés région → ville (12 régions, toutes les villes)

### 👤 Profil
- Header avec avatar, nom, téléphone, rôle, statut KYC
- Menu : Mes annonces, Favoris, Alertes, Déconnexion

### 📊 Dashboard Vendeur (rôle SELLER uniquement)
- **KPIs globaux** (grille 2×2, animation compteur) :
  - Vues totales, Favoris, Contacts, Taux de contact
- **Chiffre d'affaires** par période (Semaine / Mois / Année) :
  - Montant total, nombre vendus, prix moyen
  - Dates de début et fin
- **Graphique** de revenus (LineChart fl_chart) :
  - Tooltip au tap (date + montant + nb vendus)
  - Animation d'apparition
- **Stats par annonce** :
  - Photo, titre, badge statut coloré
  - Vues, favoris, contacts
  - Prix et date de vente
- Pull-to-refresh complet
- Skeleton loader pendant le chargement

### 🌍 Localisation
- Français et Arabe
- Sélecteur de langue dans toutes les pages
- Direction RTL automatique en arabe

---

## Packages principaux

| Package | Version | Usage |
|---|---|---|
| `flutter_bloc` | ^9.1.1 | State management |
| `go_router` | ^17.3.0 | Navigation |
| `dio` | ^5.4.0 | HTTP client |
| `get_it` | ^7.6.4 | Injection de dépendances |
| `dartz` | ^0.10.1 | Either (gestion erreurs) |
| `freezed` | ^3.1.0 | Immutabilité + unions |
| `json_serializable` | ^6.7.1 | Sérialisation JSON |
| `flutter_secure_storage` | — | Stockage sécurisé tokens |
| `cached_network_image` | ^3.3.1 | Images réseau avec cache |
| `image_picker` | — | Sélection photos |
| `geolocator` | ^13.0.0 | GPS |
| `geocoding` | ^3.0.0 | GPS → adresse |
| `fl_chart` | ^0.68.0 | Graphiques |
| `intl` | ^0.19.0 | Formatage dates/nombres |

---

## Localisation

Deux langues supportées : **Français** (`fr`) et **Arabe** (`ar`).

Fichiers dans `lib/l10n/` :
- `app_fr.arb` — traductions françaises
- `app_ar.arb` — traductions arabes

### Ajouter une traduction

1. Ajouter la clé dans `app_fr.arb` et `app_ar.arb`
2. Régénérer :
```bash
flutter gen-l10n
```
3. Utiliser dans le code :
```dart
final l10n = AppLocalizations.of(context);
Text(l10n.maCle)
```

---

## Conventions

### Nommage des commits

```
feat(module): description courte
fix(module): description courte
refactor(module): description courte
chore: description courte
```

**Exemples :**
```
feat(annonces): add GPS auto-detection for address and region fields
fix(stats): align Flutter API endpoints with backend routes
refactor(bloc): separate detail bloc from list bloc to preserve list state
```

### Nommage des fichiers

```
snake_case.dart          # tous les fichiers Dart
feature_name_bloc.dart   # BLoC
feature_name_model.dart  # Models
feature_name_page.dart   # Pages
feature_name_widget.dart # Widgets
```

### Règles BLoC

- Un BLoC par responsabilité (ex: `AnnonceBloc` ≠ `AnnonceDetailBloc`)
- Les états Freezed avec `whenOrNull` / `maybeWhen`
- Jamais de `context.read<>` dans un widget `build()`

### Gestion des erreurs

Toutes les erreurs remontent via `Failure` (dartz `Either`) :

```dart
// Repository
Either<Failure, T> → Right(data) ou Left(Failure.server(...))

// BLoC
result.fold(
  (f) => emit(State.error(f.message)),
  (data) => emit(State.loaded(data)),
)
```

---

## Contributeurs

- **ED-DAMI** — Développeur principal

---

## Licence

Projet privé — tous droits réservés © 2025 Chana9
