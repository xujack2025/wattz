enum ChargerStatus { available, charging, offline, maintenance }
enum ConnectorType { type2, ccs2, chademo }

abstract class Charger {
  final String id;
  final ChargerStatus status;

  const Charger({
    required this.id,
    required this.status,
  });

  double calculateFee(double kwh);

  bool get isAvailable => status == ChargerStatus.available;
}

class ACCharger extends Charger {
  final double powerOutput;
  final ConnectorType connectorType;
  final double ratePerKwh;

  const ACCharger({
    required super.id,
    required super.status,
    required this.powerOutput,
    required this.connectorType,
    this.ratePerKwh = 0.8,
  });

  @override
  double calculateFee(double kwh) {
    if (kwh <= 0) throw ArgumentError('kwh must be > 0');
    return kwh * ratePerKwh;
  }
}

class DCCharger extends Charger {
  final double powerOutput;
  final ConnectorType connectorType;
  final double ratePerKwh;
  final double sessionFee;

  const DCCharger({
    required super.id,
    required super.status,
    required this.powerOutput,
    required this.connectorType,
    this.ratePerKwh = 1.5,
    this.sessionFee = 5.0,
  });

  @override
  double calculateFee(double kwh) {
    if (kwh <= 0) throw ArgumentError('kwh must be > 0');
    return (kwh * ratePerKwh) + sessionFee;
  }
}