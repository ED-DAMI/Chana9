import 'package:flutter/material.dart';
import 'package:ma_chana9_app/l10n/app_localizations.dart';

enum ReportReason {
  fraudOrScam,
  wrongInformation,
  unhealthyAnimal,
  duplicate,
  inappropriateMedia,
  other;

  String get value {
    switch (this) {
      case ReportReason.fraudOrScam:
        return 'FRAUD_OR_SCAM';
      case ReportReason.wrongInformation:
        return 'WRONG_INFORMATION';
      case ReportReason.unhealthyAnimal:
        return 'UNHEALTHY_ANIMAL';
      case ReportReason.duplicate:
        return 'DUPLICATE';
      case ReportReason.inappropriateMedia:
        return 'INAPPROPRIATE_MEDIA';
      case ReportReason.other:
        return 'OTHER';
    }
  }

  String localizedLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (this) {
      ReportReason.fraudOrScam => l10n.fraudOrScam,
      ReportReason.wrongInformation => l10n.wrongInformation,
      ReportReason.unhealthyAnimal => l10n.unhealthyAnimal,
      ReportReason.duplicate => l10n.duplicate,
      ReportReason.inappropriateMedia => l10n.inappropriateMedia,
      ReportReason.other => l10n.other,
    };
  }
}
