# 🐑 Chana9 — Application Mobile

> Marketplace marocaine de bétail — Flutter · Clean Architecture · BLoC · Dio · Freezed · Dartz

---

## 📋 Table des matières

- [Présentation](#présentation)
- [Stack technique](#stack-technique)
- [Architecture](#architecture)
- [Structure du projet](#structure-du-projet)
- [Features implémentées](#features-implémentées)
- [Installation](#installation)
- [Configuration](#configuration)
- [Génération de code](#génération-de-code)
- [Conventions](#conventions)
- [Roadmap](#roadmap)

---

## Présentation

**Chana9** est une application mobile Flutter permettant aux éleveurs et acheteurs marocains d'acheter et vendre du bétail (moutons, bovins, caprins) en ligne.

### Fonctionnalités actuelles

- Authentification par téléphone + mot de passe
- Persistance de session (JWT + cache utilisateur)
- Feed d'annonces style Facebook avec carousel photos
- Création / édition d'annonces en 4 étapes avec upload photos
- Filtres de recherche avancés avec localisation automatique GPS
- Système de favoris avec compteur temps réel
- Signalement d'annonces
- Profil utilisateur avec KYC, avatar, sessions actives
- Changement de mot de passe
- Déblocage de contact payant (20 DH)
- Internationalisation 4 langues : Français · Anglais · Arabe · Tamazight
- Navigation fluide avec GoRouter

---

## Stack technique

| Couche | Technologie | Version |
|---|---|---|
| Framework | Flutter / Dart | SDK >=3.0.0 |
| State management | flutter_bloc | ^9.1.1 |
| Navigation | go_router | ^17.3.0 |
| HTTP client | dio | ^5.4.0 |
| Injection de dépendances | get_it | ^7.6.4 |
| Programmation fonctionnelle | dartz | ^0.10.1 |
| Génération de code | freezed + json_serializable | ^3.1.0 / ^6.7.1 |
| Stockage sécurisé | flutter_secure_storage | ^10.3.1 |
| Images réseau | cached_network_image | ^3.3.0 |
| Sélection photos | image_picker | ^1.0.0 |
| Géolocalisation | geolocator + geocoding | — |
| Notifications push | firebase_messaging | ^16.4.1 |
| Internationalisation | flutter_localizations + intl | — |
| Backend | Spring Boot (Java) — API REST JSON | — |

---

## Architecture

Le projet suit la **Clean Architecture** en 3 couches strictement séparées :

```
Presentation  →  Domain  ←  Data
    BLoC           Entities      Models (JSON)
    Pages          UseCases      RemoteDataSource
    Widgets        Repository    RepositoryImpl
                   (interface)
```

### Flux de données

```
UI (Page)
  │  dispatch Event
  ▼
BLoC
  │  appelle UseCase
  ▼
UseCase  →  Either<Failure, T>
  │  appelle Repository (interface)
  ▼
RepositoryImpl
  │  appelle RemoteDataSource
  ▼
DioClient  ──►  API Spring Boot
  │
  ▼
Model.fromJson()  →  .toEntity()  →  State  →  UI
```

### Gestion des erreurs

```dart
// Tous les cas HTTP sont mappés automatiquement
Left(Failure.server('Message backend'))     // 400, 409, 422, 500
Left(Failure.unauthorized())                // 401 → redirect /login
Left(Failure.notFound())                    // 404
Left(Failure.network('Pas de connexion'))   // timeout, no internet
```

---

## Structure du projet

```
lib/
├── main.dart
├── injection_container.dart
│
├── core/
│   ├── constants/
│   │   ├── api_constants.dart
│   │   └── morocco_regions.dart           ← régions et villes marocaines centralisées
│   ├── error/
│   │   └── failure.dart
│   ├── network/
│   │   ├── dio_client.dart
│   │   ├── dio_client_factory.dart
│   │   ├── token_storage.dart
│   │   └── interceptors/
│   │       └── auth_interceptor.dart
│   ├── theme/
│   │   └── app_theme.dart
│   ├── usecases/
│   │   └── usecase.dart
│   └── utils/
│       └── storage_service.dart
│
├── l10n/
│   ├── app_en.arb                         ← Anglais
│   ├── app_fr.arb                         ← Français
│   ├── app_ar.arb                         ← Arabe
│   ├── app_zgh.arb                        ← Tamazight (Tifinagh)
│   ├── app_localizations.dart
│   ├── app_localizations_en.dart
│   ├── app_localizations_fr.dart
│   ├── app_localizations_ar.dart
│   └── app_localizations_zgh.dart
│
├── shared/
│   ├── bloc/
│   │   ├── locale_bloc.dart               ← gestion langue active
│   │   ├── locale_event.dart
│   │   └── locale_state.dart
│   ├── enums/
│   │   ├── annonce_status.dart            ← ACTIVE·RESERVED·SOLD·EXPIRED·SUSPENDED
│   │   ├── animal_breed.dart              ← 25 races avec label + value backend
│   │   ├── animal_dentition.dart          ← MILK_TEETH·TWO_TEETH·...·FULL_MOUTH
│   │   ├── animal_gender.dart             ← MALE·FEMALE
│   │   ├── price_type.dart                ← FIXED·NEGOTIABLE·PER_KG
│   │   ├── report_reason.dart             ← FRAUD_OR_SCAM·...·OTHER
│   │   └── role.dart                      ← BUYER·SELLER·ADMIN
│   ├── localization/
│   │   └── locale_labels.dart             ← helpers localizedRegion · extensions
│   ├── model/paginated/
│   │   └── paginated_response.dart
│   └── widgets/
│       ├── custom_button.dart
│       ├── error_widget.dart
│       ├── language_selector.dart
│       └── loading_widget.dart
│
└── features/
    ├── auth/                              ← ✅ implémenté
    ├── annonces/                          ← ✅ implémenté
    ├── profile/                           ← ✅ implémenté
    ├── messaging/                         ← 🔲 placeholder
    └── sequestre/                         ← 🔲 placeholder
```

---

## Features implémentées

### 🔐 Auth

```
lib/features/auth/
├── auth_injection.dart
├── data/
│   ├── datasources/    auth_remote_datasource.dart
│   ├── models/         LoginRequestModel · AuthResponseModel · UserModel
│   └── repositories/   auth_repository_impl.dart
├── domain/
│   ├── entities/       User · AuthResult
│   ├── repositories/   auth_repository.dart
│   └── usecases/       Login · Logout · GetCurrentUser · CheckAuthStatus
└── presentation/
    ├── bloc/           AuthBloc (checkStatus · login · logout)
    ├── pages/          SplashPage · LoginPage · RegisterPage
    └── widgets/        PhoneField · PasswordField
```

**Flux d'authentification :**
```
Démarrage → SplashPage → hasToken() ?
                ├── oui → getCachedUser() → /annonces
                └── non → /login → POST /api/v1/auth/login
                              → saveTokens() + saveUser() → /annonces
```

---

### 📢 Annonces

```
lib/features/annonces/
├── annonces_injection.dart
├── data/
│   ├── datasources/    annonce_remote_datasource.dart
│   ├── models/         AnnonceModel · AnnonceMediaModel
│   │                   AnnonceRequestModel · AnnonceSearchRequestModel
│   │                   AnnonceAlertRequestModel · AnnonceReportRequestModel
│   └── repositories/   annonce_repository_impl.dart
├── domain/
│   ├── entities/       Annonce · AnnonceMedia
│   ├── repositories/   annonce_repository.dart
│   └── usecases/       20 use cases
└── presentation/
    ├── bloc/           AnnonceBloc · AnnonceDetailBloc
    ├── pages/          AnnonceListPage · AnnonceDetailPage
    │                   AnnonceFormPage · FavoritesPage
    └── widgets/        AnnoncePostCard · AnnoncePhotoCarousel
                        AnnoncePostHeader · AnnoncePostInfo
                        AnnoncePostActions · AnnonceFilterSheet
                        ReportSheet
```

**Endpoints couverts :**

| Méthode | Endpoint | UseCase |
|---|---|---|
| POST | `/api/v1/annonces` | CreateAnnonce |
| PUT | `/api/v1/annonces/{id}` | UpdateAnnonce |
| DELETE | `/api/v1/annonces/{id}` | DeleteAnnonce |
| GET | `/api/v1/annonces/{id}` | GetAnnonceById |
| GET | `/api/v1/annonces/search` | SearchAnnonces |
| GET | `/api/v1/annonces/seller/{id}` | GetAnnoncesBySeller |
| PATCH | `/api/v1/annonces/{id}/suspend` | SuspendAnnonce |
| PATCH | `/api/v1/annonces/{id}/reactivate` | ReactivateAnnonce |
| PATCH | `/api/v1/annonces/{id}/sold` | MarkAsSold |
| POST | `/api/v1/annonces/{id}/top-lot/{days}` | ActivateTopLot |
| POST | `/api/v1/annonces/{id}/reports` | ReportAnnonce |
| POST | `/api/v1/annonces/{id}/favorites` | AddFavorite |
| DELETE | `/api/v1/annonces/{id}/favorites` | RemoveFavorite |
| GET | `/api/v1/annonces/favorites` | GetFavorites |
| POST | `/api/v1/annonces/alerts` | CreateAlert |
| DELETE | `/api/v1/annonces/alerts/{id}` | DeleteAlert |
| GET | `/api/v1/annonces/alerts` | GetAlertsByBuyer |
| POST | `/api/v1/annonces/{id}/medias` | UploadMedia (multipart) |
| POST | `/api/v1/annonces/{id}/contact/initiate` | InitiateContactUnlock |
| GET | `/api/v1/annonces/{id}/contact` | GetContactUnlock |

**UI Annonces :**
```
AnnonceListPage
  └── ListView vertical
        └── AnnoncePostCard (style Facebook)
              ├── AnnoncePostHeader    avatar vendeur · date relative · région localisée
              ├── AnnoncePhotoCarousel PageView + dots animés + compteur 1/N
              ├── AnnoncePostInfo      prix · badges · chips (race/poids/âge/dentition)
              ├── Description          2 lignes + "Voir plus" animé
              └── AnnoncePostActions   ❤️ Favori · 💬 Contacter · ↗️ Partager · 🚩 Signaler

AnnonceDetailPage
  ├── SliverAppBar     carousel photos + menu actions (suspend/sold/edit/delete)
  ├── Caractéristiques race · genre · âge · poids · dentition · têtes · ONSSA
  ├── Localisation     région · ville · distance · adresse
  ├── Services         livraison · pension (boarding)
  ├── Description      texte complet
  └── BottomBar        💬 Message · 📞 Appeler (déblocage 20 DH)

AnnonceFormPage (Stepper 4 étapes)
  ├── Étape 1 : Photos    grille · galerie/caméra · max 5 photos
  ├── Étape 2 : Animal    race · genre · poids · âge · dentition · ONSSA · têtes
  ├── Étape 3 : Annonce   titre · prix · type prix · négociable · description
  └── Étape 4 : Lieu      GPS auto · région · ville · adresse · livraison

AnnonceFilterSheet (DraggableScrollableSheet)
  ├── Race              FilterChip localisé (25 races)
  ├── Région            FilterChip localisé (12 régions)
  ├── Prix (MAD)        min / max
  ├── Poids (kg)        min / max
  ├── Genre             SegmentedButton
  └── Options           livraison · négociable · aides · top lot
```

---

### 👤 Profil

```
lib/features/profile/
├── data/
│   ├── datasources/    user_remote_datasource.dart
│   ├── models/         UserModel · UserStatsModel · UpdateProfileRequestModel
│   └── repositories/   user_repository_impl.dart
├── domain/
│   ├── entities/       User · UserStats
│   ├── repositories/   user_repository.dart
│   └── usecases/       GetProfile · UpdateProfile · UploadAvatar
│                       GetUserStats · ChangePassword
└── presentation/
    └── pages/          ProfilePage · MyAnnoncesPage
```

**Endpoints couverts :**

| Méthode | Endpoint | Description |
|---|---|---|
| GET | `/api/v1/users/me` | Profil courant |
| PUT | `/api/v1/users/me` | Modifier profil |
| GET | `/api/v1/users/{id}` | Profil public |
| GET | `/api/v1/users/{id}/stats` | Stats vendeur |
| POST | `/api/v1/users/me/avatar` | Upload avatar |
| DELETE | `/api/v1/users/me/avatar` | Supprimer avatar |
| PUT | `/api/v1/users/me/password` | Changer mot de passe |
| GET | `/api/v1/users/me/sessions` | Sessions actives |
| DELETE | `/api/v1/users/me/sessions` | Révoquer toutes les sessions |
| POST | `/api/v1/users/me/kyc` | Soumettre KYC |
| GET | `/api/v1/users/me/kyc` | Statut KYC |

---

## Navigation

```dart
/splash                      → SplashPage
/login                       → LoginPage
/annonces                    → AnnonceListPage
/annonces/new                → AnnonceFormPage (création)
/annonces/:id                → AnnonceDetailPage
/profile                     → ProfilePage
/profile/my-annonces/:id     → MyAnnoncesPage
/profile/favorites           → FavoritesPage
```

---

## Internationalisation

L'application supporte 4 langues configurables depuis le profil :

| Langue | Code | Script |
|---|---|---|
| Français | `fr` | Latin |
| Anglais | `en` | Latin |
| Arabe | `ar` | RTL |
| Tamazight | `zgh` | Tifinagh |

La langue est persistée dans `flutter_secure_storage` et restaurée au démarrage via `LocaleBloc`.

Les races (`AnimalBreed`), dentitions (`AnimalDentition`) et régions marocaines sont entièrement localisées.

```dart
// Sérialisation backend — les enums utilisent @JsonEnum(valueField: 'value')
AnimalBreed.beniGuil.value  // → 'BENI_GUIL' (envoyé au backend)
AnimalBreed.beniGuil.label  // → 'Béni Guil' (affiché dans l'UI)
```

---

## Installation

```bash
# 1. Cloner
git clone https://github.com/ED-DAMI/Chana9.git
cd ma_chana9_app

# 2. Dépendances
flutter pub get

# 3. Générer le code freezed + json_serializable
dart run build_runner build --delete-conflicting-outputs

# 4. Lancer
flutter run
```

---

## Configuration

### URL backend — `lib/core/network/dio_client_factory.dart`

```dart
static const String _baseUrl = 'https://api.chana9.ma';
```

### Firebase

```
android/app/google-services.json
ios/Runner/GoogleService-Info.plist
```

### Enums Spring Boot → Flutter

| Java | Flutter | Backend value |
|---|---|---|
| `ACTIVE` | `AnnonceStatus.active` | `'ACTIVE'` |
| `MALE` | `AnimalGender.male` | `'MALE'` |
| `SARDI` | `AnimalBreed.sardi` | `'SARDI'` |
| `MILK_TEETH` | `AnimalDentition.milkTeeth` | `'MILK_TEETH'` |
| `FIXED` | `PriceType.fixed` | `'FIXED'` |
| `SELLER` | `Role.seller` | `'SELLER'` |

### Types Java → Dart

| Java | Dart |
|---|---|
| `UUID` | `String` |
| `BigDecimal` | `double` |
| `LocalDate` | `String` (ISO yyyy-MM-dd) |
| `LocalDateTime` | `DateTime?` |
| `Boolean` | `bool?` |

---

## Génération de code

```bash
# Build unique
dart run build_runner build --delete-conflicting-outputs

# Watch (rebuild auto)
dart run build_runner watch --delete-conflicting-outputs
```

**Fichiers générés — ne pas modifier :**
```
*.freezed.dart    ← freezed
*.g.dart          ← json_serializable
```

---

## Conventions

### Règle freezed 3.x — obligatoire

```dart
// ✅ correct
@freezed
abstract class MaClasse with _$MaClasse { ... }

// ❌ erreur de compilation
@freezed
class MaClasse with _$MaClasse { ... }
```

### Enums avec valeur backend

```dart
// ✅ correct — utiliser .value pour envoyer au backend
'breed': _selectedBreed?.value,   // → 'BENI_GUIL'

// ❌ incorrect — .name retourne le nom Dart camelCase
'breed': _selectedBreed?.name,    // → 'beniGuil'
```

### Injection par feature

```dart
// Chaque feature a son fichier *_injection.dart
registerAuthDependencies(sl);
registerAnnoncesDependencies(sl);
registerProfileDependencies(sl);

// Ordre obligatoire dans injection_container.dart :
// 1. FlutterSecureStorage
// 2. TokenStorage
// 3. DioClient
// 4. Features
```

### Gestion des erreurs dans le BLoC

```dart
final result = await useCase(params);
result.fold(
  (failure) => emit(State.failure(failure.message)),
  (data)    => emit(State.loaded(data)),
);
```

### Nommage des commits

```
feat(annonces): implement Facebook-style feed with photo carousel
fix(auth): persist user to secure storage on login
fix(annonces): resolve infinite JSON serialization loop on AnnonceMedia
feat(l10n): add 4-language support (fr/en/ar/zgh) with Tifinagh script
fix(form): improve automatic region and city detection from GPS coordinates
refactor(regions): centralize moroccan regions and cities into shared constants
```

---

## Roadmap

### 🔴 Priorité haute

- [ ] Skeleton loader sur AnnonceListPage
- [ ] Galerie photos plein écran (zoom + swipe)
- [ ] Gestion erreurs réseau UI (page offline + retry)
- [ ] Notifications push Firebase
- [ ] Page déblocage contact (WebView paiement 20 DH)

### 🟡 Priorité moyenne

- [ ] Messagerie in-app
- [ ] Alertes acheteur (UI)
- [ ] Séquestre — paiement sécurisé
- [ ] Géolocalisation — annonces autour de moi
- [ ] KYC — page soumission documents

### 🟢 Priorité basse

- [ ] Onboarding (3 écrans + choix rôle)
- [ ] Mode sombre
- [ ] Cache offline
- [ ] Partage d'annonce (deep link)
- [ ] Évaluations vendeur
- [ ] Support RTL complet (arabe)