enum ChargerStatus { available, charging, offline, maintenance }

enum ConnectorType { type2, ccs2, chademo }

abstract class Charger {
  final String id;
  final ChargerStatus status;
  final double powerOutput;
  final double sessionFee;
  final double ratePerKwh;

  const Charger({
    required this.id,
    required this.status,
    required this.powerOutput,
    required this.sessionFee,
    required this.ratePerKwh,
  });

  double calculateFee(double kwh) {
    if (kwh <= 0) throw ArgumentError('kwh must be > 0');
    return (kwh * ratePerKwh) + sessionFee;
  }

  bool get isAvailable => status == ChargerStatus.available;
}

class ACCharger extends Charger {
  final ConnectorType connectorType;

  ACCharger({
    required this.connectorType,
    required super.id,
    required super.status,
    required super.powerOutput,
    required super.sessionFee,
    required super.ratePerKwh,
  });
}

class DCCharger extends Charger {
  final ConnectorType connectorType;

  DCCharger({
    required this.connectorType,
    required super.id,
    required super.status,
    required super.powerOutput,
    required super.sessionFee,
    required super.ratePerKwh,
  });
}
