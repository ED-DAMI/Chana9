import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'value')
enum AnimalBreed {
  sardi('SARDI', 'Sardi'),
  timahdite('TIMAHDITE', 'Timahdite'),
  beniGuil('BENI_GUIL', 'Béni Guil'),
  dokkali('DOKKALI', 'Dokkali'),
  rehami('REHAMI', 'Rehami'),
  boujaad('BOUJAAD', 'Boujaad'),
  oulmesZaer('OULMES_ZAER', 'Oulmes-Zaer'),
  beniAhsen('BENI_AHSEN', 'Béni Ahsen'),
  daMan('D_MAN', "Da'Man"),
  draa('DRAA', 'Draa'),
  naineDeMontagne('NAINE_DE_MONTAGNE', 'Naine de montagne'),
  chevreduRiff('CHEVRE_DU_RIFF', 'Chèvre du Riff'),
  chevreDeLaayoune('CHEVRE_DE_LAAYOUNE', 'Chèvre de Laâyoune'),
  blondeDAquitaine('BLONDE_D_AQUITAINE', "Blonde d'Aquitaine"),
  frisonnePieNoire('FRISONNE_PIE_NOIRE', 'Frisonne Pie Noire'),
  montbeliarde('MONTBELIARDE', 'Montbéliarde'),
  bruneAtlas('BRUNE_ATLAS', 'Brune Atlas'),
  ougda('OUGDA', 'Ougda'),
  dromadaireSahraouii('DROMADAIRE_SAHRAOUI', 'Dromadaire Sahraoui'),
  dromadaireGuelmim('DROMADAIRE_GUELMIM', 'Dromadaire Guelmim'),
  barbe('BARBE', 'Barbe'),
  arabeBarbe('ARABE_BARBE', 'Arabe-Barbe'),
  aneBeldi('ANE_BELDI', 'Âne Beldi'),
  mulet('MULET', 'Mulet'),
  other('OTHER', 'Autre');

  const AnimalBreed(this.value, this.label);
  final String value;
  final String label;

  static AnimalBreed fromJson(dynamic json) {
    return AnimalBreed.values.firstWhere(
          (e) => e.value == json.toString(),
      orElse: () => AnimalBreed.other,
    );
  }

  String toJson() => value;
}