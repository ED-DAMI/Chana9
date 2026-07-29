#!/bin/bash

REPO="ED-DAMI/Chana9"

echo "Creating US-01: Création et Publication d'une Annonce..."
gh issue create \
  --repo "$REPO" \
  --title "feat(annonce): US-01 — Création et Publication d'une Annonce" \
  --label "user-story,annonce" \
  --body "## User Story
En tant qu'éleveur (Kassab) connecté,
Je veux pouvoir créer et publier une annonce de vente de bétail,
Afin que les acheteurs puissent trouver et consulter mon annonce.

---

## Critères d'Acceptation

### CA 1 — Saisie des champs obligatoires
- [ ] Le formulaire contient : Titre (ou génération automatique), Espèce / Race, Prix (Fixe / Négociable / Au Kilo), Localisation / Ville, Au moins une photo (Cover)
- [ ] Le bouton \"Publier\" est désactivé tant que tous les champs obligatoires ne sont pas renseignés
- [ ] Le bouton \"Publier\" devient actif une fois tous les champs obligatoires remplis

### CA 2 — Validation des attributs métiers
- [ ] Si \`weightKg\` est renseigné, il doit être strictement supérieur à 0 kg (\`@DecimalMin(inclusive = false)\`)
- [ ] Si \`onssaTagNumber\` est renseigné, il doit respecter le format alphanumérique (\`@Pattern(regexp = \"^[A-Za-z0-9]{4,20}\$\")\`)
- [ ] Si \`boardingAvailable = true\`, alors \`boardingDailyPrice\` est obligatoire (validator cross-field \`@ValidBoardingCoherence\`)

### CA 3 — Statut après soumission
- [ ] Une annonce soumise passe en statut \`PENDING_VALIDATION\`
- [ ] L'annonce en \`PENDING_VALIDATION\` n'apparaît pas dans la recherche publique
- [ ] \`AnnonceStatus\` contient la valeur \`PENDING_VALIDATION\` côté backend et Flutter

---

## Tâches techniques

### Backend
- [ ] Ajouter \`PENDING_VALIDATION\` dans \`AnnonceStatus\`
- [ ] Mettre à jour le \`CHECK constraint\` DB
- [ ] \`AnnonceService.create()\` passe en \`PENDING_VALIDATION\` au lieu de \`ACTIVE\`
- [ ] \`AnnonceSpecification\` exclut \`PENDING_VALIDATION\` des résultats publics
- [ ] Ajouter \`@ValidBoardingCoherence\` validator cross-field
- [ ] Corriger \`@DecimalMin\` sur \`weightKg\`
- [ ] Ajouter \`@Pattern\` sur \`onssaTagNumber\`

### Flutter
- [ ] Ajouter \`PENDING_VALIDATION\` dans l'enum \`AnnonceStatus\`
- [ ] Désactiver le bouton Publier si champs obligatoires manquants
- [ ] Afficher les erreurs de validation champ par champ"

echo ""
echo "Creating US-02: Consultation et Recherche d'Annonces..."
gh issue create \
  --repo "$REPO" \
  --title "feat(annonce): US-02 — Consultation et Recherche d'Annonces" \
  --label "user-story,annonce" \
  --body "## User Story
En tant qu'acheteur,
Je veux pouvoir consulter le détail d'une annonce et rechercher des annonces par critères,
Afin de trouver le bétail qui correspond à mes besoins.

---

## Critères d'Acceptation

### CA 1 — Affichage des détails d'une annonce
- [ ] La fiche affiche la photo de couverture et la galerie de médias
- [ ] La fiche affiche le badge d'âge religieux / dentition (Jadaâ, Thni, Rbaâ, Sdess, Jameâ)
- [ ] La fiche affiche le macaron d'authentification ONSSA si \`onssaTagNumber\` est présent
- [ ] Le compteur \`viewsCount\` est incrémenté de +1 à chaque consultation
- [ ] La galerie photos est consultable en plein écran avec zoom et swipe

### CA 2 — Filtrage multi-critères
- [ ] Les filtres disponibles : Race, Poids (min/max), Région/Ville, Prix (min/max), Genre, Dentition, Livraison, Pension
- [ ] Le système retourne uniquement les annonces avec \`status = ACTIVE\`
- [ ] Les annonces \`PENDING_VALIDATION\` / \`SUSPENDED\` / \`EXPIRED\` sont exclues des résultats
- [ ] Les filtres actifs sont affichés sous forme de chips dans la liste

---

## Tâches techniques

### Backend
- [ ] \`AnnonceService.findById()\` incrémente \`viewsCount\` via \`@Modifying @Query\`
- [ ] Ajouter les labels dentition : \`MILK_TEETH → Snan el-Hlib\`, \`TWO_TEETH → Thni\`, \`FOUR_TEETH → Rbaâ\`, \`SIX_TEETH → Sdess\`, \`FULL_MOUTH → Jameâ\`
- [ ] \`AnnonceSpecification\` filtre sur \`status = ACTIVE\` uniquement
- [ ] Ajouter filtre par \`dentition\` dans \`AnnonceSearchRequest\` et \`AnnonceSpecification\`

### Flutter
- [ ] \`AnnonceDetailPage\` affiche badge dentition avec label arabe/darija
- [ ] Badge ONSSA visible si \`onssaTagNumber != null\`
- [ ] Galerie plein écran avec zoom et swipe (\`photo_view\` ou \`interactive_viewer\`)
- [ ] Skeleton loader sur \`AnnonceListPage\`
- [ ] Chips filtres actifs visibles dans la liste
- [ ] Ajouter \`dentition\` dans \`AnnonceFilterSheet\` et \`AnnonceSearchRequestModel\`"

echo ""
echo "Creating US-03: Favoris et Signalement..."
gh issue create \
  --repo "$REPO" \
  --title "feat(annonce): US-03 — Favoris et Signalement (Reports)" \
  --label "user-story,annonce" \
  --body "## User Story
En tant qu'acheteur,
Je veux pouvoir ajouter des annonces à mes favoris et signaler les annonces abusives,
Afin de retrouver facilement les annonces qui m'intéressent et contribuer à la qualité de la marketplace.

---

## Critères d'Acceptation

### CA 1 — Ajout aux favoris (Unicité)
- [ ] L'icône Cœur est visible sur la fiche annonce et dans la liste
- [ ] Un clic ajoute l'annonce aux favoris de l'acheteur
- [ ] Un second clic supprime l'annonce des favoris (toggle)
- [ ] La contrainte \`uq_buyer_annonce_favorite\` empêche les doublons en base
- [ ] Une page \"Mes Favoris\" liste toutes les annonces sauvegardées
- [ ] Le compteur \`favoritesCount\` de l'annonce est mis à jour

### CA 2 — Signalement d'une annonce abusive
- [ ] Un bouton \"Signaler\" est accessible depuis la fiche annonce
- [ ] L'utilisateur sélectionne un motif parmi \`ReportReason\` : \`FRAUD_OR_SCAM\`, \`WRONG_INFORMATION\`, \`UNHEALTHY_ANIMAL\`, \`DUPLICATE\`, \`INAPPROPRIATE_MEDIA\`, \`OTHER\`
- [ ] Un commentaire optionnel peut être ajouté
- [ ] Le signalement est créé avec le statut \`PENDING\`
- [ ] Un utilisateur ne peut pas re-signaler la même annonce (\`uq_annonce_reporter\`)
- [ ] Une alerte est envoyée au tableau de bord administrateur

---

## Tâches techniques

### Backend
- [ ] Vérifier que \`POST /{id}/favorites\` retourne 409 si déjà en favori
- [ ] \`AnnonceService.addFavorite()\` incrémente \`favoritesCount\`
- [ ] \`AnnonceService.removeFavorite()\` décrémente \`favoritesCount\`
- [ ] \`POST /{id}/reports\` — endpoint de signalement (renommer depuis \`/flag\`)
- [ ] Notification admin après création d'un report (Spring Event ou Firebase)
- [ ] Retourner \`AnnonceReportResponse\` DTO au lieu de l'entité

### Flutter
- [ ] Icône Cœur toggle sur \`AnnoncePostCard\` et \`AnnonceDetailPage\`
- [ ] Page \"Mes Favoris\" avec liste paginée
- [ ] Bottom sheet de signalement avec sélection \`ReportReason\` + commentaire
- [ ] Message de confirmation après signalement
- [ ] Bloquer le bouton signaler si déjà signalé (gestion erreur 409)"

echo ""
echo "✅ Les 3 User Stories ont été créées sur $REPO"