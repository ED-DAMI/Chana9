enum AnimalBreed {
  sardi,
  timahdite,
  beniGuil,
  dokkali,
  rehami,
  boujaad,
  oulmesZaer,
  beniAhsen,
  daMan,
  draa,
  naineDeMontagne,
  chevreduRiff,
  chevreDeLaayoune,
  blondeDAquitaine,
  frisonnePieNoire,
  montbeliarde,
  bruneAtlas,
  ougda,
  dromadaireSahraouii,
  dromadaireGuelmim,
  barbe,
  arabeBarbe,
  aneBeldi,
  mulet,
  other;

  String get backendValue {
    switch (this) {
      case AnimalBreed.sardi:               return 'SARDI';
      case AnimalBreed.timahdite:           return 'TIMAHDITE';
      case AnimalBreed.beniGuil:            return 'BENI_GUIL';
      case AnimalBreed.dokkali:             return 'DOKKALI';
      case AnimalBreed.rehami:              return 'REHAMI';
      case AnimalBreed.boujaad:             return 'BOUJAAD';
      case AnimalBreed.oulmesZaer:          return 'OULMES_ZAER';
      case AnimalBreed.beniAhsen:           return 'BENI_AHSEN';
      case AnimalBreed.daMan:               return 'DA_MAN';
      case AnimalBreed.draa:                return 'DRAA';
      case AnimalBreed.naineDeMontagne:     return 'NAINE_DE_MONTAGNE';
      case AnimalBreed.chevreduRiff:        return 'CHEVRE_DU_RIFF';
      case AnimalBreed.chevreDeLaayoune:    return 'CHEVRE_DE_LAAYOUNE';
      case AnimalBreed.blondeDAquitaine:    return 'BLONDE_D_AQUITAINE';
      case AnimalBreed.frisonnePieNoire:    return 'FRISONNE_PIE_NOIRE';
      case AnimalBreed.montbeliarde:        return 'MONTBELIARDE';
      case AnimalBreed.bruneAtlas:          return 'BRUNE_ATLAS';
      case AnimalBreed.ougda:               return 'OUGDA';
      case AnimalBreed.dromadaireSahraouii: return 'DROMADAIRE_SAHRAOUII';
      case AnimalBreed.dromadaireGuelmim:   return 'DROMADAIRE_GUELMIM';
      case AnimalBreed.barbe:               return 'BARBE';
      case AnimalBreed.arabeBarbe:          return 'ARABE_BARBE';
      case AnimalBreed.aneBeldi:            return 'ANE_BELDI';
      case AnimalBreed.mulet:               return 'MULET';
      case AnimalBreed.other:               return 'OTHER';
    }
  }

  String get label {
    switch (this) {
      case AnimalBreed.sardi:               return 'Sardi';
      case AnimalBreed.timahdite:           return 'Timahdite';
      case AnimalBreed.beniGuil:            return 'Béni Guil';
      case AnimalBreed.dokkali:             return 'Dokkali';
      case AnimalBreed.rehami:              return 'Rehami';
      case AnimalBreed.boujaad:             return 'Boujaad';
      case AnimalBreed.oulmesZaer:          return 'Oulmes-Zaer';
      case AnimalBreed.beniAhsen:           return 'Béni Ahsen';
      case AnimalBreed.daMan:               return 'Da\'Man';
      case AnimalBreed.draa:                return 'Draa';
      case AnimalBreed.naineDeMontagne:     return 'Naine de montagne';
      case AnimalBreed.chevreduRiff:        return 'Chèvre du Riff';
      case AnimalBreed.chevreDeLaayoune:    return 'Chèvre de Laâyoune';
      case AnimalBreed.blondeDAquitaine:    return 'Blonde d\'Aquitaine';
      case AnimalBreed.frisonnePieNoire:    return 'Frisonne Pie Noire';
      case AnimalBreed.montbeliarde:        return 'Montbéliarde';
      case AnimalBreed.bruneAtlas:          return 'Brune Atlas';
      case AnimalBreed.ougda:               return 'Ougda';
      case AnimalBreed.dromadaireSahraouii: return 'Dromadaire Sahraoui';
      case AnimalBreed.dromadaireGuelmim:   return 'Dromadaire Guelmim';
      case AnimalBreed.barbe:               return 'Barbe';
      case AnimalBreed.arabeBarbe:          return 'Arabe-Barbe';
      case AnimalBreed.aneBeldi:            return 'Âne Beldi';
      case AnimalBreed.mulet:               return 'Mulet';
      case AnimalBreed.other:               return 'Autre';
    }
  }

  static AnimalBreed fromJson(String value) => fromBackendValue(value);

  String toJson() => backendValue;

  static AnimalBreed fromBackendValue(String value) {
    return AnimalBreed.values.firstWhere(
          (e) => e.backendValue == value,
      orElse: () => AnimalBreed.other,
    );
  }
}