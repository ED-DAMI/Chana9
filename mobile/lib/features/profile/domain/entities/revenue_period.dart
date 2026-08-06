enum RevenuePeriod {
  week,
  month,
  year;

  String get value => name;

  String get displayName => switch (this) {
    RevenuePeriod.week => 'Semaine',
    RevenuePeriod.month => 'Mois',
    RevenuePeriod.year => 'Année',
  };
}