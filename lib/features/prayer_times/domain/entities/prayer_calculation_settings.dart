enum AsrCalculationMethod { hanafi, standard }

class PrayerCalculationSettings {
  const PrayerCalculationSettings({
    required this.fajrAngle,
    required this.ishaAngle,
    required this.asrMethod,
  });

  static const PrayerCalculationSettings ifbdProvisional =
      PrayerCalculationSettings(
        fajrAngle: 18.0,
        ishaAngle: 18.0,
        asrMethod: AsrCalculationMethod.hanafi,
      );

  final double fajrAngle;
  final double ishaAngle;
  final AsrCalculationMethod asrMethod;
}
