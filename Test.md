# 🧪 Guide et Règles de Testing

Ce document définit la stratégie, les normes et les bonnes pratiques de tests appliquées au projet. **Chaque développeur ou agent IA contribuant au code doit suivre rigoureusement ces directives.**

---

## 📐 1. Pyramide des Tests

Les tests doivent respecter la répartition suivante :
* **Tests Unitaires (~70%)** : Rapides, isolés, testent une classe ou une fonction unique.
* **Tests d'Intégration (~20%)** : Vérifient la communication entre plusieurs composants (Base de données, API, services).
* **Tests End-to-End / Fonctionnels (~10%)** : Valident les parcours utilisateurs critiques.

---

## 🎯 2. Tests Unitaires (Unit Tests)

### Objectif
Isoler une unité de code (méthode, fonction) et vérifier son comportement sans dépendance extérieure (pas de base de données, pas d'appels réseau).

### Bonnes Pratiques
1. **Règle AAA (Arrange-Act-Assert)** :
    * **Arrange** : Préparer les données et mocker les dépendances.
    * **Act** : Exécuter la méthode à tester.
    * **Assert** : Vérifier le résultat attendu.
2. **Isolation** : Utilisez des *Mocks* / *Stubs* pour remplacer les dépendances externes.
3. **Cas de test** : Couvrez systématiquement :
    * Le cas nominal (*Happy Path*).
    * Les cas limites (*Edge Cases* : valeurs nulles, listes vides, limites numériques).
    * Les cas d'erreur / levées d'exceptions.
4. **Indépendance** : Aucun test ne doit dépendre du résultat d'un autre test.

---

## 🔗 3. Tests d'Intégration (Integration Tests)

### Objectif
Vérifier que les modules du système interagissent correctement entre eux (ex: couche Repository <-> Base de données, Controllers <-> Services).

### Bonnes Pratiques
1. Utilisez des bases de données de test en mémoire (ou des conteneurs éphémères via Testcontainers).
2. Repartez d'un état propre : nettoyez les données de la base avant ou après chaque test (`@Transactional` ou script de cleanup).
3. Ne mockez **pas** les composants internes testés ; mockez uniquement les services externes indisponibles (API tierces, services de paiement).

---

## 🏷️ 4. Convention de Nommage

Chaque test doit porter un nom descriptif indiquant ce qu'il teste et le résultat attendu.

### Modèles recommandés
* `[Méthode]_[Condition]_[RésultatAttendu]`
* ex: `calculateDiscount_whenVipUser_shouldApplyTenPercent()`
* `should_[RésultatAttendu]_when_[Condition]`
* ex: `shouldThrowException_whenUserNotFound()`

---

## 🧼 5. Principes FIRST

Tous les tests doivent respecter les principes **FIRST** :
* **F - Fast** : S'exécutent en quelques millisecondes.
* **I - Independent** : Pas de dépendances entre les tests, ordre d'exécution indifférent.
* **R - Repeatable** : Le résultat est déterministe (même résultat à chaque exécution).
* **S - Self-validating** : Pass/Fail automatique (pas de vérification manuelle ou de `console.log`).
* **T - Timely** : Écrits en même temps ou avant le code source (TDD).

---

## 🚨 6. Anti-Patterns à Éviter

❌ **Tester l'implémentation plutôt que le comportement** : Ne vérifiez pas les détails internes privés, testez l'entrée et la sortie publique.  
❌ **Assertions multiples non liées** : Un test ne doit vérifier qu'un seul concept logique.  
❌ **Dépendance au temps / environnement** : Pas de `Thread.sleep()`, de dates en dur (`LocalDate.now()`), ni de chemins de fichiers locaux (`C:/Users/...`).  
❌ **Tests bavards** : Évitez de mettre du code complexe (boucles `for`, conditions `if`) dans les tests.

---

## ⚙️ 7. Exécution et Couverture

* **Couverture minimale ciblée** : 80% sur la logique métier.
* **Commande d'exécution** :
  ```bash
  # Exécuter tous les tests
  npm test # ou ./mvnw test / pytest