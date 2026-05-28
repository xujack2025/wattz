import '../../domain/entities/charger_entity.dart';

class ChargerModel extends ChargerEntity {
  ChargerModel({
    required super.id,
    required super.status,
    required super.powerOutput,
    required super.sessionFee,
    required super.ratePerKwh,
    required super.connectorType,
  });

  factory ChargerModel.fromJson(Map<String, dynamic> json) {
    return ChargerModel(
      id: json['id'],
      status: _statusFromString(json['status']),
      powerOutput: (json['powerOutput'] as num).toDouble(),
      sessionFee: (json['sessionFee'] as num).toDouble(),
      ratePerKwh: (json['ratePerKwh'] as num).toDouble(),
      connectorType: _connectorTypeFromString(json['connectorType']),
    );
  }

  static ConnectorType _connectorTypeFromString(String value) {
    switch (value) {
      case 'ccs2':
        return ConnectorType.ccs2;
      case 'chademo':
        return ConnectorType.chademo;
      case 'type2':
      default:
        return ConnectorType.type2;
    }
  }

  static ChargerStatus _statusFromString(String value) {
    switch (value) {
      case 'available':
        return ChargerStatus.available;
      case 'charging':
        return ChargerStatus.charging;
      case 'maintenance':
        return ChargerStatus.maintenance;
      case 'offline':
      default:
        return ChargerStatus.offline;
    }
  }
}
