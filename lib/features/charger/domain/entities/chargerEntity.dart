enum ChargerStatus { available, charging, offline, maintenance }

enum ConnectorType { type2, ccs2, chademo }

abstract class ChargerEntity {
  final String id;
  final ChargerStatus status;
  final double powerOutput;
  final double sessionFee;
  final double ratePerKwh;

  const ChargerEntity({
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

class ACChargerEntity extends ChargerEntity {
  final ConnectorType connectorType;

  ACChargerEntity({
    required this.connectorType,
    required super.id,
    required super.status,
    required super.powerOutput,
    required super.sessionFee,
    required super.ratePerKwh,
  });
}

class DCChargerEntity extends ChargerEntity {
  final ConnectorType connectorType;

  DCChargerEntity({
    required this.connectorType,
    required super.id,
    required super.status,
    required super.powerOutput,
    required super.sessionFee,
    required super.ratePerKwh,
  });
}
