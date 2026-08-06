#!/bin/bash

# ============================================================
#  Chana9 — Issues GitHub : Dashboard Statistiques Vendeur
#  Repo : ED-DAMI/Chana9
#  Périmètre :
#    - KPIs globaux (vues, favoris, contacts)
#    - Chiffre d'affaires (Semaine / Mois / Année)
#    - Stats par annonce
#    - Courbe temporelle des ventes
#  Prérequis : gh CLI installé + authentifié (gh auth login)
# ============================================================

REPO="ED-DAMI/Chana9"

echo "🚀 Création des issues Dashboard Statistiques Vendeur pour $REPO..."
echo ""

# ------------------------------------------------------------
# LABELS — création si inexistants
# ------------------------------------------------------------
echo "🏷️  Création des labels..."

gh label create "feature"      --color "0075ca" --description "Nouvelle fonctionnalité"            --repo $REPO 2>/dev/null || true
gh label create "dashboard"    --color "7057ff" --description "Dashboard & visualisation données"  --repo $REPO 2>/dev/null || true
gh label create "stats"        --color "0e8a16" --description "Statistiques vendeur"               --repo $REPO 2>/dev/null || true
gh label create "profile"      --color "e4e669" --description "Feature profile utilisateur"        --repo $REPO 2>/dev/null || true
gh label create "presentation" --color "c5def5" --description "Couche présentation / UI"           --repo $REPO 2>/dev/null || true
gh label create "domain"       --color "d4c5f9" --description "Couche domain / usecase"            --repo $REPO 2>/dev/null || true
gh label create "data"         --color "bfd4f2" --description "Couche data / datasource"           --repo $REPO 2>/dev/null || true
gh label create "backend"      --color "f9d0c4" --description "Nécessite un endpoint backend"      --repo $REPO 2>/dev/null || true
gh label create "chart"        --color "fbca04" --description "Graphiques / courbes"               --repo $REPO 2>/dev/null || true

echo "✅ Labels prêts"
echo ""

# ------------------------------------------------------------
# MILESTONE
# ------------------------------------------------------------
echo "📌 Création du milestone Dashboard Vendeur v1..."

gh api repos/$REPO/milestones \
  --method POST \
  -f title="Dashboard Vendeur v1" \
  -f description="Statistiques annonces + chiffre d'affaires intégré dans le profil vendeur" \
  -f state="open" 2>/dev/null || true

echo "✅ Milestone prêt"
echo ""

# ============================================================
# ISSUE 1 — Backend : Endpoints stats globaux
# ============================================================
echo "📝 Issue 1 : Backend — Endpoints statistiques vendeur..."

gh issue create \
  --repo $REPO \
  --title "[BACKEND] Créer les endpoints statistiques vendeur" \
  --label "feature,stats,dashboard,backend" \
  --milestone "Dashboard Vendeur v1" \
  --body "## 🎯 Objectif
Exposer les endpoints Spring Boot nécessaires pour alimenter le dashboard statistiques du vendeur dans l'app Chana9.

## 📋 Endpoints à créer

### 1. KPIs globaux du vendeur
\`\`\`
GET /api/v1/sellers/{id}/stats
\`\`\`
**Réponse attendue :**
\`\`\`json
{
  \"totalViews\": 1247,
  \"totalFavorites\": 45,
  \"totalContacts\": 29,
  \"contactRate\": 2.3,
  \"totalAnnonces\": 12,
  \"activeAnnonces\": 8,
  \"soldAnnonces\": 4
}
\`\`\`

### 2. Chiffre d'affaires par période
\`\`\`
GET /api/v1/sellers/{id}/revenue?period=week|month|year
\`\`\`
**Réponse attendue :**
\`\`\`json
{
  \"period\": \"month\",
  \"totalRevenue\": 12500.00,
  \"currency\": \"MAD\",
  \"soldCount\": 4,
  \"averagePrice\": 3125.00,
  \"startDate\": \"2025-07-01\",
  \"endDate\": \"2025-07-31\"
}
\`\`\`

### 3. Courbe temporelle des ventes
\`\`\`
GET /api/v1/sellers/{id}/revenue/timeline?period=week|month|year
\`\`\`
**Réponse attendue :**
\`\`\`json
{
  \"period\": \"month\",
  \"points\": [
    { \"date\": \"2025-07-01\", \"revenue\": 0, \"soldCount\": 0 },
    { \"date\": \"2025-07-05\", \"revenue\": 3500, \"soldCount\": 1 },
    { \"date\": \"2025-07-12\", \"revenue\": 4200, \"soldCount\": 1 }
  ]
}
\`\`\`

### 4. Stats par annonce individuelle
\`\`\`
GET /api/v1/annonces/seller/{id}/stats
\`\`\`
**Réponse attendue :**
\`\`\`json
[
  {
    \"annonceId\": \"uuid\",
    \"title\": \"Brebis Sardi\",
    \"status\": \"SOLD\",
    \"price\": 3500.00,
    \"views\": 347,
    \"favorites\": 12,
    \"contacts\": 8,
    \"soldAt\": \"2025-07-05T10:30:00Z\"
  }
]
\`\`\`

## ⚠️ Notes
- Le CA est calculé uniquement sur les annonces avec \`status = SOLD\`
- Le header \`X-User-Id\` doit correspondre au \`{id}\` demandé (sécurité)
- Les vues/contacts/favoris doivent être trackés en base dès maintenant si ce n'est pas déjà le cas

## 🔗 Dépendances
- Aucune dépendance Flutter — issue purement backend
- Bloque toutes les autres issues de ce milestone"

echo "✅ Issue 1 créée"
echo ""

# ============================================================
# ISSUE 2 — Domain : Entités et UseCases stats
# ============================================================
echo "📝 Issue 2 : Domain Layer — Entités et UseCases..."

gh issue create \
  --repo $REPO \
  --title "[DOMAIN] Dashboard Stats — Créer les entités et UseCases" \
  --label "feature,stats,dashboard,domain" \
  --milestone "Dashboard Vendeur v1" \
  --body "## 🎯 Objectif
Créer la couche Domain pour le dashboard statistiques vendeur, en respectant la Clean Architecture de Chana9.

## 📋 Entités à créer

### SellerStats
\`\`\`dart
// lib/features/profile/domain/entities/seller_stats.dart
class SellerStats {
  final int totalViews;
  final int totalFavorites;
  final int totalContacts;
  final double contactRate;       // (contacts / vues) × 100
  final int totalAnnonces;
  final int activeAnnonces;
  final int soldAnnonces;
}
\`\`\`

### SellerRevenue
\`\`\`dart
// lib/features/profile/domain/entities/seller_revenue.dart
enum RevenuePeriod { week, month, year }

class SellerRevenue {
  final RevenuePeriod period;
  final double totalRevenue;
  final String currency;          // 'MAD'
  final int soldCount;
  final double averagePrice;
  final DateTime startDate;
  final DateTime endDate;
}
\`\`\`

### RevenuePoint (courbe temporelle)
\`\`\`dart
// lib/features/profile/domain/entities/revenue_point.dart
class RevenuePoint {
  final DateTime date;
  final double revenue;
  final int soldCount;
}
\`\`\`

### AnnonceStats (stats par annonce)
\`\`\`dart
// lib/features/profile/domain/entities/annonce_stats.dart
class AnnonceStats {
  final String annonceId;
  final String title;
  final AnnonceStatus status;
  final double price;
  final int views;
  final int favorites;
  final int contacts;
  final DateTime? soldAt;
}
\`\`\`

## 📋 UseCases à créer

- [ ] \`GetSellerStats\` → \`Either<Failure, SellerStats>\`
- [ ] \`GetSellerRevenue\` → \`Either<Failure, SellerRevenue>\` (params: sellerId + period)
- [ ] \`GetRevenueTimeline\` → \`Either<Failure, List<RevenuePoint>>\` (params: sellerId + period)
- [ ] \`GetAnnonceStatsBySeller\` → \`Either<Failure, List<AnnonceStats>>\`

## 📋 Repository interface
- [ ] Créer \`StatsRepository\` avec les 4 méthodes correspondantes

## 📁 Fichiers à créer
\`\`\`
lib/features/profile/domain/
  ├── entities/
  │   ├── seller_stats.dart
  │   ├── seller_revenue.dart
  │   ├── revenue_point.dart
  │   └── annonce_stats.dart
  ├── repositories/
  │   └── stats_repository.dart
  └── usecases/
      ├── get_seller_stats.dart
      ├── get_seller_revenue.dart
      ├── get_revenue_timeline.dart
      └── get_annonce_stats_by_seller.dart
\`\`\`

## 🔗 Dépendances
- Bloquée par : Issue #1 (Backend endpoints)
- Bloque : Issue #3 (Data layer) et Issue #4 (BLoC)"

echo "✅ Issue 2 créée"
echo ""

# ============================================================
# ISSUE 3 — Data : Models + RemoteDataSource + RepositoryImpl
# ============================================================
echo "📝 Issue 3 : Data Layer — Models, DataSource, Repository..."

gh issue create \
  --repo $REPO \
  --title "[DATA] Dashboard Stats — Models JSON, RemoteDataSource et RepositoryImpl" \
  --label "feature,stats,dashboard,data" \
  --milestone "Dashboard Vendeur v1" \
  --body "## 🎯 Objectif
Implémenter la couche Data pour les statistiques vendeur : sérialisation JSON, appels API via DioClient, et implémentation du StatsRepository.

## 📋 Models à créer (avec freezed + json_serializable)

- [ ] \`SellerStatsModel\` → fromJson + toEntity()
- [ ] \`SellerRevenueModel\` → fromJson + toEntity()
- [ ] \`RevenuePointModel\` → fromJson + toEntity()
- [ ] \`AnnonceStatsModel\` → fromJson + toEntity()

## 📋 RemoteDataSource

Créer \`StatsRemoteDataSource\` avec les méthodes :

\`\`\`dart
Future<SellerStatsModel> getSellerStats(String sellerId);

Future<SellerRevenueModel> getSellerRevenue(
  String sellerId,
  RevenuePeriod period,
);

Future<List<RevenuePointModel>> getRevenueTimeline(
  String sellerId,
  RevenuePeriod period,
);

Future<List<AnnonceStatsModel>> getAnnonceStatsBySeller(String sellerId);
\`\`\`

## 📋 RepositoryImpl

- [ ] Créer \`StatsRepositoryImpl\` implémentant \`StatsRepository\`
- [ ] Wrapper chaque appel dans \`try/catch\` → mapper vers \`Either<Failure, T>\`
- [ ] Utiliser le \`DioClient\` existant (get/post/put)

## 📋 Injection GetIt

- [ ] Enregistrer dans \`profile_injection.dart\` (ou créer \`stats_injection.dart\`) :
  - \`StatsRemoteDataSource\`
  - \`StatsRepositoryImpl\`
  - Les 4 UseCases
  - \`StatsDashboardBloc\`

## 📁 Fichiers à créer
\`\`\`
lib/features/profile/data/
  ├── models/
  │   ├── seller_stats_model.dart
  │   ├── seller_revenue_model.dart
  │   ├── revenue_point_model.dart
  │   └── annonce_stats_model.dart
  ├── datasources/
  │   └── stats_remote_datasource.dart
  └── repositories/
      └── stats_repository_impl.dart
lib/features/profile/stats_injection.dart
\`\`\`

## 🔗 Dépendances
- Bloquée par : Issue #2 (Domain layer)
- Bloque : Issue #4 (BLoC)"

echo "✅ Issue 3 créée"
echo ""

# ============================================================
# ISSUE 4 — BLoC : StatsDashboardBloc
# ============================================================
echo "📝 Issue 4 : BLoC — StatsDashboardBloc..."

gh issue create \
  --repo $REPO \
  --title "[PRESENTATION] Dashboard Stats — Créer le StatsDashboardBloc" \
  --label "feature,stats,dashboard,presentation" \
  --milestone "Dashboard Vendeur v1" \
  --body "## 🎯 Objectif
Créer le BLoC gérant tous les états du dashboard statistiques vendeur, en suivant le pattern BLoC existant dans Chana9.

## 📋 Events

\`\`\`dart
// lib/features/profile/presentation/bloc/stats_dashboard_event.dart

abstract class StatsDashboardEvent {}

// Chargement initial : KPIs + CA mois par défaut + stats annonces
class LoadDashboard extends StatsDashboardEvent {
  final String sellerId;
}

// Changement de période CA : week | month | year
class ChangePeriod extends StatsDashboardEvent {
  final RevenuePeriod period;
}

// Rafraîchissement manuel (pull-to-refresh)
class RefreshDashboard extends StatsDashboardEvent {
  final String sellerId;
}
\`\`\`

## 📋 States

\`\`\`dart
// lib/features/profile/presentation/bloc/stats_dashboard_state.dart

abstract class StatsDashboardState {}

class StatsDashboardInitial extends StatsDashboardState {}

class StatsDashboardLoading extends StatsDashboardState {}

class StatsDashboardLoaded extends StatsDashboardState {
  final SellerStats globalStats;
  final SellerRevenue revenue;
  final List<RevenuePoint> timeline;
  final List<AnnonceStats> annonceStats;
  final RevenuePeriod selectedPeriod;
}

// Erreur globale (pas de données du tout)
class StatsDashboardError extends StatsDashboardState {
  final Failure failure;
}

// Erreur partielle (KPIs OK mais CA échoue)
class StatsDashboardPartialError extends StatsDashboardLoaded {
  final Failure revenueFailure;
}
\`\`\`

## 📋 Logique BLoC

- [ ] \`LoadDashboard\` → appels parallèles via \`Future.wait([...4 usecases...])\` pour minimiser le temps de chargement
- [ ] \`ChangePeriod\` → appels \`GetSellerRevenue\` + \`GetRevenueTimeline\` uniquement (ne recharge pas les KPIs)
- [ ] \`RefreshDashboard\` → même logique que \`LoadDashboard\` avec état \`isRefreshing\`
- [ ] Gérer les erreurs partielles : si KPIs OK mais CA échoue → \`StatsDashboardPartialError\`

## 📁 Fichiers à créer
\`\`\`
lib/features/profile/presentation/bloc/
  ├── stats_dashboard_bloc.dart
  ├── stats_dashboard_event.dart
  └── stats_dashboard_state.dart
\`\`\`

## 🔗 Dépendances
- Bloquée par : Issue #3 (Data layer)
- Bloque : Issue #5, #6, #7 (UI)"

echo "✅ Issue 4 créée"
echo ""

# ============================================================
# ISSUE 5 — UI : KPIs globauxWidget
# ============================================================
echo "📝 Issue 5 : UI — Widget KPIs globaux..."

gh issue create \
  --repo $REPO \
  --title "[PRESENTATION] Dashboard Stats — Widget KPIs globaux (vues, favoris, contacts)" \
  --label "feature,stats,dashboard,presentation,profile" \
  --milestone "Dashboard Vendeur v1" \
  --body "## 🎯 Objectif
Créer le widget affichant les KPIs globaux du vendeur en haut de son profil : total vues, favoris, contacts et taux de contact.

## 📋 Tâches

- [ ] Créer \`features/profile/presentation/widgets/seller_kpi_card.dart\`
- [ ] Afficher 4 métriques en grille 2×2 :
  - 👁️ Total vues
  - ❤️ Total favoris
  - 💬 Total contacts
  - 📊 Taux de contact (%)
- [ ] Ajouter un skeleton loader pendant le chargement (même hauteur que le widget final)
- [ ] Animer les chiffres au chargement (compteur qui monte de 0 → valeur finale)
- [ ] Afficher un état vide si le vendeur n'a aucune annonce

## 🎨 UI attendue
\`\`\`
┌──────────────────────────────────────┐
│  📊 Mes statistiques                 │
│  ┌─────────────┐  ┌─────────────┐  │
│  │  👁️ Vues    │  │ ❤️ Favoris  │  │
│  │   1 247     │  │     45      │  │
│  └─────────────┘  └─────────────┘  │
│  ┌─────────────┐  ┌─────────────┐  │
│  │ 💬 Contacts │  │ 📊 Taux     │  │
│  │     29      │  │   2.3%      │  │
│  └─────────────┘  └─────────────┘  │
└──────────────────────────────────────┘
\`\`\`

## 📁 Fichiers à créer / modifier
\`\`\`
lib/features/profile/presentation/widgets/seller_kpi_card.dart   ← nouveau
lib/features/profile/presentation/pages/profile_page.dart        ← intégration
\`\`\`

## 🔗 Dépendances
- Bloquée par : Issue #4 (BLoC)
- Parallélisable avec : Issue #6 et #7"

echo "✅ Issue 5 créée"
echo ""

# ============================================================
# ISSUE 6 — UI : Chiffre d'affaires + Switch période
# ============================================================
echo "📝 Issue 6 : UI — Section Chiffre d'affaires avec switch période..."

gh issue create \
  --repo $REPO \
  --title "[PRESENTATION] Dashboard Stats — Section CA avec switch Semaine/Mois/Année" \
  --label "feature,stats,dashboard,presentation,profile,chart" \
  --milestone "Dashboard Vendeur v1" \
  --body "## 🎯 Objectif
Créer la section chiffre d'affaires du dashboard avec un switch de période (Semaine / Mois / Année) permettant à l'éleveur de voir ses revenus sur la période choisie.

## 📋 Tâches

### Switch de période
- [ ] Créer un \`SegmentedButton\` avec 3 options : **Semaine | Mois | Année**
- [ ] Au tap → dispatche \`ChangePeriod\` dans le BLoC
- [ ] Afficher un mini loader uniquement sur la section CA (pas toute la page) pendant le rechargement

### Cartes CA
- [ ] Afficher 2 cartes côte à côte :
  - 💰 Chiffre d'affaires (en MAD)
  - 🐑 Nombre d'animaux vendus
- [ ] Afficher les dates de la période (ex: « 1 juil. → 31 juil. »)
- [ ] Formater les montants : \`3 500 MAD\` (espace comme séparateur de milliers)

### État vide
- [ ] Si \`soldCount == 0\` sur la période → afficher « Aucune vente sur cette période » avec une illustration

## 🎨 UI attendue
\`\`\`
  ┌────────────────────────────────────┐
  │  [ Semaine ]  [● Mois ]  [ Année ]│
  │                                    │
  │  ┌───────────────┐ ┌────────────┐ │
  │  │ 💰 CA         │ │ 🐑 Vendus  │ │
  │  │  12 500 MAD   │ │     4      │ │
  │  └───────────────┘ └────────────┘ │
  │  1 juil. 2025 → 31 juil. 2025    │
  └────────────────────────────────────┘
\`\`\`

## 📁 Fichiers à créer / modifier
\`\`\`
lib/features/profile/presentation/widgets/revenue_summary_card.dart  ← nouveau
lib/features/profile/presentation/widgets/period_selector.dart       ← nouveau
lib/features/profile/presentation/pages/profile_page.dart            ← intégration
\`\`\`

## 🔗 Dépendances
- Bloquée par : Issue #4 (BLoC)
- Parallélisable avec : Issue #5 et #7"

echo "✅ Issue 6 créée"
echo ""

# ============================================================
# ISSUE 7 — UI : Courbe temporelle (Chart)
# ============================================================
echo "📝 Issue 7 : UI — Courbe temporelle des ventes..."

gh issue create \
  --repo $REPO \
  --title "[PRESENTATION] Dashboard Stats — Courbe temporelle des ventes (fl_chart)" \
  --label "feature,stats,dashboard,presentation,profile,chart" \
  --milestone "Dashboard Vendeur v1" \
  --body "## 🎯 Objectif
Afficher une courbe des ventes/revenus sur la période sélectionnée, permettant à l'éleveur de visualiser l'évolution de son activité.

## 📋 Dépendance à ajouter
\`\`\`yaml
# pubspec.yaml
dependencies:
  fl_chart: ^0.68.0   # bibliothèque de charts Flutter la plus utilisée
\`\`\`

## 📋 Tâches

### Widget courbe
- [ ] Créer \`features/profile/presentation/widgets/revenue_chart.dart\`
- [ ] Utiliser \`LineChart\` de \`fl_chart\`
- [ ] Axe X : dates (format adapté à la période : jj/MM pour semaine/mois, MMM pour année)
- [ ] Axe Y : montant en MAD
- [ ] Tooltip au tap sur un point : afficher date + montant + nb animaux vendus
- [ ] Animation d'apparition de la courbe (built-in fl_chart)
- [ ] Couleur de la courbe : couleur primaire du thème \`app_theme.dart\`

### Comportement selon la période
| Période | Points affichés | Format axe X |
|---|---|---|
| Semaine | 7 points (1/jour) | Lun, Mar, Mer... |
| Mois | 30 points (1/jour) | 01, 05, 10, 15... |
| Année | 12 points (1/mois) | Jan, Fév, Mar... |

### État vide
- [ ] Si tous les points sont à 0 → afficher « Pas encore de ventes » (pas de courbe plate à 0)

## 🎨 UI attendue
\`\`\`
  CA (MAD)
  ▲
  │              ●
  │         ●──╯
  │    ●───╯
  │●──╯
  └──────────────────── ▶
  01   07   14   21   31

  ╭──────────────────╮
  │ 📅 05 juil.      │  ← tooltip
  │ 💰 3 500 MAD     │
  │ 🐑 1 animal      │
  ╰──────────────────╯
\`\`\`

## 📁 Fichiers à créer / modifier
\`\`\`
pubspec.yaml
lib/features/profile/presentation/widgets/revenue_chart.dart  ← nouveau
lib/features/profile/presentation/pages/profile_page.dart     ← intégration
\`\`\`

## 🔗 Dépendances
- Bloquée par : Issue #4 (BLoC)
- Parallélisable avec : Issue #5 et #6"

echo "✅ Issue 7 créée"
echo ""

# ============================================================
# ISSUE 8 — UI : Liste stats par annonce
# ============================================================
echo "📝 Issue 8 : UI — Liste des stats par annonce..."

gh issue create \
  --repo $REPO \
  --title "[PRESENTATION] Dashboard Stats — Liste des performances par annonce" \
  --label "feature,stats,dashboard,presentation,profile" \
  --milestone "Dashboard Vendeur v1" \
  --body "## 🎯 Objectif
Afficher la liste de toutes les annonces du vendeur avec leurs performances individuelles (vues, favoris, contacts) et le prix de vente pour les annonces SOLD.

## 📋 Tâches

### Widget AnnonceStatsCard
- [ ] Créer \`features/profile/presentation/widgets/annonce_stats_card.dart\`
- [ ] Afficher par annonce :
  - Titre + photo miniature
  - Badge statut coloré (ACTIVE 🟢 / SOLD 🔵 / SUSPENDED 🔴 / EXPIRED ⚫)
  - 👁️ vues · ❤️ favoris · 💬 contacts sur la même ligne
  - 💰 Prix de vente (uniquement si SOLD)
  - 📅 Date de vente (uniquement si SOLD)

### Tri et filtres
- [ ] Bouton de tri : **Plus vues | Plus récentes | Vendues en premier**
- [ ] Filtre par statut : All | Active | Sold (chips horizontaux scrollables)

### Intégration dans le profil
- [ ] Ajouter après la section CA dans \`profile_page.dart\`
- [ ] Titre de section : « Performance de mes annonces »
- [ ] Limiter à 5 annonces avec bouton « Voir toutes » → page dédiée

## 🎨 UI attendue
\`\`\`
  Performance de mes annonces
  [ Toutes ] [ Actives ] [ Vendues ]        [Trier ▼]

  ┌──────────────────────────────────────┐
  │ [🖼️]  Brebis Sardi — Meknès  🔵SOLD │
  │       👁️ 347  ❤️ 12  💬 8           │
  │       💰 3 500 MAD · 05 juil. 2025  │
  └──────────────────────────────────────┘
  ┌──────────────────────────────────────┐
  │ [🖼️]  Bovin Holstein         🟢ACTIF│
  │       👁️ 124  ❤️ 6   💬 3           │
  └──────────────────────────────────────┘

               [ Voir toutes ]
\`\`\`

## 📁 Fichiers à créer / modifier
\`\`\`
lib/features/profile/presentation/widgets/annonce_stats_card.dart     ← nouveau
lib/features/profile/presentation/widgets/annonce_stats_filter.dart   ← nouveau
lib/features/profile/presentation/pages/profile_page.dart             ← intégration
lib/features/profile/presentation/pages/all_annonce_stats_page.dart   ← nouveau (page complète)
\`\`\`

## 🔗 Dépendances
- Bloquée par : Issue #4 (BLoC)
- Parallélisable avec : Issue #5, #6 et #7"

echo "✅ Issue 8 créée"
echo ""

# ============================================================
# ISSUE 9 — Intégration profil + ProfilePage
# ============================================================
echo "📝 Issue 9 : Intégration complète dans ProfilePage..."

gh issue create \
  --repo $REPO \
  --title "[PRESENTATION] Dashboard Stats — Intégration complète dans ProfilePage" \
  --label "feature,stats,dashboard,presentation,profile" \
  --milestone "Dashboard Vendeur v1" \
  --body "## 🎯 Objectif
Assembler tous les widgets du dashboard dans la \`ProfilePage\` et gérer les états globaux (chargement, erreur, pull-to-refresh).

## 📋 Tâches

### Structure de la ProfilePage
- [ ] Implémenter \`ProfilePage\` (actuellement placeholder) avec \`BlocProvider<StatsDashboardBloc>\`
- [ ] Dispatcher \`LoadDashboard\` au \`initState\` avec le \`sellerId\` du \`TokenStorage\`
- [ ] Construire le layout en \`CustomScrollView\` + \`Slivers\` :

\`\`\`
ProfilePage
  ├── SliverAppBar          avatar · nom · région · bouton Modifier profil
  ├── SliverToBoxAdapter
  │     └── SellerKpiCard         ← Issue #5
  ├── SliverToBoxAdapter
  │     ├── PeriodSelector        ← Issue #6
  │     └── RevenueSummaryCard    ← Issue #6
  ├── SliverToBoxAdapter
  │     └── RevenueChart          ← Issue #7
  └── SliverList
        └── AnnonceStatsCard ×N   ← Issue #8
\`\`\`

### Gestion des états BLoC
- [ ] \`StatsDashboardLoading\` → Skeleton de toute la page
- [ ] \`StatsDashboardLoaded\` → Afficher tous les widgets
- [ ] \`StatsDashboardError\` → Widget erreur centré avec bouton « Réessayer »
- [ ] \`StatsDashboardPartialError\` → Afficher KPIs + message d'erreur sur la section CA

### Pull-to-refresh
- [ ] Envelopper dans \`RefreshIndicator\`
- [ ] Au refresh → dispatche \`RefreshDashboard\`

### Visibilité conditionnelle
- [ ] Le dashboard stats n'est visible que si \`currentUser.role == SELLER\`
- [ ] Si l'utilisateur est \`BUYER\` → afficher profil simplifié (favoris uniquement)

## 📁 Fichiers à créer / modifier
\`\`\`
lib/features/profile/presentation/pages/profile_page.dart  ← implémenter
lib/features/profile/profile_injection.dart                ← câbler le BLoC
lib/injection_container.dart                               ← appeler profile_injection
\`\`\`

## 🔗 Dépendances
- Bloquée par : Issues #5, #6, #7, #8
- Issue de clôture du milestone"

echo "✅ Issue 9 créée"
echo ""

# ============================================================
# RÉSUMÉ
# ============================================================
echo ""
echo "═══════════════════════════════════════════════════════"
echo "✅  TOUTES LES ISSUES ONT ÉTÉ CRÉÉES !"
echo "═══════════════════════════════════════════════════════"
echo ""
echo "📋 Récapitulatif :"
echo "  #1  [BACKEND]      Endpoints statistiques vendeur"
echo "  #2  [DOMAIN]       Entités et UseCases"
echo "  #3  [DATA]         Models, DataSource, RepositoryImpl"
echo "  #4  [PRESENTATION] StatsDashboardBloc"
echo "  #5  [PRESENTATION] Widget KPIs globaux"
echo "  #6  [PRESENTATION] Section CA + switch période"
echo "  #7  [PRESENTATION] Courbe temporelle (fl_chart)"
echo "  #8  [PRESENTATION] Liste stats par annonce"
echo "  #9  [PRESENTATION] Intégration complète ProfilePage"
echo ""
echo "🔢 Ordre d'implémentation strict :"
echo "   Issue 1 (Backend)"
echo "     └─▶ Issue 2 (Domain)"
echo "           └─▶ Issue 3 (Data)"
echo "                 └─▶ Issue 4 (BLoC)"
echo "                       ├─▶ Issue 5 (KPIs)"
echo "                       ├─▶ Issue 6 (CA + Switch)"
echo "                       ├─▶ Issue 7 (Courbe)"
echo "                       └─▶ Issue 8 (Liste annonces)"
echo "                             └─▶ Issue 9 (Intégration)"
echo ""
echo "🔗 Voir les issues : https://github.com/$REPO/issues"
echo ""