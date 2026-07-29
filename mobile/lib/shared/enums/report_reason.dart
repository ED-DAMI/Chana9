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

  String get label {
    switch (this) {
      case ReportReason.fraudOrScam:
        return 'Arnaque / Fraude';
      case ReportReason.wrongInformation:
        return 'Informations incorrectes';
      case ReportReason.unhealthyAnimal:
        return 'Animal en mauvaise santé';
      case ReportReason.duplicate:
        return 'Annonce en double';
      case ReportReason.inappropriateMedia:
        return 'Photos inappropriées';
      case ReportReason.other:
        return 'Autre';
    }
  }
}