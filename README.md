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
- Filtres de recherche avancés
- Système de favoris
- Signalement d'annonces
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
| Notifications push | firebase_messaging | ^16.4.1 |
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
├── injection_container.dart              ← câblage GetIt global
│
├── core/
│   ├── constants/
│   │   └── api_constants.dart
│   ├── error/
│   │   └── failure.dart                  ← Either<Failure,T> · mapping HTTP
│   ├── network/
│   │   ├── dio_client.dart               ← wrapper get/post/put/patch/delete
│   │   ├── dio_client_factory.dart       ← base URL · Bearer · LogInterceptor
│   │   ├── token_storage.dart            ← JWT + cache User (secure storage)
│   │   └── interceptors/
│   │       └── auth_interceptor.dart
│   ├── theme/
│   │   └── app_theme.dart
│   ├── usecases/
│   │   └── usecase.dart                  ← abstract UseCase<Type, Params>
│   └── utils/
│       └── storage_service.dart
│
├── shared/
│   ├── enums/
│   │   ├── annonce_status.dart           ← DRAFT·ACTIVE·SUSPENDED·SOLD·EXPIRED
│   │   ├── animal_gender.dart            ← MALE·FEMALE
│   │   └── role.dart                     ← BUYER·SELLER·ADMIN
│   ├── model/paginated/
│   │   └── paginated_response.dart       ← Page<T> Spring Boot
│   └── widgets/
│       ├── custom_button.dart
│       ├── error_widget.dart
│       └── loading_widget.dart
│
└── features/
    ├── auth/                             ← ✅ implémenté
    ├── annonces/                         ← ✅ implémenté
    ├── messaging/                        ← 🔲 placeholder
    ├── profile/                          ← 🔲 placeholder
    └── sequestre/                        ← 🔲 placeholder
```

---

## Features implémentées

### 🔐 Auth

```
lib/features/auth/
├── auth_injection.dart
├── data/
│   ├── datasources/    auth_remote_datasource.dart   POST /api/v1/auth/login
│   ├── models/         LoginRequestModel · AuthResponseModel · UserModel
│   └── repositories/   auth_repository_impl.dart
├── domain/
│   ├── entities/       User · AuthResult
│   ├── repositories/   auth_repository.dart
│   └── usecases/       Login · Logout · GetCurrentUser · CheckAuthStatus
└── presentation/
    ├── bloc/           AuthBloc (checkStatus · login · logout)
    ├── pages/          SplashPage · LoginPage
    └── widgets/        PhoneField · PasswordField
```

**Flux d'authentification :**
```
Démarrage → SplashPage → hasToken() ?
                ├── oui → getCachedUser() → /annonces
                └── non → /login → POST /api/v1/auth/login
                              → saveTokens() + saveUser() → /annonces
```

**Header automatique sur chaque requête :**
```
Authorization: Bearer <access_token>
X-User-Id: <userId>              ← requis par le backend Spring Boot
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
│   │                   AnnonceAlertRequestModel
│   └── repositories/   annonce_repository_impl.dart
├── domain/
│   ├── entities/       Annonce · AnnonceMedia
│   ├── repositories/   annonce_repository.dart
│   └── usecases/       17 use cases
└── presentation/
    ├── bloc/           AnnonceBloc · AnnonceEvent · AnnonceState
    ├── pages/          AnnonceListPage · AnnonceDetailPage · AnnonceFormPage
    └── widgets/        AnnoncePostCard · AnnoncePhotoCarousel
                        AnnoncePostHeader · AnnoncePostInfo
                        AnnoncePostActions · AnnonceFilterSheet
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
| POST | `/api/v1/annonces/{id}/flag` | FlagAnnonce |
| POST | `/api/v1/annonces/{id}/favorites` | AddFavorite |
| DELETE | `/api/v1/annonces/{id}/favorites` | RemoveFavorite |
| GET | `/api/v1/annonces/favorites` | GetFavorites |
| POST | `/api/v1/annonces/alerts` | CreateAlert |
| DELETE | `/api/v1/annonces/alerts/{id}` | DeleteAlert |
| GET | `/api/v1/annonces/alerts` | GetAlertsByBuyer |
| POST | `/api/v1/annonces/{id}/medias` | UploadMedia (multipart) |

**UI Annonces :**
```
AnnonceListPage
  └── ListView vertical
        └── AnnoncePostCard (style Facebook)
              ├── AnnoncePostHeader    avatar vendeur · date relative · région
              ├── AnnoncePhotoCarousel PageView + dots animés + compteur 1/N
              ├── AnnoncePostInfo      prix · badges · chips (race/poids/âge)
              ├── Description          2 lignes + "Voir plus" animé
              └── AnnoncePostActions   ❤️ Favori · 💬 Contacter · ↗️ Partager

AnnonceFormPage (Stepper 4 étapes)
  ├── Étape 1 : Photos    grille 3×N · galerie/caméra · badge "Principale"
  ├── Étape 2 : Animal    race · genre · poids · âge · aide agricole
  ├── Étape 3 : Annonce   titre · prix · négociable · description
  └── Étape 4 : Lieu      région · adresse · livraison (rayon + prix)

AnnonceFilterSheet (DraggableScrollableSheet)
  ├── Race & Région       champs texte
  ├── Prix (MAD)          min / max
  ├── Poids (kg)          min / max
  ├── Genre               SegmentedButton
  └── Options             SwitchListTile (livraison · négociable · aides · top lot)
```

---

## Navigation

```dart
/splash     → SplashPage        vérifie token au démarrage
/login      → LoginPage
/annonces   → AnnonceListPage
/annonces/new        → AnnonceFormPage (création)
/annonces/:id        → AnnonceDetailPage
```

---

## Installation

```bash
# 1. Cloner
git clone https://github.com/chana9/ma_chana9_app.git
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

| Java | Flutter | Sérialisation |
|---|---|---|
| `ACTIVE` | `AnnonceStatus.active` | `@JsonValue('ACTIVE')` |
| `MALE` | `AnimalGender.male` | `@JsonValue('MALE')` |
| `SELLER` | `Role.seller` | `@JsonValue('SELLER')` |
| `IMAGE` | `MediaFormat.image` | `@JsonValue('IMAGE')` |

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

### Injection par feature

```dart
// Chaque feature a son fichier *_injection.dart
registerAuthDependencies(sl);
registerAnnoncesDependencies(sl);

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
fix(annonces): make createdAt nullable to handle null backend response
feat(form): add multi-step form with photo picker and animal details
```

---

## Roadmap

### 🔴 Priorité haute

- [ ] Amélioration liste : barre recherche + chips filtres actifs + tri + skeleton loader
- [ ] Filtres avec RangeSlider (prix / poids / âge)
- [ ] Galerie photos plein écran (zoom + swipe)
- [ ] Mes annonces — tableau de bord vendeur
- [ ] Gestion erreurs réseau UI (page offline + retry)
- [ ] Notifications push Firebase

### 🟡 Priorité moyenne

- [ ] Profil utilisateur (édition + KYC)
- [ ] Messagerie in-app
- [ ] Alertes acheteur (UI)
- [ ] Séquestre — paiement sécurisé
- [ ] Géolocalisation + annonces autour de moi

### 🟢 Priorité basse

- [ ] Onboarding (3 écrans + choix rôle)
- [ ] Mode sombre
- [ ] Support arabe RTL
- [ ] Cache offline
- [ ] Partage d'annonce (deep link)
- [ ] Évaluations vendeur