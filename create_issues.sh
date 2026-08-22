#!/bin/bash

# ============================================================
#  Chana9 — Issues GitHub : Amélioration UI/UX & Adresse
#  Repo : ED-DAMI/Chana9
#  Périmètre :
#    - Refonte du formulaire de création d'annonce (Icônes)
#    - Structuration & stockage de l'adresse lisible
#  Prérequis : gh CLI installé + authentifié (gh auth login)
# ============================================================

REPO="ED-DAMI/Chana9"

echo "🚀 Création des issues UI/UX & Adresse pour $REPO..."
echo ""

# ------------------------------------------------------------
# LABELS
# ------------------------------------------------------------
echo "🏷️  Création des labels..."

gh label create "feature"      --color "0075ca" --description "Nouvelle fonctionnalité"          --repo $REPO 2>/dev/null || true
gh label create "ui/ux"        --color "a2eeef" --description "Amélioration interface & expérience" --repo $REPO 2>/dev/null || true
gh label create "flutter"      --color "54c5f8" --description "Couche Flutter / mobile"           --repo $REPO 2>/dev/null || true
gh label create "backend"      --color "f9d0c4" --description "Nécessite un endpoint backend"     --repo $REPO 2>/dev/null || true
gh label create "database"     --color "0052cc" --description "Modifications base de données"      --repo $REPO 2>/dev/null || true

echo "✅ Labels prêts"
echo ""

# ------------------------------------------------------------
# MILESTONE
# ------------------------------------------------------------
echo "📌 Création du milestone UI/UX & Navigation v1..."

gh api repos/$REPO/milestones \
  --method POST \
  -f title="UI/UX & Address Enhancements v1" \
  -f description="Ajout des icônes dans la création d'annonce et structuration des adresses lisibles" \
  -f state="open" 2>/dev/null || true

echo "✅ Milestone prêt"
echo ""

# ============================================================
# ISSUE 1 — Flutter : Icônes dans le Stepper & Formulaire
# ============================================================
echo "📝 Issue 1 : Integration des icônes dans la création d'annonce..."

gh issue create \
  --repo $REPO \
  --title "[FLUTTER] UI/UX — Intégration des icônes dans le formulaire de création d'annonce" \
  --label "ui/ux,flutter" \
  --milestone "UI/UX & Address Enhancements v1" \
  --body "## 🎯 Objectif
Enrichir la lisibilité visuelle du formulaire de création d'une nouvelle annonce en ajoutant des icônes dédiées dans le Stepper et sur chaque champ de saisie (*prefixIcon*).

## 📋 Modifications UI

### 1. Stepper Global
Remplacer/accoupler les numéros d'étapes avec des icônes :
- **Étape 1 (Photos) :** \`Icons.photo_camera_rounded\`
- **Étape 2 (L'animal) :** \`Icons.pets_rounded\`
- **Étape 3 (Prix & Détails) :** \`Icons.sell_rounded\`
- **Étape 4 (Localisation) :** \`Icons.location_on_rounded\`

### 2. Étape 2 (L'animal) — Prefix Icons
- **Race :** \`Icons.category_outlined\`
- **Sexe :** Boutons segmentés avec \`Icons.male\` et \`Icons.female\`
- **Âge (mois) :** \`Icons.calendar_today_outlined\`
- **Poids (kg) :** \`Icons.scale_outlined\`
- **Dentition :** \`Icons.format_list_bulleted\`
- **Nombre de têtes :** \`Icons.groups_outlined\`
- **ONSSA :** \`Icons.verified_outlined\`
- **Éligible aux aides :** \`Icons.volunteer_activism_outlined\`

### 3. Étape 3 (Prix & Détails)
- **Titre :** \`Icons.title_rounded\`
- **Prix :** Suffixe \`MAD\` + \`Icons.payments_outlined\`
- **Prix négociable :** \`Icons.handshake_outlined\`
- **Description :** \`Icons.description_outlined\`

### 4. Étape 4 (Localisation)
- **Région :** \`Icons.map_outlined\`
- **Ville :** \`Icons.location_city_outlined\`
- **Adresse précise :** \`Icons.pin_drop_outlined\`
- **Livraison :** \`Icons.local_shipping_outlined\`

## 📁 Fichiers impactés
\`\`\`
lib/features/announcements/presentation/pages/create_announcement_page.dart
lib/features/announcements/presentation/widgets/
\`\`\`"

echo "✅ Issue 1 créée"
echo ""

# ============================================================
# ISSUE 2 — Database & Backend : Migration Schéma Adresse Lisible
# ============================================================
echo "📝 Issue 2 : Migration DB pour adresse lisible..."

gh issue create \
  --repo $REPO \
  --title "[BACKEND] DB — Structuration de l'adresse lisible (Formatted Address & Landmark)" \
  --label "feature,backend,database" \
  --milestone "UI/UX & Address Enhancements v1" \
  --body "## 🎯 Objectif
Mettre à jour le schéma de la base de données pour prendre en compte les adresses sous forme textuelle lisible (points de repère, douar, instructions) en plus du Plus Code et des coordonnées GPS.

## 📋 Changements Schema (Liquibase \`018-address-enhancements.yaml\`)

\`\`\`sql
-- Extension de la table addresses
ALTER TABLE addresses
  ADD COLUMN formatted_address VARCHAR(255) NULL,
  ADD COLUMN landmark          VARCHAR(255) NULL,
  ADD COLUMN district_or_douar VARCHAR(100) NULL;
\`\`\`

## 📋 Tâches
- [ ] Créer le changelog Liquibase \`018-address-enhancements.yaml\`
- [ ] Mettre à jour l'entité \`Address.java\` dans la couche domain
- [ ] Mettre à jour les DTOs \`AddressRequest\` et \`AddressResponse\`
- [ ] Mettre à jour les Mappers (MapStruct)

## 📁 Fichiers à modifier
\`\`\`
src/main/resources/db/changelog/018-address-enhancements.yaml
ma.chana9.modules.announcement.domain.Address.java
ma.chana9.modules.announcement.dto.AddressRequest.java
\`\`\`"

echo "✅ Issue 2 créée"
echo ""

# ============================================================
# ISSUE 3 — Flutter : Composant Saisie d'Adresse Complexe
# ============================================================
echo "📝 Issue 3 : Formulaire de localisation lisible..."

gh issue create \
  --repo $REPO \
  --title "[FLUTTER] UI — Composant de saisie d'adresse lisible avec point de repère" \
  --label "ui/ux,flutter" \
  --milestone "UI/UX & Address Enhancements v1" \
  --body "## 🎯 Objectif
Concevoir l'interface à l'étape 4 pour permettre à l'utilisateur de saisir son adresse de manière lisible (champ texte libre / point de repère) couplé au Plus Code/GPS.

## 📋 Tâches UI

- [ ] Champ **Région** (Dropdown avec \`Icons.map\`)
- [ ] Champ **Ville** (Dropdown avec \`Icons.location_city\`)
- [ ] Champ **Quartier / Douar** (TextField optionnel)
- [ ] Champ **Point de repère / Détail lisible** (Ex: *\"Près de la mosquée, porte verte\"*)
- [ ] Intégration du bouton GPS **\"Position OK / Détecter\"** pour remplir automatiquement le Plus Code
- [ ] Génération dynamique du \`formatted_address\` à envoyer au backend

## 📁 Fichiers à créer / modifier
\`\`\`
lib/features/announcements/presentation/widgets/location_step_form.dart
lib/features/announcements/domain/entities/address.dart
\`\`\`"

echo "✅ Issue 3 créée"
echo ""

# ============================================================
# RÉSUMÉ
# ============================================================
echo "═══════════════════════════════════════════════════════"
echo "✅  TOUTES LES ISSUES ONT ÉTÉ CRÉÉES !"
echo "═══════════════════════════════════════════════════════"
echo "🔗 Voir les issues : https://github.com/$REPO/issues"