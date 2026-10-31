#!/bin/bash

REPO="ED-DAMI/Chana9"

echo "Creating labels..."
gh label create "testing" --repo "$REPO" --color "8B4513" --force
gh label create "backend" --repo "$REPO" --color "d93f0b" --force
gh label create "mobile" --repo "$REPO" --color "0e8a16" --force
gh label create "security" --repo "$REPO" --color "e11d48" --force
gh label create "performance" --repo "$REPO" --color "7c3aed" --force

echo ""
echo "Creating ISSUE-TEST-01: Tests unitaires Backend..."
gh issue create \
  --repo "$REPO" \
  --title "test(backend): Tests unitaires — Services et UseCases" \
  --label "testing,backend" \
  --body "## Objectif
Couvrir tous les services métier par des tests unitaires avec JUnit 5 + Mockito.
Cible : **couverture minimale 80%** sur les classes de service.

---

## Stack de test
\`\`\`
JUnit 5
Mockito
AssertJ
Spring Boot Test
\`\`\`

---

## AnnonceService — cas à tester

### create()
- [ ] Création réussie avec tous les champs obligatoires
- [ ] Création avec localisation GPS (Point PostGIS)
- [ ] Échec si utilisateur non trouvé
- [ ] Quota dépassé : USER avec 3 annonces actives → 403
- [ ] USER_PREMIUM → pas de limite de quota
- [ ] Notification alertes matchantes après création

### update()
- [ ] Mise à jour réussie par le propriétaire
- [ ] Échec si l'utilisateur n'est pas le propriétaire → 403
- [ ] Échec si annonce non trouvée → 404

### delete()
- [ ] Suppression réussie par le propriétaire
- [ ] Échec si non propriétaire → 403

### suspend() / reactivate() / markAsSold()
- [ ] Changement de statut réussi par le propriétaire
- [ ] Échec si non propriétaire → 403

### addFavorite()
- [ ] Ajout réussi
- [ ] Doublon → 409 CONFLICT
- [ ] Incrémentation de favoritesCount

### removeFavorite()
- [ ] Suppression réussie
- [ ] Favori inexistant → 404
- [ ] Décrémentation de favoritesCount

### report()
- [ ] Signalement réussi
- [ ] Doublon → 409
- [ ] Signaler sa propre annonce → 403
- [ ] Auto-suspension après 5 signalements PENDING

---

## AuthService — cas à tester

### register()
- [ ] Inscription réussie
- [ ] Téléphone déjà existant → 400

### login()
- [ ] Connexion réussie avec bon mot de passe
- [ ] Mauvais mot de passe → 401
- [ ] Téléphone inexistant → 401

### sendResetOtp()
- [ ] OTP envoyé si téléphone trouvé
- [ ] Téléphone inexistant → 404

### resetPassword()
- [ ] Reset réussi avec OTP valide
- [ ] OTP expiré → 401
- [ ] OTP déjà utilisé → 401
- [ ] Ancien mot de passe identique → 400
- [ ] Révocation de tous les refresh tokens après reset

---

## UserService — cas à tester

### getProfile()
- [ ] Profil trouvé
- [ ] Utilisateur inexistant → 404

### updateProfile()
- [ ] Mise à jour réussie
- [ ] Utilisateur inexistant → 404

### changePassword()
- [ ] Changement réussi
- [ ] Ancien mot de passe incorrect → 400

### submitKyc()
- [ ] Soumission réussie
- [ ] KYC déjà vérifié → 409

### approveKyc() / rejectKyc()
- [ ] Approbation réussie
- [ ] Rejet avec nettoyage des fichiers

---

## PaymentService — cas à tester

### initiateContactUnlock()
- [ ] Initiation réussie
- [ ] Contact déjà débloqué → 409
- [ ] Débloquer sa propre annonce → 403
- [ ] Annonce inexistante → 404

### handleSuccess()
- [ ] Idempotence : webhook reçu deux fois → pas de doublon
- [ ] Signature invalide → 401

### getContactUnlock()
- [ ] COMPLETED → retourne le numéro de téléphone
- [ ] PENDING → retourne sans numéro
- [ ] Inexistant → 404

---

## TokenService — cas à tester

- [ ] generateAccessToken() → JWT valide avec claims corrects
- [ ] extractUserId() → UUID correct extrait du JWT
- [ ] extractRole() → rôle correct extrait
- [ ] isAccessTokenBlacklisted() → vrai si blacklisté
- [ ] rotateRefreshToken() → nouveau token généré, ancien révoqué
- [ ] rotateRefreshToken() → device fingerprint mismatch → exception + révocation
- [ ] rotateRefreshToken() → token expiré → exception

---

## Livrables
- [ ] \`AnnonceServiceTest.java\`
- [ ] \`AuthServiceTest.java\`
- [ ] \`UserServiceTest.java\`
- [ ] \`PaymentServiceTest.java\`
- [ ] \`TokenServiceTest.java\`
- [ ] Rapport de couverture JaCoCo ≥ 80%"

echo ""
echo "Creating ISSUE-TEST-02: Tests d'intégration Backend..."
gh issue create \
  --repo "$REPO" \
  --title "test(backend): Tests d'intégration — API REST avec base de données" \
  --label "testing,backend" \
  --body "## Objectif
Tester les endpoints REST de bout en bout avec une base de données PostgreSQL de test.

---

## Stack de test
\`\`\`
Spring Boot Test (@SpringBootTest)
MockMvc ou RestAssured
Testcontainers (PostgreSQL)
@Sql (fixtures)
@Transactional (rollback après chaque test)
\`\`\`

---

## Configuration

\`\`\`yaml
# application-test.yml
spring:
  datasource:
    url: jdbc:tc:postgresql:15:///chana9_test
  jpa:
    hibernate:
      ddl-auto: create-drop
  liquibase:
    enabled: true
\`\`\`

---

## Auth — endpoints à tester

### POST /api/v1/auth/register
- [ ] 201 avec body valide
- [ ] 400 téléphone déjà existant
- [ ] 400 validation des champs (téléphone invalide, mot de passe trop court)

### POST /api/v1/auth/login
- [ ] 200 avec JWT + refresh token
- [ ] 401 mauvais mot de passe
- [ ] 401 téléphone inexistant

### POST /api/v1/auth/refresh
- [ ] 200 nouveau access token
- [ ] 401 refresh token expiré
- [ ] 401 refresh token révoqué
- [ ] 401 device fingerprint mismatch

### POST /api/v1/auth/logout
- [ ] 200 tokens révoqués
- [ ] 401 sans token

### POST /api/v1/auth/forgot-password
- [ ] 200 OTP envoyé
- [ ] 404 téléphone inconnu

### POST /api/v1/auth/reset-password
- [ ] 200 mot de passe réinitialisé
- [ ] 401 OTP invalide
- [ ] 401 OTP expiré

---

## Annonces — endpoints à tester

### POST /api/v1/annonces
- [ ] 201 annonce créée
- [ ] 401 non authentifié
- [ ] 403 USER avec quota dépassé (3 annonces actives)
- [ ] 400 champs obligatoires manquants

### GET /api/v1/annonces/{id}
- [ ] 200 annonce trouvée
- [ ] 404 annonce inexistante

### GET /api/v1/annonces/search
- [ ] 200 avec résultats filtrés par breed, region, prix
- [ ] 200 liste vide si aucun résultat
- [ ] Pagination correcte

### PATCH /api/v1/annonces/{id}/suspend
- [ ] 200 annonce suspendue par propriétaire
- [ ] 403 non propriétaire

### POST /api/v1/annonces/{id}/favorites
- [ ] 201 favori ajouté
- [ ] 409 déjà en favori
- [ ] 401 non authentifié

### POST /api/v1/annonces/{id}/reports
- [ ] 201 signalement créé
- [ ] 409 déjà signalé
- [ ] 403 signaler sa propre annonce

---

## Paiement — endpoints à tester

### POST /api/v1/annonces/{id}/contact/initiate
- [ ] 201 session créée avec paymentUrl
- [ ] 409 déjà débloqué
- [ ] 403 sa propre annonce

### POST /api/v1/payments/mock/success
- [ ] 200 statut COMPLETED
- [ ] Idempotence : appel deux fois → toujours 200

### GET /api/v1/annonces/{id}/contact
- [ ] 200 COMPLETED → numéro exposé
- [ ] 200 PENDING → numéro null
- [ ] 404 pas de déblocage

---

## Utilisateurs — endpoints à tester

### GET /api/v1/users/me
- [ ] 200 profil retourné
- [ ] 401 non authentifié

### PUT /api/v1/users/me
- [ ] 200 profil mis à jour
- [ ] 400 champs invalides

### PUT /api/v1/users/me/password
- [ ] 200 mot de passe changé
- [ ] 400 ancien mot de passe incorrect

### GET /api/v1/users/{id}/stats
- [ ] 200 stats retournées (totalAnnonces, activeAnnonces, totalSales)

---

## Livrables
- [ ] \`AnnonceControllerIT.java\`
- [ ] \`AuthControllerIT.java\`
- [ ] \`UserControllerIT.java\`
- [ ] \`PaymentControllerIT.java\`
- [ ] Configuration Testcontainers
- [ ] Fixtures SQL (\`test-data.sql\`)"

echo ""
echo "Creating ISSUE-TEST-03: Tests de sécurité Backend..."
gh issue create \
  --repo "$REPO" \
  --title "test(security): Tests de sécurité — Authentification et autorisations" \
  --label "testing,backend,security" \
  --body "## Objectif
Vérifier que tous les endpoints sont correctement protégés et que les rôles sont respectés.

---

## Endpoints publics — vérifier accessibles sans token

- [ ] GET /api/v1/annonces/{id} → 200
- [ ] GET /api/v1/annonces/search → 200
- [ ] GET /api/v1/annonces/seller/{id} → 200
- [ ] GET /api/v1/users/{id}/stats → 200
- [ ] POST /api/v1/auth/login → 200
- [ ] POST /api/v1/auth/register → 200

---

## Endpoints protégés — vérifier 401 sans token

- [ ] POST /api/v1/annonces → 401
- [ ] PUT /api/v1/annonces/{id} → 401
- [ ] DELETE /api/v1/annonces/{id} → 401
- [ ] POST /api/v1/annonces/{id}/favorites → 401
- [ ] GET /api/v1/users/me → 401
- [ ] POST /api/v1/annonces/{id}/contact/initiate → 401

---

## Autorisations par rôle

### USER
- [ ] Peut créer une annonce (max 3)
- [ ] Ne peut pas accéder aux endpoints ADMIN
- [ ] Peut modifier/supprimer seulement ses propres annonces

### USER_PREMIUM
- [ ] Peut créer des annonces illimitées
- [ ] Ne peut pas accéder aux endpoints ADMIN
- [ ] Même restrictions de propriété que USER

### ADMIN
- [ ] Accès à GET /api/v1/users → 200
- [ ] Accès à PUT /api/v1/users/{id}/role → 200
- [ ] Accès à PUT /api/v1/users/{id}/kyc/approve → 200

---

## Tests JWT

- [ ] Token expiré → 401
- [ ] Token avec signature invalide → 401
- [ ] Token blacklisté → 401
- [ ] Token avec rôle falsifié → 403
- [ ] Token sans rôle → 403

---

## Tests CSRF / Injection

- [ ] SQL injection dans les paramètres de recherche → 400 ou résultat vide
- [ ] XSS dans le titre d'une annonce → sanitisé ou refusé
- [ ] UUID malformé dans les path variables → 400

---

## Livrables
- [ ] \`SecurityIT.java\`
- [ ] \`RoleAuthorizationIT.java\`
- [ ] \`JwtSecurityTest.java\`"

echo ""
echo "Creating ISSUE-TEST-04: Tests Flutter — Widgets et BLoC..."
gh issue create \
  --repo "$REPO" \
  --title "test(mobile): Tests Flutter — Widgets, BLoC et UseCases" \
  --label "testing,mobile" \
  --body "## Objectif
Couvrir les composants Flutter critiques avec des tests unitaires et widget tests.

---

## Stack de test
\`\`\`
flutter_test
bloc_test
mocktail
\`\`\`

---

## Tests BLoC — AuthBloc

- [ ] \`CheckAuthStatusEvent\` → token présent → \`AuthAuthenticated\`
- [ ] \`CheckAuthStatusEvent\` → token absent → \`AuthUnauthenticated\`
- [ ] \`LoginEvent\` → succès → \`AuthAuthenticated\`
- [ ] \`LoginEvent\` → échec → \`AuthFailure\` avec message
- [ ] \`LogoutEvent\` → \`AuthUnauthenticated\`

---

## Tests BLoC — AnnonceBloc

- [ ] \`LoadAnnoncesEvent\` → succès → \`AnnonceLoaded\`
- [ ] \`LoadAnnoncesEvent\` → erreur réseau → \`AnnonceFailure\`
- [ ] \`CreateAnnonceEvent\` → succès → \`AnnonceCreated\`
- [ ] \`SearchAnnoncesEvent\` avec filtres → résultats filtrés
- [ ] \`AddFavoriteEvent\` → succès → état mis à jour
- [ ] \`AddFavoriteEvent\` → 409 → \`AnnonceFailure\` avec message

---

## Tests BLoC — AnnonceDetailBloc

- [ ] \`LoadDetailEvent\` → succès → \`DetailLoaded\`
- [ ] \`LoadDetailEvent\` → 404 → \`DetailFailure\`
- [ ] \`SuspendEvent\` → succès → \`ActionSuccess\`
- [ ] \`DeleteEvent\` → succès → \`Deleted\`
- [ ] \`ReportEvent\` → 409 déjà signalé → \`ActionFailure\`

---

## Tests Widget — LoginPage

- [ ] Affichage du champ téléphone et mot de passe
- [ ] Bouton désactivé si champs vides
- [ ] Message d'erreur affiché si login échoue
- [ ] Redirect vers /annonces si login réussit

---

## Tests Widget — AnnoncePostCard

- [ ] Affichage titre, prix, race, région
- [ ] Badge TOP LOT visible si isTopLot = true
- [ ] Badge VENDU visible si status = sold
- [ ] Icône cœur remplie si en favori

---

## Tests Widget — AnnonceFormPage

- [ ] Bouton Suivant disabled si breed non sélectionné (étape 2)
- [ ] Bouton Publier disabled si titre vide (étape 3)
- [ ] Validation prix → message si non numérique
- [ ] Upload photo → photo apparaît dans la grille

---

## Tests UseCases

- [ ] \`SearchAnnonces\` → appelle repository avec bons paramètres
- [ ] \`AddFavorite\` → retourne \`Right(unit)\` si succès
- [ ] \`AddFavorite\` → retourne \`Left(Failure)\` si 409
- [ ] \`ReportAnnonce\` → retourne \`Right\` si succès
- [ ] \`Login\` → sauvegarde token dans TokenStorage si succès

---

## Livrables
- [ ] \`auth_bloc_test.dart\`
- [ ] \`annonce_bloc_test.dart\`
- [ ] \`annonce_detail_bloc_test.dart\`
- [ ] \`login_page_test.dart\`
- [ ] \`annonce_post_card_test.dart\`
- [ ] \`annonce_form_page_test.dart\`
- [ ] \`search_annonces_usecase_test.dart\`"

echo ""
echo "Creating ISSUE-TEST-05: Tests de performance et charge..."
gh issue create \
  --repo "$REPO" \
  --title "test(performance): Tests de charge — API Backend" \
  --label "testing,backend,performance" \
  --body "## Objectif
Vérifier que l'API supporte la charge prévue, notamment pendant la période Aïd al-Adha.

---

## Outil
\`\`\`
k6 (https://k6.io)
\`\`\`

---

## Scénarios de charge

### Scénario 1 — Charge normale (hors saison)
\`\`\`
Utilisateurs virtuels : 100
Durée : 5 minutes
Endpoints : GET /search, GET /{id}
Cible : p95 < 500ms, 0% erreurs
\`\`\`

### Scénario 2 — Charge moyenne
\`\`\`
Utilisateurs virtuels : 500
Durée : 10 minutes
Endpoints : search, findById, login, createAnnonce
Cible : p95 < 1s, erreurs < 1%
\`\`\`

### Scénario 3 — Pic Aïd al-Adha
\`\`\`
Utilisateurs virtuels : 2000
Durée : 15 minutes
Montée en charge progressive : 0 → 2000 en 5 min
Endpoints : tous les endpoints publics + authentifiés
Cible : p95 < 2s, erreurs < 2%
\`\`\`

### Scénario 4 — Stress test
\`\`\`
Utilisateurs virtuels : 5000
Durée : 5 minutes
Objectif : identifier le point de rupture
\`\`\`

---

## Métriques à surveiller

- [ ] Temps de réponse p50, p95, p99
- [ ] Taux d'erreur HTTP
- [ ] Utilisation CPU du serveur
- [ ] Utilisation mémoire JVM
- [ ] Connexions PostgreSQL actives
- [ ] Temps de réponse base de données

---

## Optimisations à valider

- [ ] Index PostGIS sur \`location\` → recherche géographique < 200ms
- [ ] Index sur \`status, breed\` → filtrage < 100ms
- [ ] Pagination correcte → pas de full scan
- [ ] Cache des résultats de recherche fréquents

---

## Livrables
- [ ] \`k6/load_test_normal.js\`
- [ ] \`k6/load_test_peak.js\`
- [ ] \`k6/stress_test.js\`
- [ ] Rapport de performance avec graphiques
- [ ] Recommandations d'optimisation"

echo ""
echo "Creating ISSUE-TEST-06: Tests End-to-End Flutter..."
gh issue create \
  --repo "$REPO" \
  --title "test(e2e): Tests End-to-End — Parcours utilisateur complets" \
  --label "testing,mobile" \
  --body "## Objectif
Tester les parcours utilisateur critiques de bout en bout sur un appareil réel ou émulateur.

---

## Outil
\`\`\`
flutter_driver ou integration_test
\`\`\`

---

## Parcours 1 — Inscription et première connexion

- [ ] Ouvrir l'app → SplashPage → LoginPage
- [ ] Cliquer sur Créer un compte
- [ ] Saisir téléphone + mot de passe + confirmer
- [ ] Valider → redirection vers AnnonceListPage
- [ ] Vérifier que le feed s'affiche avec des annonces

---

## Parcours 2 — Connexion et déconnexion

- [ ] Saisir téléphone + mot de passe corrects
- [ ] Vérifier redirection vers AnnonceListPage
- [ ] Aller sur ProfilePage
- [ ] Cliquer Déconnexion → retour sur LoginPage

---

## Parcours 3 — Création d'une annonce

- [ ] Connecté → cliquer sur Publier
- [ ] Étape 1 : ajouter 2 photos depuis la galerie
- [ ] Étape 2 : sélectionner race SARDI, mâle, 18 mois, 45kg
- [ ] Étape 3 : titre, prix 3500 MAD, prix fixe
- [ ] Étape 4 : sélectionner région Fès-Meknès, ville Fès
- [ ] Cliquer Publier → annonce apparaît dans le feed

---

## Parcours 4 — Recherche et filtres

- [ ] Ouvrir AnnonceListPage
- [ ] Cliquer sur l'icône filtres
- [ ] Sélectionner race SARDI + région Oriental
- [ ] Appliquer → résultats filtrés affichés
- [ ] Réinitialiser filtres → toutes les annonces

---

## Parcours 5 — Favoris

- [ ] Ouvrir une fiche annonce
- [ ] Cliquer sur ❤️ Favori
- [ ] Vérifier icône remplie
- [ ] Aller sur /profile/favorites → annonce présente
- [ ] Retirer des favoris → annonce disparaît

---

## Parcours 6 — Signalement

- [ ] Ouvrir une fiche annonce
- [ ] Cliquer sur ··· → Signaler
- [ ] Sélectionner motif FRAUD_OR_SCAM
- [ ] Ajouter commentaire optionnel
- [ ] Valider → message de confirmation
- [ ] Retenter signalement → message déjà signalé

---

## Parcours 7 — Changement de langue

- [ ] ProfilePage → sélectionner Arabe
- [ ] Vérifier que l'UI passe en RTL
- [ ] Vérifier que les textes sont en arabe
- [ ] Sélectionner Tamazight → textes en Tifinagh
- [ ] Revenir en Français

---

## Parcours 8 — Mot de passe oublié

- [ ] LoginPage → Mot de passe oublié
- [ ] Saisir numéro de téléphone
- [ ] Saisir OTP reçu
- [ ] Saisir nouveau mot de passe + confirmation
- [ ] Redirection vers LoginPage
- [ ] Se connecter avec nouveau mot de passe → succès

---

## Livrables
- [ ] \`integration_test/auth_flow_test.dart\`
- [ ] \`integration_test/annonce_flow_test.dart\`
- [ ] \`integration_test/favorites_flow_test.dart\`
- [ ] \`integration_test/language_flow_test.dart\`
- [ ] \`integration_test/password_reset_flow_test.dart\`"

echo ""
echo "✅ Les 6 issues de testing ont été créées sur $REPO"