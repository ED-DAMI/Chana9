#!/bin/bash

REPO="ED-DAMI/Chana9"

echo "Creating US-AUTH-002: Modification du mot de passe & Autofill..."
gh issue create \
  --repo "$REPO" \
  --title "feat(auth): US-AUTH-002 — Modification du mot de passe et Saisie Automatique (Autofill)" \
  --label "user-story,authentication,security" \
  --body "## User Story
En tant qu'utilisateur inscrit sur Chana9,
Je veux pouvoir modifier mon mot de passe depuis mon profil et enregistrer mes identifiants pour un préremplissage automatique lors de la connexion,
Afin de renforcer la sécurité de mon compte et de me connecter plus rapidement.

---

## Critères d'Acceptation

### CA 1 — Accès à la modification du mot de passe
- [ ] Étant donné un utilisateur connecté sur la page « Mon Profil »
- [ ] Quand il clique sur l'option « Changer le mot de passe » (avec icône 🔒)
- [ ] Alors il est redirigé vers l'écran de modification du mot de passe

### CA 2 — Formulaire et validation de la modification
- [ ] Étant donné l'écran de modification de mot de passe
- [ ] Quand l'utilisateur saisit son mot de passe actuel, le nouveau mot de passe et la confirmation
- [ ] Alors le système vérifie en temps réel la force du mot de passe (8 caractères min., 1 majuscule, 1 chiffre)
- [ ] Si le mot de passe actuel est correct et la confirmation identique, le bouton « Enregistrer » s'active
- [ ] Une fois validé, un message de succès s'affiche : _« Mot de passe mis à jour avec succès. »_

### CA 3 — Préremplissage automatique (Autofill System)
- [ ] Étant donné un utilisateur sur la page de connexion (\`LoginScreen\`)
- [ ] Quand il clique sur le champ « Numéro de téléphone » ou « Mot de passe »
- [ ] Alors le clavier du système (iOS Keychain / Android Autofill) propose automatiquement les identifiants préenregistrés
- [ ] La sélection préremplit simultanément le numéro et le mot de passe

### CA 4 — Option « Se souvenir de moi » et reconnexion rapide
- [ ] Étant donné l'écran de connexion
- [ ] Quand l'utilisateur coche la case « Se souvenir de moi » lors d'une connexion réussie
- [ ] Alors ses identifiants (ou jeton de rafraîchissement) sont stockés de manière chiffrée sur l'appareil
- [ ] Lors de la réouverture de l'application, l'utilisateur est soit directement connecté, soit ses champs sont préremplis

---

## Tâches techniques

### Backend
- [ ] \`PUT /api/v1/users/change-password\` — endpoint sécurisé demandant \`oldPassword\`, \`newPassword\` et \`confirmPassword\`
- [ ] Validation du mot de passe actuel via \`PasswordEncoder\` (BCrypt)
- [ ] Invalidation / révocation des tokens JWT existants après changement de mot de passe pour forcer la re-sécurisation des sessions
- [ ] Gestion des erreurs : \`400 Bad Request\` (Mots de passe non identiques / Critères non respectés), \`401 Unauthorized\` (Ancien mot de passe incorrect)

### Flutter
- [ ] Écran \`ChangePasswordPage\` avec masquage/affichage du texte via icône d'œil (\`VisibilityToggle\`)
- [ ] Intégration de \`AutofillGroup\` et \`AutofillHints\` (\`AutofillHints.telephoneNumber\` / \`AutofillHints.password\`) sur le formulaire de login
- [ ] Stockage sécurisé des identifiants/tokens via \`flutter_secure_storage\` (utilisant KeyStore sur Android et Keychain sur iOS)
- [ ] Intégration de la case à cocher « Se souvenir de moi »
- [ ] BLoC \`AuthBloc\` / \`PasswordBloc\` gérant les états : \`PasswordUpdating\`, \`PasswordSuccess\`, \`PasswordFailure\`

### Sécurité & conformité
- [ ] Aucun stockage du mot de passe en texte clair (chiffrement RSA/AES sur l'appareil si stocké)
- [ ] Protection contre les attaques par force brute (rate limiting sur l'endpoint de changement de mot de passe)
- [ ] Transmission HTTPS stricte de toutes les requêtes d'authentification"

echo ""
echo "✅ US-AUTH-002 créée sur $REPO"