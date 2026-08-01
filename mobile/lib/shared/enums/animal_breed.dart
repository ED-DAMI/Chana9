import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      case AnimalBreed.sardi:
        return 'SARDI';
      case AnimalBreed.timahdite:
        return 'TIMAHDITE';
      case AnimalBreed.beniGuil:
        return 'BENI_GUIL';
      case AnimalBreed.dokkali:
        return 'DOKKALI';
      case AnimalBreed.rehami:
        return 'REHAMI';
      case AnimalBreed.boujaad:
        return 'BOUJAAD';
      case AnimalBreed.oulmesZaer:
        return 'OULMES_ZAER';
      case AnimalBreed.beniAhsen:
        return 'BENI_AHSEN';
      case AnimalBreed.daMan:
        return 'DA_MAN';
      case AnimalBreed.draa:
        return 'DRAA';
      case AnimalBreed.naineDeMontagne:
        return 'NAINE_DE_MONTAGNE';
      case AnimalBreed.chevreduRiff:
        return 'CHEVRE_DU_RIFF';
      case AnimalBreed.chevreDeLaayoune:
        return 'CHEVRE_DE_LAAYOUNE';
      case AnimalBreed.blondeDAquitaine:
        return 'BLONDE_D_AQUITAINE';
      case AnimalBreed.frisonnePieNoire:
        return 'FRISONNE_PIE_NOIRE';
      case AnimalBreed.montbeliarde:
        return 'MONTBELIARDE';
      case AnimalBreed.bruneAtlas:
        return 'BRUNE_ATLAS';
      case AnimalBreed.ougda:
        return 'OUGDA';
      case AnimalBreed.dromadaireSahraouii:
        return 'DROMADAIRE_SAHRAOUII';
      case AnimalBreed.dromadaireGuelmim:
        return 'DROMADAIRE_GUELMIM';
      case AnimalBreed.barbe:
        return 'BARBE';
      case AnimalBreed.arabeBarbe:
        return 'ARABE_BARBE';
      case AnimalBreed.aneBeldi:
        return 'ANE_BELDI';
      case AnimalBreed.mulet:
        return 'MULET';
      case AnimalBreed.other:
        return 'OTHER';
    }
  }

  String localizedLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (this) {
      AnimalBreed.sardi => l10n.sardi,
      AnimalBreed.timahdite => l10n.timahdite,
      AnimalBreed.beniGuil => l10n.beniGuil,
      AnimalBreed.dokkali => l10n.dokkali,
      AnimalBreed.rehami => l10n.rehami,
      AnimalBreed.boujaad => l10n.boujaad,
      AnimalBreed.oulmesZaer => l10n.oulmesZaer,
      AnimalBreed.beniAhsen => l10n.beniAhsen,
      AnimalBreed.daMan => l10n.daMan,
      AnimalBreed.draa => l10n.draa,
      AnimalBreed.naineDeMontagne => l10n.naineDeMontagne,
      AnimalBreed.chevreduRiff => l10n.chevreduRiff,
      AnimalBreed.chevreDeLaayoune => l10n.chevreDeLaayoune,
      AnimalBreed.blondeDAquitaine => l10n.blondeDAquitaine,
      AnimalBreed.frisonnePieNoire => l10n.frisonnePieNoire,
      AnimalBreed.montbeliarde => l10n.montbeliarde,
      AnimalBreed.bruneAtlas => l10n.bruneAtlas,
      AnimalBreed.ougda => l10n.ougda,
      AnimalBreed.dromadaireSahraouii => l10n.dromadaireSahraouii,
      AnimalBreed.dromadaireGuelmim => l10n.dromadaireGuelmim,
      AnimalBreed.barbe => l10n.barbe,
      AnimalBreed.arabeBarbe => l10n.arabeBarbe,
      AnimalBreed.aneBeldi => l10n.aneBeldi,
      AnimalBreed.mulet => l10n.mulet,
      AnimalBreed.other => l10n.other,
    };
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
