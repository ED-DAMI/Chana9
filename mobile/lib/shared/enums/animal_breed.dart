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

  static AnimalBreed fromJson(dynamic value) {
    return AnimalBreed.values.firstWhere(
          (e) => e.name == value.toString(),
      orElse: () => AnimalBreed.other,
    );
  }
}