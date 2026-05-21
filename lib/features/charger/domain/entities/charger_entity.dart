enum ChargerStatus { available, charging, offline, maintenance }

enum ConnectorType { type2, ccs2, chademo }

class ChargerEntity {
  final String id;
  final ChargerStatus status;
  final double powerOutput;
  final double sessionFee;
  final double ratePerKwh;
  final ConnectorType connectorType;

  const ChargerEntity({
    required this.id,
    required this.status,
    required this.powerOutput,
    required this.sessionFee,
    required this.ratePerKwh,
    required this.connectorType,
  });

  double calculateFee(double kwh) {
    if (kwh <= 0) throw ArgumentError('kwh must be > 0');
    return (kwh * ratePerKwh) + sessionFee;
  }

  bool get isAvailable => status == ChargerStatus.available;

  bool get isAC => connectorType == ConnectorType.type2;
}
