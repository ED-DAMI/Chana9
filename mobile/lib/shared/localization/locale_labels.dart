import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ma_chana9_app/shared/enums/annonce_status.dart';
import 'package:ma_chana9_app/shared/enums/role.dart';

const moroccanRegions = [
  'Tanger-Tétouan-Al Hoceïma',
  'Oriental',
  'Fès-Meknès',
  'Rabat-Salé-Kénitra',
  'Béni Mellal-Khénifra',
  'Casablanca-Settat',
  'Marrakech-Safi',
  'Drâa-Tafilalet',
  'Souss-Massa',
  'Guelmim-Oued Noun',
  'Laâyoune-Sakia El Hamra',
  'Dakhla-Oued Ed-Dahab',
];

String localizedRegion(BuildContext context, String region) {
  final l10n = AppLocalizations.of(context);
  return switch (region) {
    'Tanger-Tétouan-Al Hoceïma' => l10n.regionTangerTetouanAlHoceima,
    'Oriental' => l10n.regionOriental,
    'Fès-Meknès' => l10n.regionFesMeknes,
    'Rabat-Salé-Kénitra' => l10n.regionRabatSaleKenitra,
    'Béni Mellal-Khénifra' => l10n.regionBeniMellalKhenifra,
    'Casablanca-Settat' => l10n.regionCasablancaSettat,
    'Marrakech-Safi' => l10n.regionMarrakechSafi,
    'Drâa-Tafilalet' => l10n.regionDraaTafilalet,
    'Souss-Massa' => l10n.regionSoussMassa,
    'Guelmim-Oued Noun' => l10n.regionGuelmimOuedNoun,
    'Laâyoune-Sakia El Hamra' => l10n.regionLaayouneSakiaElHamra,
    'Dakhla-Oued Ed-Dahab' => l10n.regionDakhlaOuedEdDahab,
    _ => region,
  };
}

extension RoleLocalization on Role {
  String localizedLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (this) {
      Role.seller => l10n.seller,
      Role.buyer => l10n.buyer,
      Role.admin => l10n.admin,
    };
  }
}

extension AnnonceStatusLocalization on AnnonceStatus {
  String localizedLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (this) {
      AnnonceStatus.active => l10n.success,
      AnnonceStatus.suspended => l10n.statusSuspended,
      AnnonceStatus.sold => l10n.statusSold,
      AnnonceStatus.expired => l10n.error,
      AnnonceStatus.deleted => l10n.delete,
      AnnonceStatus.draft => l10n.edit,
    };
  }
}
