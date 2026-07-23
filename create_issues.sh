gh issue create \
  --repo "ED-DAMI/Chana9" \
  --title "feat(form): liste déroulante des régions et villes marocaines pour le champ localisation" \
  --body "## Problème
Le champ région est un champ texte libre, ce qui entraîne des valeurs incohérentes en base de données.

## Solution
Remplacer par deux DropdownButton cascadés :
1. Sélection de la région → filtre les villes disponibles
2. Sélection de la ville dans la région choisie

## Régions et villes officielles du Maroc

### 1. Tanger-Tétouan-Al Hoceïma
Tanger, Tétouan, Al Hoceïma, Larache, Chefchaouen, Ouezzane, Mdiq, Fnideq

### 2. Oriental
Oujda, Nador, Berkane, Taourirt, Jerada, Guercif, Driouch, Figuig

### 3. Fès-Meknès
Fès, Meknès, Taza, Ifrane, Khénifra, Sefrou, Moulay Yacoub, El Hajeb, Boulemane

### 4. Rabat-Salé-Kénitra
Rabat, Salé, Kénitra, Témara, Skhirate, Khémisset, Sidi Kacem, Sidi Slimane

### 5. Béni Mellal-Khénifra
Béni Mellal, Khénifra, Khouribga, Fquih Ben Salah, Azilal

### 6. Casablanca-Settat
Casablanca, Settat, Mohammedia, El Jadida, Berrechid, Benslimane, Médiouna, Nouaceur

### 7. Marrakech-Safi
Marrakech, Safi, Essaouira, El Kelaa des Sraghna, Chichaoua, Al Haouz, Youssoufia, Rehamna

### 8. Drâa-Tafilalet
Errachidia, Ouarzazate, Zagora, Tinghir, Midelt

### 9. Souss-Massa
Agadir, Taroudannt, Tiznit, Chtouka Aït Baha, Inezgane-Aït Melloul, Tata

### 10. Guelmim-Oued Noun
Guelmim, Sidi Ifni, Assa-Zag, Tan-Tan

### 11. Laâyoune-Sakia El Hamra
Laâyoune, Boujdour, Tarfaya, Es-Semara

### 12. Dakhla-Oued Ed-Dahab
Dakhla, Aousserd

## Implémentation Flutter

\`\`\`dart
const Map<String, List<String>> kMoroccoRegionsAndCities = {
  'Tanger-Tétouan-Al Hoceïma': [
    'Tanger', 'Tétouan', 'Al Hoceïma', 'Larache',
    'Chefchaouen', 'Ouezzane', 'Mdiq', 'Fnideq',
  ],
  'Oriental': [
    'Oujda', 'Nador', 'Berkane', 'Taourirt',
    'Jerada', 'Guercif', 'Driouch', 'Figuig',
  ],
  'Fès-Meknès': [
    'Fès', 'Meknès', 'Taza', 'Ifrane',
    'Khénifra', 'Sefrou', 'Moulay Yacoub', 'El Hajeb', 'Boulemane',
  ],
  'Rabat-Salé-Kénitra': [
    'Rabat', 'Salé', 'Kénitra', 'Témara',
    'Skhirate', 'Khémisset', 'Sidi Kacem', 'Sidi Slimane',
  ],
  'Béni Mellal-Khénifra': [
    'Béni Mellal', 'Khénifra', 'Khouribga',
    'Fquih Ben Salah', 'Azilal',
  ],
  'Casablanca-Settat': [
    'Casablanca', 'Settat', 'Mohammedia', 'El Jadida',
    'Berrechid', 'Benslimane', 'Médiouna', 'Nouaceur',
  ],
  'Marrakech-Safi': [
    'Marrakech', 'Safi', 'Essaouira', 'El Kelaa des Sraghna',
    'Chichaoua', 'Al Haouz', 'Youssoufia', 'Rehamna',
  ],
  'Drâa-Tafilalet': [
    'Errachidia', 'Ouarzazate', 'Zagora', 'Tinghir', 'Midelt',
  ],
  'Souss-Massa': [
    'Agadir', 'Taroudannt', 'Tiznit',
    'Chtouka Aït Baha', 'Inezgane-Aït Melloul', 'Tata',
  ],
  'Guelmim-Oued Noun': [
    'Guelmim', 'Sidi Ifni', 'Assa-Zag', 'Tan-Tan',
  ],
  'Laâyoune-Sakia El Hamra': [
    'Laâyoune', 'Boujdour', 'Tarfaya', 'Es-Semara',
  ],
  'Dakhla-Oued Ed-Dahab': [
    'Dakhla', 'Aousserd',
  ],
};
\`\`\`

\`\`\`dart
// Widget cascadé région → ville
String? _selectedRegion;
String? _selectedCity;

// Dropdown Région
DropdownButtonFormField<String>(
  value: _selectedRegion,
  decoration: InputDecoration(
    labelText: 'Région *',
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  ),
  items: kMoroccoRegionsAndCities.keys.map((region) =>
    DropdownMenuItem(value: region, child: Text(region)),
  ).toList(),
  onChanged: (value) => setState(() {
    _selectedRegion = value;
    _selectedCity = null; // reset ville
  }),
  validator: (v) => v == null ? 'Région requise' : null,
),

const SizedBox(height: 12),

// Dropdown Ville (filtré par région)
DropdownButtonFormField<String>(
  value: _selectedCity,
  decoration: InputDecoration(
    labelText: 'Ville',
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  ),
  items: (_selectedRegion != null
    ? kMoroccoRegionsAndCities[_selectedRegion]!
    : <String>[])
    .map((city) => DropdownMenuItem(value: city, child: Text(city)))
    .toList(),
  onChanged: _selectedRegion == null
    ? null
    : (value) => setState(() => _selectedCity = value),
),
\`\`\`

## Impact
- Cohérence totale des données région/ville en base
- Filtres de recherche par région et ville fiables
- UX améliorée avec sélection cascadée
- Le champ ville est désactivé tant que la région n'est pas choisie" \
  --label "enhancement,mobile"