# 📱 Chana9 — Frontend Mobile Flutter

> Documentation technique complète de l'application mobile Flutter du marketplace marocain de bétail.

---

## 📋 Table des matières

- [Vue d'ensemble](#vue-densemble)
- [Stack & Dépendances](#stack--dépendances)
- [Architecture](#architecture)
- [Structure complète des fichiers](#structure-complète-des-fichiers)
- [Core](#core)
- [Shared](#shared)
- [Feature Auth](#feature-auth)
- [Feature Annonces](#feature-annonces)
- [Injection & Main](#injection--main)

---

## Vue d'ensemble

Chana9 est une application Flutter qui permet aux éleveurs et acheteurs marocains d'acheter et vendre du bétail en ligne. L'interface est inspirée du feed Facebook avec un carousel de photos par annonce.

```
Splash → vérification token
    ├── token valide  → Feed annonces
    └── token absent → Login → Feed annonces
```

---

## Stack & Dépendances

```yaml
dependencies:
  flutter_bloc: ^9.1.1        # State management
  dio: ^5.4.0                 # HTTP client
  flutter_secure_storage: ^10.3.1  # Stockage JWT
  go_router: ^17.3.0          # Navigation
  freezed_annotation: ^3.1.0  # Code generation
  json_annotation: ^4.8.0     # JSON serialization
  get_it: ^7.6.4              # Injection de dépendances
  dartz: ^0.10.1              # Either<Failure, T>
  cached_network_image: ^3.3.0 # Images réseau
  image_picker: ^1.0.0        # Sélection photos
  firebase_core: ^4.11.0      # Firebase
  firebase_messaging: ^16.4.1 # Push notifications

dev_dependencies:
  build_runner: ^2.4.9
  freezed: ^3.1.0
  json_serializable: ^6.7.1
```

---

## Architecture

Le projet suit la **Clean Architecture** stricte en 3 couches :

```
┌─────────────────────────────────────────┐
│           PRESENTATION                  │
│   Pages · Widgets · BLoC               │
├─────────────────────────────────────────┤
│              DOMAIN                     │
│   Entities · UseCases · Repository(i)  │
├─────────────────────────────────────────┤
│               DATA                      │
│   Models · DataSource · RepositoryImpl │
└─────────────────────────────────────────┘
```

### Flux de données

```
UI → Event → BLoC → UseCase → Repository → DataSource → API
API → Model.fromJson() → Entity → State → UI
```

### Gestion des erreurs

```dart
Either<Failure, T>
├── Right(data)   // Succès
└── Left(failure) // Erreur
    ├── ServerFailure(message)
    ├── NetworkFailure(message)
    ├── UnauthorizedFailure()
    └── NotFoundFailure()
```

---

## Structure complète des fichiers

```
lib/
├── core/
│   ├── error/
│   │   └── failure.dart
│   ├── network/
│   │   ├── dio_client.dart
│   │   ├── dio_client_factory.dart
│   │   └── token_storage.dart
│   ├── theme/
│   │   └── app_theme.dart
│   └── usecases/
│       └── usecase.dart
├── shared/
│   ├── enums/
│   │   ├── annonce_status.dart
│   │   ├── animal_gender.dart
│   │   └── role.dart
│   └── models/
│       └── paginated_response.dart
├── features/
│   ├── auth/
│   │   ├── auth_injection.dart
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── auth_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── auth_response_model.dart
│   │   │   │   ├── login_request_model.dart
│   │   │   │   └── user_model.dart
│   │   │   └── repositories/
│   │   │       └── auth_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── auth_result.dart
│   │   │   │   └── user.dart
│   │   │   ├── repositories/
│   │   │   │   └── auth_repository.dart
│   │   │   └── usecases/
│   │   │       ├── check_auth_status.dart
│   │   │       ├── get_current_user.dart
│   │   │       ├── login.dart
│   │   │       └── logout.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── auth_bloc.dart
│   │       │   ├── auth_event.dart
│   │       │   └── auth_state.dart
│   │       ├── pages/
│   │       │   ├── login_page.dart
│   │       │   └── splash_page.dart
│   │       └── widgets/
│   │           ├── password_field.dart
│   │           └── phone_field.dart
│   └── annonces/
│       ├── annonces_injection.dart
│       ├── data/
│       │   ├── datasources/
│       │   │   └── annonce_remote_datasource.dart
│       │   ├── models/
│       │   │   ├── annonce_media_model.dart
│       │   │   ├── annonce_model.dart
│       │   │   └── annonce_search_request_model.dart
│       │   └── repositories/
│       │       └── annonce_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   ├── annonce.dart
│       │   │   └── annonce_media.dart
│       │   ├── repositories/
│       │   │   └── annonce_repository.dart
│       │   └── usecases/
│       │       ├── activate_top_lot.dart
│       │       ├── add_favorite.dart
│       │       ├── create_alert.dart
│       │       ├── create_annonce.dart
│       │       ├── delete_alert.dart
│       │       ├── delete_annonce.dart
│       │       ├── flag_annonce.dart
│       │       ├── get_alerts_by_buyer.dart
│       │       ├── get_annonce_by_id.dart
│       │       ├── get_annonces_by_seller.dart
│       │       ├── get_favorites.dart
│       │       ├── mark_as_sold.dart
│       │       ├── reactivate_annonce.dart
│       │       ├── remove_favorite.dart
│       │       ├── search_annonces.dart
│       │       ├── suspend_annonce.dart
│       │       └── update_annonce.dart
│       └── presentation/
│           ├── bloc/
│           │   ├── annonce_bloc.dart
│           │   ├── annonce_event.dart
│           │   └── annonce_state.dart
│           ├── pages/
│           │   ├── annonce_detail_page.dart
│           │   ├── annonce_form_page.dart
│           │   └── annonce_list_page.dart
│           └── widgets/
│               ├── annonce_filter_sheet.dart
│               ├── annonce_photo_carousel.dart
│               ├── annonce_post_actions.dart
│               ├── annonce_post_card.dart
│               ├── annonce_post_header.dart
│               └── annonce_post_info.dart
├── injection_container.dart
└── main.dart
```

---

## Core

### `core/error/failure.dart`

Classe `@freezed` représentant toutes les erreurs possibles de l'application.

```dart
@freezed
abstract class Failure with _$Failure {
  const factory Failure.server(String message)  = ServerFailure;
  const factory Failure.network(String message) = NetworkFailure;
  const factory Failure.unauthorized()          = UnauthorizedFailure;
  const factory Failure.notFound()              = NotFoundFailure;
  const factory Failure.unknown(String message) = UnknownFailure;
}
```

M�thode clé : `Failure.fromDioException(e)` — mappe automatiquement chaque code HTTP :

| Code HTTP | Failure |
|---|---|
| 400 | `ServerFailure(message backend)` |
| 401 | `UnauthorizedFailure()` → supprime le token |
| 403 | `ServerFailure('Accès refusé')` |
| 404 | `NotFoundFailure()` |
| 500 | `ServerFailure('Erreur serveur')` |
| Timeout | `NetworkFailure('Délai dépassé')` |
| Pas réseau | `NetworkFailure('Pas de connexion')` |

---

### `core/network/dio_client.dart`

Wrapper fin autour de `Dio` exposant 5 méthodes HTTP :
`get`, `post`, `put`, `patch`, `delete`.

Ne contient aucune logique métier — uniquement le passage des paramètres à l'instance `Dio`.

---

### `core/network/dio_client_factory.dart`

Factory qui construit l'instance `Dio` configurée :

- **Base URL** : `https://api.chana9.ma`
- **Timeouts** : 15s connexion / 15s réception
- **Intercepteur Bearer** : lit le token depuis `FlutterSecureStorage` et l'injecte dans `Authorization: Bearer <token>`
- **Intercepteur 401** : supprime le token si expiré
- **LogInterceptor** : activé uniquement en mode debug (`assert`)

---

### `core/network/token_storage.dart`

Gère la persistance des tokens et du profil utilisateur dans `FlutterSecureStorage`.

| Méthode | Description |
|---|---|
| `saveTokens(accessToken, refreshToken)` | Persiste les tokens après login |
| `saveUser(user)` | Sérialise et persiste le `User` en JSON |
| `getCachedUser()` | Désérialise le `User` depuis le cache |
| `getAccessToken()` | Lu par l'intercepteur Dio à chaque requête |
| `getRefreshToken()` | Utilisé pour le refresh |
| `hasToken()` | Vérifie si une session existe |
| `clearTokens()` | Supprime tout au logout (`deleteAll`) |

> **Important** : `saveUser()` doit être appelé après chaque login et refresh pour que `getCachedUser()` retourne un utilisateur valide au redémarrage.

---

### `core/usecases/usecase.dart`

Interface générique implémentée par tous les use cases :

```dart
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
```

---

### `core/theme/app_theme.dart`

Thème Material 3 avec couleur primaire verte `#2E7D32`.
Configure : `ColorScheme`, `AppBarTheme`, `CardTheme`, `InputDecorationTheme`, `FilledButtonTheme`.

---

## Shared

### `shared/enums/annonce_status.dart`

```dart
enum AnnonceStatus { draft, active, suspended, sold, expired }
// Sérialisé en SCREAMING_CASE côté Spring Boot
// @JsonValue('ACTIVE') etc.
```

### `shared/enums/animal_gender.dart`

```dart
enum AnimalGender { male, female }
// @JsonValue('MALE'), @JsonValue('FEMALE')
```

### `shared/enums/role.dart`

```dart
enum Role { buyer, seller, admin }
// @JsonValue('BUYER'), @JsonValue('SELLER'), @JsonValue('ADMIN')
```

### `shared/models/paginated_response.dart`

Wrapper générique qui mappe la réponse paginée Spring Boot (`Page<T>`) :

```dart
class PaginatedResponse<T> {
  final List<T> content;
  final int totalElements;
  final int totalPages;
  final int number;
  final int size;
  final bool first;
  final bool last;

  PaginatedResponse<R> map<R>(R Function(T) mapper); // transforme Model → Entity
}
```

---

## Feature Auth

### `auth/data/models/login_request_model.dart`

Miroir exact du `PasswordLoginRequest` Java :

```dart
// Java                        Flutter
String phone          →        String phone
String password       →        String password
```

Validations identiques au backend : regex `^\+?[0-9]{9,15}$` dans `PhoneField`.

---

### `auth/data/models/auth_response_model.dart`

Miroir du `AuthResponse` Java avec `@JsonInclude(NON_NULL)` → tous les champs `String?`.

```dart
String? accessToken
String? refreshToken
int?    accessTokenExpiresIn
int?    refreshTokenExpiresIn
UserModel? user
String? message
```

M�thode `toEntity()` convertit en `AuthResult` (lève si `accessToken` ou `user` est null).

---

### `auth/data/models/user_model.dart`

Miroir exact du `UserDTO` Java :

```dart
// Java          Flutter
UUID id       →  String id       (UUID sérialisé en String par Jackson)
LocalDateTime →  DateTime        (ISO 8601)
boolean       →  bool
Role (enum)   →  Role (enum)     (@JsonValue SCREAMING_CASE)
```

---

### `auth/data/datasources/auth_remote_datasource.dart`

| Méthode | Endpoint | Description |
|---|---|---|
| `login(request)` | `POST /api/v1/auth/login` | Authentification par téléphone + mot de passe |
| `refreshToken(token)` | `POST /api/v1/auth/refresh` | Renouvellement du token |

---

### `auth/data/repositories/auth_repository_impl.dart`

Implémentation concrète qui :
1. Appelle le datasource
2. Persiste token + user dans `TokenStorage` après login
3. Wrappe toutes les erreurs via `Failure.fromDioException()`

> **Fix critique** : `saveUser(result.user)` est appelé après chaque login pour éviter de redemander l'authentification au redémarrage.

---

### `auth/domain/entities/user.dart`

Entité pure sans dépendance framework :

```
id · phone · fullName · role · kycVerified · kycSubmittedAt · createdAt · updatedAt
```

### `auth/domain/entities/auth_result.dart`

```
accessToken · refreshToken · accessTokenExpiresIn · refreshTokenExpiresIn · user
```

---

### `auth/domain/usecases/`

| Fichier | Params | Retour |
|---|---|---|
| `login.dart` | `LoginParams(phone, password)` | `AuthResult` |
| `logout.dart` | `NoParams` | `Unit` |
| `get_current_user.dart` | `NoParams` | `User` (depuis cache) |
| `check_auth_status.dart` | `NoParams` | `bool` |

---

### `auth/presentation/bloc/auth_bloc.dart`

| Event | Action | State résultant |
|---|---|---|
| `checkStatus()` | vérifie token + charge user cache | `authenticated(user)` ou `unauthenticated()` |
| `login(phone, password)` | POST login + sauvegarde | `authenticated(user)` ou `failure(msg)` |
| `logout()` | efface token + user | `unauthenticated()` |

---

### `auth/presentation/pages/splash_page.dart`

Page de démarrage qui :
1. Dispatch `AuthEvent.checkStatus()`
2. Affiche logo + spinner pendant la vérification
3. Redirige via callback `onReady(bool isAuthenticated)`

> `onReady` est `void Function(bool)` — pas `Widget Function(bool)` pour éviter l'erreur de compilation.

---

### `auth/presentation/pages/login_page.dart`

Formulaire de connexion avec :
- `PhoneField` : validation regex identique au backend `^\+?[0-9]{9,15}$`
- `PasswordField` : toggle visibilité, minimum 6 caractères
- `BlocConsumer` : spinner pendant loading, SnackBar sur erreur

---

### `auth/presentation/widgets/phone_field.dart`

Champ téléphone avec :
- `FilteringTextInputFormatter` : autorise uniquement `[0-9+]`
- Regex de validation identique au `@Pattern` du backend

### `auth/presentation/widgets/password_field.dart`

Champ mot de passe avec `StatefulWidget` pour le toggle visibilité (œil).

---

## Feature Annonces

### `annonces/data/models/annonce_model.dart`

Miroir exact du `AnnonceResponse` Java :

```dart
// Java              Flutter
UUID          →      String          (UUID → String)
BigDecimal    →      double          (prix, poids)
LocalDate     →      DateTime?       (birthDate)
LocalDateTime →      DateTime?       (createdAt, updatedAt nullable)
Boolean       →      bool
List<AnnonceMediaResponse> → List<AnnonceMediaModel>
```

> `createdAt` et `updatedAt` sont `DateTime?` (nullable) car le backend peut renvoyer `null`.
> `toEntity()` applique le fallback : `createdAt ?? DateTime.now()`.

---

### `annonces/data/models/annonce_media_model.dart`

Miroir du `AnnonceMediaResponse` Java :

```dart
String id       // UUID → String
String url      // URL de l'image
String mediaType
int position    // order côté Java
```

---

### `annonces/data/models/annonce_search_request_model.dart`

Miroir de `AnnonceSearchRequest` Java avec méthode `toQueryParams()` qui exclut les champs `null`.

---

### `annonces/data/datasources/annonce_remote_datasource.dart`

17 endpoints mappés sur `/api/v1/annonces` :

| Méthode | Endpoint | HTTP |
|---|---|---|
| `createAnnonce` | `/` | POST |
| `updateAnnonce` | `/{id}` | PUT |
| `deleteAnnonce` | `/{id}` | DELETE |
| `getAnnonceById` | `/{id}` | GET |
| `searchAnnonces` | `/search` | GET |
| `getAnnoncesBySeller` | `/seller/{id}` | GET |
| `suspendAnnonce` | `/{id}/suspend` | PATCH |
| `reactivateAnnonce` | `/{id}/reactivate` | PATCH |
| `markAsSold` | `/{id}/sold` | PATCH |
| `activateTopLot` | `/{id}/top-lot/{days}` | POST |
| `flagAnnonce` | `/{id}/flag` | POST |
| `addFavorite` | `/{id}/favorites` | POST |
| `removeFavorite` | `/{id}/favorites` | DELETE |
| `getFavorites` | `/favorites` | GET |
| `createAlert` | `/alerts` | POST |
| `deleteAlert` | `/alerts/{id}` | DELETE |
| `getAlertsByBuyer` | `/alerts` | GET |
| `uploadMedia` | `/{id}/medias` | POST multipart |

---

### `annonces/data/repositories/annonce_repository_impl.dart`

Helper `_execute<T>()` centralise la gestion d'erreurs :

```dart
Future<Either<Failure, T>> _execute<T>(Future<T> Function() call) async {
  try {
    return Right(await call());
  } on DioException catch (e) {
    return Left(Failure.fromDioException(e));
  } catch (e) {
    return Left(Failure.unknown(e.toString()));
  }
}
```

Évite 17 blocs try/catch identiques.

---

### `annonces/domain/entities/annonce.dart`

Entité pure avec 28 champs correspondant au `AnnonceResponse` Java.
`createdAt` et `updatedAt` sont `DateTime?`.

### `annonces/domain/entities/annonce_media.dart`

```
id · url · mediaType · position
```

---

### `annonces/domain/usecases/`

17 use cases, chacun avec ses `Params` `@freezed` :

| UseCase | Params |
|---|---|
| `CreateAnnonce` | `body: Map<String,dynamic>` |
| `UpdateAnnonce` | `id, body` |
| `DeleteAnnonce` | `id` |
| `GetAnnonceById` | `id` |
| `SearchAnnonces` | `request, page, size` |
| `GetAnnoncesBySeller` | `sellerId, page, size` |
| `SuspendAnnonce` | `id` |
| `ReactivateAnnonce` | `id` |
| `MarkAsSold` | `id` |
| `ActivateTopLot` | `id, durationDays` |
| `FlagAnnonce` | `id, body` |
| `AddFavorite` | `id` |
| `RemoveFavorite` | `id` |
| `GetFavorites` | `page, size` |
| `CreateAlert` | `body` |
| `DeleteAlert` | `alertId` |
| `GetAlertsByBuyer` | `NoParams` |

---

### `annonces/presentation/bloc/`

#### `annonce_event.dart`

17 events `@freezed` couvrant toutes les actions utilisateur.

#### `annonce_state.dart`

```dart
initial()
loading()
annonceListLoaded(PaginatedResponse<Annonce>)
annonceDetailLoaded(Annonce)
annonceCreated(Annonce)
annonceUpdated(Annonce)
annonceDeleted()
actionSuccess()
favoritesLoaded(PaginatedResponse<Annonce>)
alertsLoaded(List<Map<String,dynamic>>)
failure(String message)
```

#### `annonce_bloc.dart`

Un handler par event. Émet `loading()` avant chaque opération async, puis `failure(msg)` ou l'état de succès correspondant.

---

### `annonces/presentation/pages/annonce_list_page.dart`

Feed principal style Facebook :

- `ListView.builder` vertical, fond gris `Colors.grey.shade100`
- `RefreshIndicator` pour pull-to-refresh
- Pagination automatique au scroll (détecte 300px avant la fin)
- `FAB` "Publier" → `/annonces/new`
- `AppBar` avec boutons filtre et recherche
- États gérés par `BlocConsumer` avec `maybeWhen`

---

### `annonces/presentation/pages/annonce_detail_page.dart`

Page détail avec :
- `SliverAppBar` expandable avec carousel de photos
- Toutes les infos de l'annonce
- Menu popup avec actions vendeur (suspendre, réactiver, vendre, Top Lot, modifier, supprimer, signaler)
- `BlocConsumer` pour les retours d'actions

---

### `annonces/presentation/pages/annonce_form_page.dart`

Formulaire en **4 étapes** avec `Stepper` vertical :

**Étape 1 — Photos**
- Grille 3 colonnes, max 5 photos
- Sélection galerie (`pickMultiImage`) ou caméra (`pickImage`)
- Badge "Principale" sur la 1ère photo
- Bouton ✕ pour supprimer chaque photo
- Upload via `POST /{annonceId}/medias` multipart après création

**Étape 2 — Animal**
- Race (TextFormField)
- Genre (SegmentedButton)
- Poids + Âge côte à côte
- Switch éligibilité aux aides

**Étape 3 — Annonce**
- Titre + Prix + Switch négociable
- Description (4 lignes)

**Étape 4 — Localisation**
- Région + Adresse optionnelle
- Switch livraison → Rayon + Prix si activé

---

### `annonces/presentation/widgets/annonce_post_card.dart`

Widget principal "post Facebook" — assemble tous les sous-widgets :

```
AnnoncePostHeader
AnnoncePhotoCarousel
AnnoncePostInfo
Description (AnimatedCrossFade "Voir plus/moins")
AnnoncePostActions
```

Gère localement l'état favori + dispatch vers le BLoC.

---

### `annonces/presentation/widgets/annonce_photo_carousel.dart`

Carousel de photos avec `PageView.builder` :

- Compteur `1/3` en haut à droite
- Dots animés en bas (dot actif s'élargit via `AnimatedContainer`)
- Badge TOP LOT en haut à gauche si `isTopLot`
- Placeholder coloré (couleur déterministe par race) avec emoji 🐑 si pas de photos

---

### `annonces/presentation/widgets/annonce_post_header.dart`

En-tête du post :
- Avatar circulaire avec initiales (couleur déterministe par `sellerId`)
- Nom vendeur + région + date relative (`il y a 2h`, `il y a 3j`...)
- Bouton `···` → bottom sheet avec signalement et partage

---

### `annonces/presentation/widgets/annonce_post_info.dart`

Section infos clés :
- Titre en gras
- Prix en couleur primaire + badge "Négociable" + badge "Aide éligible"
- Chips : Race · Genre · Poids · Âge · Livraison

---

### `annonces/presentation/widgets/annonce_post_actions.dart`

Barre d'actions avec animation :
- ❤️ **Favori** : `ScaleTransition` animation bounce au tap
- 💬 **Contacter** : couleur primaire → navigue vers messagerie
- ↗️ **Partager** : gris

---

### `annonces/presentation/widgets/annonce_filter_sheet.dart`

`DraggableScrollableSheet` (85% → 95% de l'écran) :
- Race + Région (TextFields)
- Prix min/max côte à côte
- Poids min/max côte à côte
- Genre (SegmentedButton)
- 4 switches : Livraison · Négociable · Aides · Top Lot
- Bouton "Réinitialiser" + "Appliquer"

---

## Injection & Main

### `injection_container.dart`

Enregistrement ordonné dans `GetIt` :

```dart
// 1. External
FlutterSecureStorage

// 2. Core
TokenStorage          // dépend de FlutterSecureStorage
DioClient             // dépend de FlutterSecureStorage

// 3. Features
registerAuthDependencies(sl)
registerAnnoncesDependencies(sl)
```

> L'ordre est critique : chaque singleton doit être enregistré avant ceux qui en dépendent.

---

### `main.dart`

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();   // GetIt initialisé avant runApp
  runApp(const Chana9App());
}
```

`MultiBlocProvider` fournit `AuthBloc` et `AnnonceBloc` à toute l'arborescence.

`GoRouter` déclaré en dehors de `build()` pour éviter la recréation à chaque rebuild.

Routes :

| Path | Page |
|---|---|
| `/splash` | `SplashPage` |
| `/login` | `LoginPage` |
| `/annonces` | `AnnonceListPage` |
| `/annonces/new` | `AnnonceFormPage` |
| `/annonces/:id` | `AnnonceDetailPage` |

> `/annonces/new` déclaré **avant** `/annonces/:id` pour éviter que `"new"` soit capturé comme un ID.

---

## Commandes

```bash
# Installer les dépendances
flutter pub get

# Générer le code freezed + json_serializable
dart run build_runner build --delete-conflicting-outputs

# Lancer en debug
flutter run

# Build APK release
flutter build apk --release

# Build iOS
flutter build ios --release
```

---

## Règles importantes

### freezed ^3.x — obligatoire

```dart
// ✅ Correct
@freezed
abstract class MaClasse with _$MaClasse { ... }

// ❌ Ne compile pas
@freezed
class MaClasse with _$MaClasse { ... }
```

### Enums Spring Boot

Spring Boot sérialise les enums en `SCREAMING_SNAKE_CASE`. Tous les enums Flutter utilisent `@JsonValue` :

```dart
@JsonValue('ACTIVE')  active('ACTIVE'),
@JsonValue('MALE')    male('MALE'),
@JsonValue('SELLER')  seller('SELLER'),
```

### UUID Java → String Dart

Jackson sérialise `UUID` en `String` par défaut. Tous les champs `UUID` Java deviennent `String` côté Flutter.

### BigDecimal Java → double Dart

`BigDecimal` (prix, poids) est désérialisé comme `double` en Dart. Pas de perte de précision pour les valeurs monétaires à 2 décimales.