# Chana9 — Backend API

> Plateforme numérique de commercialisation du bétail au Maroc  
> Spring Boot 3 · Java 21 · PostgreSQL · JWT · Liquibase

---

## Table des matières

1. [Vue d'ensemble](#1-vue-densemble)
2. [Stack technique](#2-stack-technique)
3. [Architecture](#3-architecture)
4. [Structure du projet](#4-structure-du-projet)
5. [Modules métier](#5-modules-métier)
6. [Base de données](#6-base-de-données)
7. [Sécurité & Authentification](#7-sécurité--authentification)
8. [API Reference](#8-api-reference)
9. [Lancer le projet](#9-lancer-le-projet)
10. [Variables d'environnement](#10-variables-denvironnement)
11. [Tests](#11-tests)
12. [Conventions de code](#12-conventions-de-code)

---

## 1. Vue d'ensemble

Le backend Chana9 expose une **API REST** consommée par l'application mobile Flutter.
Il gère l'ensemble du cycle de vie d'une transaction de bétail :

```
Éleveur publie une annonce
        ↓
Acheteur initie un séquestre (paiement bloqué)
        ↓
Les deux parties confirment la transaction
        ↓
Fonds libérés vers l'éleveur — commission prélevée
```

Le modèle économique repose sur une **commission de 3 %** prélevée sur l'acheteur,
plafonnée à **200 DH par tête**, incluse dans le séquestre.

---

## 2. Stack technique

| Composant | Technologie | Version |
|---|---|---|
| Langage | Java | 21 |
| Framework | Spring Boot | 3.x |
| ORM | Spring Data JPA / Hibernate | — |
| Base de données | PostgreSQL | 16 |
| Migrations | Liquibase | — |
| Sécurité | Spring Security + JWT | — |
| Build | Maven | 3.9+ |
| Conteneur | Docker / Docker Compose | — |

---

## 3. Architecture

Le projet suit une **architecture modulaire par domaine métier** (package by feature),
avec les couches classiques à l'intérieur de chaque module.

```
┌─────────────────────────────────────────────────────────┐
│                   Application mobile Flutter             │
└──────────────────────────┬──────────────────────────────┘
                           │ HTTPS / JSON
┌──────────────────────────▼──────────────────────────────┐
│                    API REST /api/v1/**                   │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌────────┐  │
│  │   Auth   │  │ Annonces │  │Sequestre │  │  ...   │  │
│  │Controller│  │Controller│  │Controller│  │        │  │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘  └───┬────┘  │
│       │              │              │             │       │
│  ┌────▼─────┐  ┌────▼─────┐  ┌────▼─────┐       │       │
│  │   Auth   │  │ Annonce  │  │Sequestre │  ...   │       │
│  │  Service │  │  Service │  │  Service │        │       │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘        │       │
│       │              │              │               │       │
│  ┌────▼──────────────▼──────────────▼───────────────▼───┐ │
│  │              Spring Data JPA Repositories             │ │
│  └───────────────────────────┬───────────────────────────┘ │
└──────────────────────────────│──────────────────────────────┘
                               │
┌──────────────────────────────▼──────────────────────────┐
│                     PostgreSQL 16                        │
│  users · otp_codes · annonces · annonce_photos          │
│  sequestres · messages · notifications · avis           │
└─────────────────────────────────────────────────────────┘
```

### Flux d'authentification

```
Mobile                     Backend
  │                           │
  │── POST /auth/send-otp ───►│  Génère code OTP 6 chiffres
  │                           │  Sauvegarde en base (5 min TTL)
  │                           │  Log console (SMS à intégrer)
  │◄── { message: "OTP envoyé" } ─│
  │                           │
  │── POST /auth/verify-otp ─►│  Vérifie code + expiry
  │                           │  Crée User si nouveau (role=ACHETEUR)
  │                           │  Génère JWT access (24h) + refresh (7j)
  │◄── { accessToken, refreshToken, user } ─│
  │                           │
  │── GET /api/v1/... ────────│  Authorization: Bearer <accessToken>
  │   Bearer: <accessToken>   │  JwtAuthFilter valide le token
  │◄── { data } ─────────────│
```

### Flux séquestre

```
ACHETEUR                   BACKEND                    ÉLEVEUR
   │                          │                          │
   │─ POST /sequestres ──────►│  calcule commission       │
   │                          │  statut = EN_ATTENTE      │
   │◄── SequestreDTO ─────────│                          │
   │                          │                          │
   │─ POST /sequestres/{id}   │                          │
   │      /bloquer ──────────►│  simule paiement CMI      │
   │                          │  statut = BLOQUE          │
   │                          │─── notification ─────────►│
   │                          │                          │
   │─ POST .../confirmer-     │                          │
   │   reception ────────────►│  confirmedByAcheteur=true │
   │                          │                          │
   │                          │◄── POST .../confirmer-livraison
   │                          │  confirmedByEleveur=true  │
   │                          │  si les deux confirmés :  │
   │                          │  statut = LIBERE          │
   │◄── notification ─────────│─── notification ─────────►│
```

---

## 4. Structure du projet

```
backend/
├── src/
│   ├── main/
│   │   ├── java/ma/chana9/
│   │   │   │
│   │   │   ├── Chana9Application.java          ← point d'entrée
│   │   │   │
│   │   │   ├── config/                         ← configuration globale
│   │   │   │   ├── SecurityConfig.java         ← Spring Security + JWT filter
│   │   │   │   ├── JwtConfig.java              ← bean JwtService
│   │   │   │   └── CorsConfig.java             ← CORS dev/prod
│   │   │   │
│   │   │   ├── modules/                        ← domaines métier
│   │   │   │   ├── auth/
│   │   │   │   │   ├── controller/AuthController.java
│   │   │   │   │   ├── service/AuthService.java
│   │   │   │   │   ├── service/JwtService.java
│   │   │   │   │   └── dto/
│   │   │   │   │       ├── SendOtpRequest.java
│   │   │   │   │       ├── VerifyOtpRequest.java
│   │   │   │   │       └── AuthResponse.java
│   │   │   │   │
│   │   │   │   ├── user/
│   │   │   │   │   ├── controller/UserController.java
│   │   │   │   │   ├── service/UserService.java
│   │   │   │   │   ├── repository/UserRepository.java
│   │   │   │   │   ├── domain/User.java         ← entité JPA
│   │   │   │   │   ├── domain/OtpCode.java
│   │   │   │   │   ├── repository/OtpCodeRepository.java
│   │   │   │   │   └── dto/
│   │   │   │   │       ├── UserDTO.java
│   │   │   │   │       ├── KycRequest.java
│   │   │   │   │       └── UpdateProfileRequest.java
│   │   │   │   │
│   │   │   │   ├── annonce/
│   │   │   │   │   ├── controller/AnnonceController.java
│   │   │   │   │   ├── service/AnnonceService.java
│   │   │   │   │   ├── repository/AnnonceRepository.java
│   │   │   │   │   ├── domain/Annonce.java
│   │   │   │   │   ├── domain/AnnoncePhoto.java
│   │   │   │   │   └── dto/
│   │   │   │   │       ├── CreateAnnonceRequest.java
│   │   │   │   │       ├── UpdateAnnonceRequest.java
│   │   │   │   │       ├── AnnonceDTO.java
│   │   │   │   │       └── AnnonceFilterRequest.java
│   │   │   │   │
│   │   │   │   ├── sequestre/
│   │   │   │   │   ├── controller/SequestreController.java
│   │   │   │   │   ├── service/SequestreService.java
│   │   │   │   │   ├── repository/SequestreRepository.java
│   │   │   │   │   ├── domain/Sequestre.java
│   │   │   │   │   └── dto/
│   │   │   │   │       ├── InitierSequestreRequest.java
│   │   │   │   │       ├── SequestreDTO.java
│   │   │   │   │       ├── ConfirmerReceptionRequest.java
│   │   │   │   │       └── LitigeRequest.java
│   │   │   │   │
│   │   │   │   ├── messaging/
│   │   │   │   │   ├── controller/MessageController.java
│   │   │   │   │   ├── service/MessageService.java
│   │   │   │   │   ├── repository/MessageRepository.java
│   │   │   │   │   ├── domain/Message.java
│   │   │   │   │   └── dto/
│   │   │   │   │       ├── SendMessageRequest.java
│   │   │   │   │       └── MessageDTO.java
│   │   │   │   │
│   │   │   │   ├── notification/
│   │   │   │   │   ├── service/NotificationService.java
│   │   │   │   │   ├── service/OtpService.java
│   │   │   │   │   ├── controller/NotificationController.java
│   │   │   │   │   ├── repository/NotificationRepository.java
│   │   │   │   │   └── domain/Notification.java
│   │   │   │   │
│   │   │   │   └── avis/
│   │   │   │       ├── controller/AvisController.java
│   │   │   │       ├── service/AvisService.java
│   │   │   │       ├── repository/AvisRepository.java
│   │   │   │       ├── domain/Avis.java
│   │   │   │       └── dto/
│   │   │   │           ├── CreateAvisRequest.java
│   │   │   │           └── AvisDTO.java
│   │   │   │
│   │   │   └── shared/                         ← code transverse
│   │   │       ├── enums/
│   │   │       │   ├── Role.java               ← ELEVEUR, ACHETEUR, ADMIN
│   │   │       │   ├── StatutAnnonce.java      ← ACTIVE, VENDUE, SUSPENDUE, EXPIREE
│   │   │       │   └── StatutSequestre.java    ← EN_ATTENTE, BLOQUE, LIBERE, REMBOURSE, LITIGE
│   │   │       ├── exception/
│   │   │       │   ├── GlobalExceptionHandler.java
│   │   │       │   └── ApiException.java
│   │   │       ├── response/
│   │   │       │   └── ApiResponse.java        ← wrapper générique { success, message, data }
│   │   │       └── security/
│   │   │           └── JwtAuthFilter.java      ← OncePerRequestFilter
│   │   │
│   │   └── resources/
│   │       ├── application.yml                 ← config commune
│   │       ├── application-dev.yml             ← config développement
│   │       ├── application-prod.yml            ← config production
│   │       └── db/migration/
│   │           ├── V1__init_schema.sql         ← tables principales
│   │           └── V2__seed_admin.sql          ← admin par défaut
│   │
│   └── test/
│       └── java/ma/chana9/
│           ├── modules/auth/AuthServiceTest.java
│           ├── modules/annonce/AnnonceServiceTest.java
│           └── modules/sequestre/SequestreServiceTest.java
│
├── pom.xml
├── Dockerfile
└── README.md
```

---

## 5. Modules métier

### `auth` — Authentification OTP

Authentification sans mot de passe par numéro de téléphone + code OTP 6 chiffres.
Pas d'email requis — adapté aux éleveurs ruraux sur mobile prépayé.

| Classe | Responsabilité |
|---|---|
| `AuthController` | Endpoints publics `/auth/**` |
| `AuthService` | Génération OTP, vérification, création User, émission JWT |
| `JwtService` | Génération / validation des tokens JWT (access 24h + refresh 7j) |
| `OtpService` | Génération du code, TTL 5 min, log console (SMS à intégrer) |

---

### `user` — Gestion des utilisateurs

| Classe | Responsabilité |
|---|---|
| `UserController` | CRUD profil, soumission KYC, approbation admin |
| `UserService` | Logique profil, vérification KYC, statistiques vendeur |
| `UserRepository` | `findByPhone`, `existsByPhone`, `findByRegion` |
| `User` | Entité JPA : phone, fullName, role, kycVerified, region... |
| `OtpCode` | Entité JPA : phone, code, used, expiresAt |

**Cycle KYC éleveur :**
```
Éleveur soumet CIN + photos  →  kycVerified = false (en attente)
Admin approuve               →  kycVerified = true
Éleveur peut publier des annonces
```

---

### `annonce` — Annonces de bétail

| Classe | Responsabilité |
|---|---|
| `AnnonceController` | CRUD annonces, filtres, top lot |
| `AnnonceService` | Création (KYC requis), filtrage paginé, expiration automatique |
| `AnnonceRepository` | Filtres multi-critères (race, région, prix, statut) |
| `Annonce` | Entité JPA : title, race, poids, prix, région, statut, isTopLot |
| `AnnoncePhoto` | Entité JPA : url, isCover, ordre |

**Règles métier :**
- Seuls les éleveurs avec `kycVerified = true` peuvent publier
- Les annonces expirent automatiquement après **60 jours** (tâche `@Scheduled`)
- `isTopLot = true` → remonte en tête de liste pendant 10 jours (20 DH)

---

### `sequestre` — Paiement sécurisé

Cœur du modèle économique. Bloque les fonds de l'acheteur jusqu'à confirmation
bilatérale de la transaction.

| Classe | Responsabilité |
|---|---|
| `SequestreController` | Initier, bloquer, confirmer, litige, rembourser |
| `SequestreService` | Calcul commission, transitions d'état, notifications |
| `SequestreRepository` | Recherche par acheteur, éleveur, annonce+statut |
| `Sequestre` | Entité JPA : montant, commission, statut, confirmations |

**Calcul commission :**
```java
commission = Math.min(montant * 0.03, 200.0)
// Exemple : mouton à 3 500 DH → commission = 105 DH
// Exemple : mouton à 9 000 DH → commission = 200 DH (plafond)
```

**Machine à états du séquestre :**
```
EN_ATTENTE ──► BLOQUE ──► LIBERE
                  │
                  ▼
               LITIGE ──► REMBOURSE
```

---

### `messaging` — Messagerie intégrée

Permet aux acheteurs de contacter l'éleveur directement via l'annonce,
avant et après la transaction.

| Classe | Responsabilité |
|---|---|
| `MessageController` | Envoyer, lire conversation, compteur non-lus |
| `MessageService` | Persistance, marquage lu, notification receiver |
| `MessageRepository` | Par annonce, par paire sender/receiver |

---

### `notification` — Notifications

Notifications internes persistées en base + push Firebase (à intégrer).

| Classe | Responsabilité |
|---|---|
| `NotificationService` | Créer, lister, marquer comme lu |
| `NotificationController` | GET /notifications, PUT /notifications/read-all |

Types de notification : `SEQUESTRE_BLOQUE`, `SEQUESTRE_LIBERE`, `NOUVEAU_MESSAGE`,
`KYC_APPROUVE`, `ANNONCE_VENDUE`, `LITIGE_OUVERT`

---

### `avis` — Système de notation

Notation bidirectionnelle après une transaction complétée (séquestre `LIBERE`).

| Classe | Responsabilité |
|---|---|
| `AvisController` | Créer avis, lire par utilisateur, note moyenne |
| `AvisService` | Validation (1 avis/séquestre/auteur), calcul moyenne |
| `AvisRepository` | `findByCibleId`, `AVG(note) GROUP BY cibleId` |

---

## 6. Base de données

### Schéma relationnel

```
users
 ├── id (PK, UUID)
 ├── phone (UNIQUE)
 ├── full_name
 ├── role (ELEVEUR | ACHETEUR | ADMIN)
 ├── kyc_verified
 └── region

otp_codes
 ├── id (PK, UUID)
 ├── phone
 ├── code
 ├── used
 └── expires_at

annonces
 ├── id (PK, UUID)
 ├── eleveur_id (FK → users)
 ├── title, race, poids_estime, prix, region
 ├── statut (ACTIVE | VENDUE | SUSPENDUE | EXPIREE)
 └── is_top_lot, top_lot_expires_at

annonce_photos
 ├── id (PK, UUID)
 ├── annonce_id (FK → annonces, CASCADE DELETE)
 ├── url
 └── is_cover, ordre

sequestres
 ├── id (PK, UUID)
 ├── annonce_id (FK → annonces)
 ├── acheteur_id (FK → users)
 ├── montant, commission
 ├── statut (EN_ATTENTE | BLOQUE | LIBERE | REMBOURSE | LITIGE)
 ├── confirmed_by_acheteur, confirmed_by_eleveur
 └── reference_paiement

messages
 ├── id (PK, UUID)
 ├── annonce_id (FK → annonces)
 ├── sender_id (FK → users)
 ├── receiver_id (FK → users)
 ├── content
 └── is_read, sent_at

notifications
 ├── id (PK, UUID)
 ├── user_id (FK → users)
 ├── title, body, type
 └── is_read

avis
 ├── id (PK, UUID)
 ├── sequestre_id (FK → sequestres)
 ├── auteur_id (FK → users)
 ├── cible_id (FK → users)
 ├── note (1-5)
 └── commentaire
```

### Migrations Liquibase

Les migrations sont versionnées dans `resources/db/changelog/` :

| Fichier | Contenu |
|---|---|
| `db.changelog-master.yaml` | Fichier maître qui inclut tous les changelogs |
| `001-users.yaml` | Création de la table `users` |
| `002-otp-codes.yaml` | Création de la table `otp_codes` |
| `003-annonces.yaml` | Création de la table `annonces` |
| `004-annonce-photos.yaml` | Création de la table `annonce_photos` |
| `005-sequestres.yaml` | Création de la table `sequestres` |
| `006-messages.yaml` | Création de la table `messages` |
| `007-notifications.yaml` | Création de la table `notifications` |
| `008-avis.yaml` | Création de la table `avis` |
| `009-indexes.yaml` | Création des index |
| `010-seed-admin.yaml` | Insertion de l'utilisateur admin par défaut |

> ⚠️ Ne jamais modifier un fichier de migration existant en production.
> Toute modification passe par un nouveau changelog.

---

## 7. Sécurité & Authentification

### JWT

Deux tokens sont émis lors du `verify-otp` :

| Token | Durée | Usage |
|---|---|---|
| `accessToken` | 24 heures | Toutes les requêtes API |
| `refreshToken` | 7 jours | Renouveler l'accessToken |

**Claims du JWT :**
```json
{
  "sub": "uuid-de-l-utilisateur",
  "phone": "+212612345678",
  "role": "ELEVEUR",
  "iat": 1700000000,
  "exp": 1700086400
}
```

### Endpoints publics vs protégés

| Endpoint | Accès |
|---|---|
| `POST /api/v1/auth/**` | Public |
| `GET /api/v1/annonces` | Public |
| `GET /api/v1/avis/user/**` | Public |
| `GET /api/v1/users/*/stats` | Public |
| Tout le reste | JWT requis |

### Contrôle d'accès par rôle

| Rôle | Permissions |
|---|---|
| `ACHETEUR` | Initier/confirmer séquestre, messagerie, avis |
| `ELEVEUR` | Publier annonces (KYC requis), confirmer livraison |
| `ADMIN` | Approuver KYC, rembourser séquestres, suspendre annonces |

---

## 8. API Reference

### Format de réponse standard

Toutes les réponses suivent le wrapper `ApiResponse<T>` :

```json
{
  "success": true,
  "message": "Annonce créée avec succès",
  "data": { ... },
  "timestamp": "2026-07-04T10:30:00Z"
}
```

### Endpoints principaux

#### Auth
```
POST   /api/v1/auth/send-otp         { phone }
POST   /api/v1/auth/verify-otp       { phone, code }
POST   /api/v1/auth/refresh          { refreshToken }
```

#### Users
```
GET    /api/v1/users/me
PUT    /api/v1/users/me              { fullName, region, profilePhotoUrl }
POST   /api/v1/users/me/kyc         { cin, cinPhotoUrl, selfieUrl }
GET    /api/v1/users/{id}/stats
PUT    /api/v1/users/admin/{id}/kyc/approve   [ADMIN]
```

#### Annonces
```
GET    /api/v1/annonces              ?region=&race=&prixMin=&prixMax=&page=&size=
GET    /api/v1/annonces/{id}
POST   /api/v1/annonces             [ELEVEUR, KYC requis]
PUT    /api/v1/annonces/{id}        [ELEVEUR, propriétaire]
DELETE /api/v1/annonces/{id}        [ELEVEUR, propriétaire]
GET    /api/v1/annonces/me          [ELEVEUR]
POST   /api/v1/annonces/{id}/top-lot [ELEVEUR]
```

#### Séquestre
```
POST   /api/v1/sequestres                        [ACHETEUR]
POST   /api/v1/sequestres/{id}/bloquer           [ACHETEUR]
POST   /api/v1/sequestres/{id}/confirmer-reception [ACHETEUR]
POST   /api/v1/sequestres/{id}/confirmer-livraison [ELEVEUR]
POST   /api/v1/sequestres/{id}/litige            [ACHETEUR]
POST   /api/v1/sequestres/admin/{id}/rembourser  [ADMIN]
GET    /api/v1/sequestres/me
```

#### Messages
```
POST   /api/v1/messages                          { annonceId, receiverId, content }
GET    /api/v1/messages/annonce/{annonceId}
PUT    /api/v1/messages/annonce/{annonceId}/read
GET    /api/v1/messages/unread-count
```

#### Avis
```
POST   /api/v1/avis                              { sequestreId, cibleId, note, commentaire }
GET    /api/v1/avis/user/{userId}
GET    /api/v1/avis/user/{userId}/note
```

---

## 9. Lancer le projet

### Prérequis

- Java 21+
- Maven 3.9+
- Docker & Docker Compose

### Démarrage rapide

```bash
# 1. Cloner le repo
git clone https://github.com/your-org/chana9.git
cd chana9

# 2. Démarrer PostgreSQL
docker-compose up -d postgres

# 3. Lancer le backend (profil dev)
cd backend
mvn spring-boot:run -Dspring-boot.run.profiles=dev
```

L'API est disponible sur `http://localhost:8080/api/v1`

### Avec Docker complet

```bash
# Build + démarrage backend + postgres
docker-compose up --build

# Rebuild uniquement le backend
docker-compose up --build backend
```

### Sans Docker (PostgreSQL local)

```bash
# Créer la base de données
psql -U postgres -c "CREATE DATABASE chana9;"
psql -U postgres -c "CREATE USER chana9 WITH PASSWORD 'chana9';"
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE chana9 TO chana9;"

# Lancer
cd backend
mvn spring-boot:run -Dspring-boot.run.profiles=dev
```

---

## 10. Variables d'environnement

| Variable | Description | Défaut (dev) |
|---|---|---|
| `DATABASE_URL` | URL JDBC PostgreSQL | `jdbc:postgresql://localhost:5432/chana9` |
| `DATABASE_USER` | Utilisateur PostgreSQL | `chana9` |
| `DATABASE_PASSWORD` | Mot de passe PostgreSQL | `chana9` |
| `JWT_SECRET` | Secret de signature JWT (min 32 chars) | `dev_secret_change_in_prod` |
| `SPRING_PROFILES_ACTIVE` | Profil Spring actif | `dev` |

> ⚠️ Ne jamais committer de vraies valeurs de production.
> Utiliser un fichier `.env` ou les secrets de votre CI/CD.

Exemple de fichier `.env` (non versionné) :
```env
DATABASE_URL=jdbc:postgresql://localhost:5432/chana9
DATABASE_USER=chana9
DATABASE_PASSWORD=chana9
JWT_SECRET=un_secret_tres_long_et_aleatoire_pour_la_prod
SPRING_PROFILES_ACTIVE=dev
```

---

## 11. Tests

```bash
# Lancer tous les tests
cd backend
mvn test

# Lancer un module spécifique
mvn test -Dtest=AnnonceServiceTest

# Rapport de couverture
mvn verify jacoco:report
# Rapport disponible dans target/site/jacoco/index.html
```

### Structure des tests

```
test/java/ma/chana9/
├── modules/
│   ├── auth/AuthServiceTest.java         ← OTP, JWT
│   ├── annonce/AnnonceServiceTest.java   ← CRUD, filtres, expiration
│   └── sequestre/SequestreServiceTest.java ← transitions d'état, commission
└── shared/
    └── JwtServiceTest.java
```

---

## 12. Conventions de code

### Règles générales

- **Jamais d'entité exposée directement** — toujours mapper vers un DTO
- **`@Transactional`** sur toutes les méthodes de service qui écrivent en base
- **`@Valid`** sur tous les `@RequestBody` dans les controllers
- **Javadoc** sur toutes les méthodes `public` des services
- Tous les **timestamps en UTC** (`spring.jackson.time-zone: UTC`)
- Les **UUIDs** sont toujours de type `UUID` en Java, `UUID` en PostgreSQL

### Nommage

| Élément | Convention | Exemple |
|---|---|---|
| Packages | lowercase | `ma.chana9.modules.annonce` |
| Classes | PascalCase | `AnnonceService` |
| Méthodes | camelCase | `findByEleveurId()` |
| Variables | camelCase | `montantCommission` |
| Constantes | UPPER_SNAKE | `MAX_COMMISSION_DH` |
| Tables SQL | snake_case | `annonce_photos` |
| Colonnes SQL | snake_case | `kyc_verified` |

### Règles Git

```
feat/     → nouvelle fonctionnalité
fix/      → correction de bug
refactor/ → refactoring sans changement de comportement
migration/→ nouvelle migration Liquibase
```

Exemples :
```
feat/sequestre-confirmation-bilaterale
fix/otp-expiry-timezone
migration/add-avis-table
```

---

## Licence

Usage interne — Projet Chana9 · 2024-2025