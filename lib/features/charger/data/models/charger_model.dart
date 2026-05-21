import '../../domain/entities/charger_entity.dart';

class ChargerModel {
  static ChargerEntity fromJson(Map<String, dynamic> json) {
    final connectorType = _connectorTypeFromString(json['connectorType'] as String?);
    final status = _statusFromString(json['status'] as String?);
    final id = json['id'] as String? ?? '';
    final powerOutput = (json['powerOutput'] as num?)?.toDouble() ?? 0.0;
    final sessionFee = (json['sessionFee'] as num?)?.toDouble() ?? 0.0;
    final ratePerKwh = (json['ratePerKwh'] as num?)?.toDouble() ?? 0.0;

    return ChargerEntity(
      id: id,
      status: status,
      powerOutput: powerOutput,
      sessionFee: sessionFee,
      ratePerKwh: ratePerKwh,
      connectorType: connectorType,
    );
  }

  static ConnectorType _connectorTypeFromString(String? value) {
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

  static ChargerStatus _statusFromString(String? value) {
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
