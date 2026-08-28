#!/bin/bash

REPO="ED-DAMI/Chana9"

echo "Creating labels..."
gh label create "user-story" --repo "$REPO" --color "0075ca" --force
gh label create "auth" --repo "$REPO" --color "e4e669" --force
gh label create "backend" --repo "$REPO" --color "d93f0b" --force
gh label create "mobile" --repo "$REPO" --color "0e8a16" --force

echo ""
echo "Creating US-AUTH-02: Réinitialisation du mot de passe par OTP..."
gh issue create \
  --repo "$REPO" \
  --title "feat(auth): US-AUTH-02 — Réinitialisation du mot de passe par OTP" \
  --label "user-story,auth" \
  --body "## User Story
En tant qu'utilisateur de Chana9,
Je veux pouvoir réinitialiser mon mot de passe via un code OTP envoyé sur mon téléphone,
Afin de récupérer l'accès à mon compte si j'ai oublié mon mot de passe.

---

## Flux complet

\`\`\`
Étape 1 : L'utilisateur clique sur « Mot de passe oublié »
Étape 2 : Il saisit son numéro de téléphone
Étape 3 : Le système envoie un code OTP à 6 chiffres par SMS
Étape 4 : L'utilisateur saisit le code OTP reçu
Étape 5 : Le système valide le code OTP
Étape 6 : L'utilisateur saisit son nouveau mot de passe (+ confirmation)
Étape 7 : Le mot de passe est mis à jour, toutes les sessions actives sont révoquées
Étape 8 : L'utilisateur est redirigé vers la page de connexion
\`\`\`

---

## Critères d'Acceptation

### CA 1 — Demande de réinitialisation
- [ ] L'utilisateur accède à la page « Mot de passe oublié » depuis la page de connexion
- [ ] Il saisit son numéro de téléphone marocain (format +212XXXXXXXXX ou 06XXXXXXXX)
- [ ] Si le numéro est inconnu → message d'erreur \`error.auth.phone-not-found\`
- [ ] Si le numéro est connu → un OTP à 6 chiffres est généré et envoyé par SMS
- [ ] L'OTP est valide pendant **5 minutes** uniquement
- [ ] Un seul OTP actif à la fois par numéro (l'ancien est invalidé si nouvelle demande)
- [ ] Limite anti-spam : max **3 demandes par heure** par numéro

### CA 2 — Saisie et validation de l'OTP
- [ ] L'utilisateur saisit le code OTP reçu par SMS
- [ ] Si le code est incorrect → message d'erreur \`error.auth.invalid-otp\`
- [ ] Si le code est expiré → message d'erreur \`error.auth.token-expired\`
- [ ] Si 5 tentatives incorrectes consécutives → OTP invalidé, nouvelle demande requise
- [ ] Si le code est correct → l'utilisateur accède à l'étape de nouveau mot de passe

### CA 3 — Nouveau mot de passe
- [ ] L'utilisateur saisit son nouveau mot de passe
- [ ] Validation : minimum 8 caractères, au moins 1 chiffre
- [ ] L'utilisateur confirme le nouveau mot de passe (les deux doivent correspondre)
- [ ] Si confirmation incorrecte → message \`error.auth.password-mismatch\`
- [ ] Le nouveau mot de passe ne peut pas être identique à l'ancien
- [ ] Après validation → le mot de passe est mis à jour en base (bcrypt)

### CA 4 — Sécurité post-réinitialisation
- [ ] Toutes les sessions actives (refresh tokens) sont révoquées après réinitialisation
- [ ] L'OTP est marqué comme utilisé et ne peut plus être réutilisé
- [ ] Un audit log est créé avec l'action \`PASSWORD_RESET\`
- [ ] L'utilisateur est redirigé vers \`/login\` avec un message de succès

### CA 5 — Gestion des erreurs réseau
- [ ] Si le SMS ne peut pas être envoyé → message d'erreur clair
- [ ] Si le réseau est indisponible → message \`Pas de connexion internet\`
- [ ] Bouton \`Renvoyer le code\` disponible après 60 secondes (countdown)

---

## Tâches techniques

### Backend
- [ ] \`POST /api/v1/auth/forgot-password\` — déjà existant, vérifier implémentation
- [ ] \`POST /api/v1/auth/reset-password\` — déjà existant, vérifier implémentation
- [ ] Ajouter champ \`attempts\` sur \`OtpCode\` pour limiter les tentatives
- [ ] Ajouter rate limiting : max 3 OTP/heure par numéro
- [ ] Valider que le nouveau mot de passe ≠ ancien mot de passe
- [ ] Révoquer tous les refresh tokens après reset (\`revokeAllUserTokens\`)
- [ ] Logger l'action \`PASSWORD_RESET\` dans \`audit_log\`
- [ ] Ajouter clés i18n manquantes : \`error.auth.password-mismatch\`, \`error.auth.otp-max-attempts\`, \`error.auth.otp-rate-limit\`

### Flutter
- [ ] \`ForgotPasswordPage\` — saisie du numéro de téléphone
- [ ] \`OtpVerificationPage\` — saisie du code OTP à 6 chiffres + countdown 60s
- [ ] \`ResetPasswordPage\` — saisie + confirmation du nouveau mot de passe
- [ ] \`AuthRemoteDataSource\` — méthodes \`sendOtp()\` et \`resetPassword()\`
- [ ] \`AuthRepository\` + \`AuthRepositoryImpl\` — ajouter les 2 méthodes
- [ ] UseCases : \`SendResetOtp\` · \`VerifyOtp\` · \`ResetPassword\`
- [ ] \`AuthBloc\` — ajouter events : \`SendOtpEvent\`, \`VerifyOtpEvent\`, \`ResetPasswordEvent\`
- [ ] Countdown 60s avec \`Timer.periodic\` sur \`OtpVerificationPage\`
- [ ] Auto-focus sur les 6 champs OTP (style code SMS)
- [ ] Masquer/afficher le mot de passe (icône œil)

### Navigation GoRouter
- [ ] \`/forgot-password\` → \`ForgotPasswordPage\`
- [ ] \`/otp-verification\` → \`OtpVerificationPage\`
- [ ] \`/reset-password\` → \`ResetPasswordPage\`

---

## Maquette flux

\`\`\`
LoginPage
  └── [Mot de passe oublié ?]
        └── ForgotPasswordPage
              └── [Envoyer le code]
                    └── OtpVerificationPage
                          ├── [Saisir OTP] ──✅──► ResetPasswordPage
                          │                              └── [Valider] → LoginPage ✅
                          └── [Renvoyer] (après 60s)
\`\`\`

---

## Entité OtpCode (existante — vérifier les champs)

\`\`\`
otp_codes
  id            UUID
  phone         String
  code          String (haché)
  used          Boolean
  attempts      Integer       ← à ajouter si manquant
  expires_at    Timestamp
  created_at    Timestamp
\`\`\`

---

## Endpoints

| Méthode | Endpoint | Description |
|---|---|---|
| POST | \`/api/v1/auth/forgot-password\` | Envoie OTP par SMS |
| POST | \`/api/v1/auth/reset-password\` | Valide OTP + met à jour le mot de passe |

### Request — forgot-password
\`\`\`json
{ \"phone\": \"0612345678\" }
\`\`\`

### Request — reset-password
\`\`\`json
{
  \"phone\": \"0612345678\",
  \"otp\": \"483920\",
  \"newPassword\": \"motdepasse123\",
  \"confirmPassword\": \"motdepasse123\"
}
\`\`\`

### Response — succès
\`\`\`json
{
  \"success\": true,
  \"message\": \"Votre mot de passe a été réinitialisé avec succès.\",
  \"data\": null
}
\`\`\`"

echo ""
echo "✅ Issue US-AUTH-02 créée sur $REPO"