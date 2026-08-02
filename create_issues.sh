#!/bin/bash

REPO="ED-DAMI/Chana9"

echo "Creating US-PAY-001: Paiement par Carte Bancaire..."
gh issue create \
  --repo "$REPO" \
  --title "feat(payment): US-PAY-001 — Paiement par Carte Bancaire (Déblocage Contact 20 DH)" \
  --label "user-story,payment" \
  --body "## User Story
En tant qu'acheteur / utilisateur sur Chana9,
Je veux régler 20 DH par Carte Bancaire marocaine ou internationale directement depuis l'application,
Afin de débloquer immédiatement le numéro de téléphone de l'éleveur.

---

## Critères d'Acceptation

### CA 1 — Choix du mode de paiement
- [ ] Étant donné un utilisateur sur la modale d'achat de contact
- [ ] Quand il choisit l'option « Carte Bancaire (Visa / Mastercard / CMI) »
- [ ] Alors un bouton « Payer 20 DH par Carte » s'affiche

### CA 2 — Redirection vers la passerelle sécurisée (WebView)
- [ ] Étant donné que l'utilisateur clique sur « Payer 20 DH par Carte »
- [ ] Quand la demande est envoyée au backend
- [ ] Alors une WebView sécurisée (ou le SDK CMI/PayZone) s'ouvre
- [ ] L'URL affichée est celle de la passerelle de paiement certifiée
- [ ] Le montant affiché sur l'écran bancaire est strictement de 20,00 MAD

### CA 3 — Validation de la transaction (3D Secure)
- [ ] Étant donné que l'utilisateur saisit ses informations bancaires (Numéro de carte, Date d'expiration, CVV)
- [ ] Quand il valide et franchit l'étape 3D Secure (code OTP SMS de sa banque)
- [ ] Alors la passerelle notifie le backend via un Webhook/IPN sécurisé

### CA 4 — Succès du paiement et déblocage
- [ ] Étant donné que la banque confirme le succès du paiement
- [ ] Quand la WebView se ferme automatiquement
- [ ] Alors un message de confirmation s'affiche : _« Paiement réussi ! Contact débloqué. »_
- [ ] Le numéro de téléphone de l'éleveur s'affiche sur la fiche de l'annonce
- [ ] Le bouton d'action devient \`Appeler\` (sans mention de prix)

### CA 5 — Gestion des échecs / Annulations
- [ ] Étant donné un échec de paiement (solde insuffisant, abandon, erreur réseau)
- [ ] Quand la transaction échoue ou est annulée
- [ ] Alors la WebView se ferme
- [ ] Un message clair s'affiche : _« Le paiement n'a pas pu être finalisé. Aucun montant n'a été débité. »_
- [ ] L'annonce reste dans son état verrouillé (\`Appeler (20 DH)\`)

---

## Tâches techniques

### Backend
- [ ] Créer entité \`ContactUnlock\` (buyer, annonce, status, transactionId, amount, createdAt)
- [ ] \`POST /annonces/{id}/contact/initiate\` — crée la session de paiement côté passerelle (CMI/PayZone) et retourne l'URL de redirection
- [ ] \`POST /payments/webhook\` — endpoint IPN/Webhook sécurisé (vérification signature HMAC)
- [ ] \`PaymentService.handleSuccess()\` — enregistre le paiement en base, met à jour \`ContactUnlock.status = COMPLETED\`
- [ ] \`PaymentService.handleFailure()\` — enregistre l'échec, status \`FAILED\`, aucun débit
- [ ] \`GET /annonces/{id}/contact\` — retourne le numéro de téléphone si \`ContactUnlock\` existe et est \`COMPLETED\`
- [ ] Idempotence : éviter le double débit si le webhook est reçu plusieurs fois (unicité sur \`transactionId\`)
- [ ] Liquibase migration pour les tables \`contact_unlocks\` et \`payment_transactions\`

### Flutter
- [ ] Modale « Débloquer le contact » avec option carte bancaire
- [ ] Bouton « Payer 20 DH par Carte » → appel API \`/initiate\` → ouverture WebView
- [ ] \`PaymentWebViewPage\` — WebView sécurisée, écoute l'URL de retour (success/cancel/failure)
- [ ] Polling ou deep link de retour pour confirmer l'état de la transaction
- [ ] Affichage du numéro de téléphone après confirmation de succès
- [ ] Transition du bouton vers \`Appeler\` (sans prix) après déblocage
- [ ] Toast d'erreur clair en cas d'échec ou d'abandon
- [ ] BLoC \`PaymentBloc\` avec états : \`PaymentInitial\`, \`PaymentLoading\`, \`PaymentSuccess\`, \`PaymentFailure\`

### Sécurité & conformité
- [ ] Jamais de données bancaires stockées en backend (délégation totale à la passerelle)
- [ ] Webhook protégé par vérification de signature (header \`X-Signature\`)
- [ ] HTTPS obligatoire sur toutes les URLs de redirection
- [ ] Montant fixé côté backend (jamais côté client) : 20,00 MAD"

echo ""
echo "✅ US-PAY-001 créée sur $REPO"