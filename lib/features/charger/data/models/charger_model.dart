import '../../../../core/constants/constant.dart';
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
      id: json[cID].toString(),
      status: _statusFromString(json[cStatusType]?[cTitle] ?? ''),
      powerOutput: (json[cPowerKW] as num).toDouble(),
      sessionFee: (json['sessionFee'] as num? ?? 0.0).toDouble(),
      ratePerKwh: (json['ratePerKwh'] as num? ?? 0.0).toDouble(),
      connectorType: _connectorTypeFromString(json[cConnectionType][cTitle]),
    );
  }

  static ConnectorType _connectorTypeFromString(String value) {
    // print("Raw Connector String from API: '$value'");
    if (value.contains('CCS')) return ConnectorType.ccs2;
    if (value.contains('Type 2')) return ConnectorType.type2;
    if (value.contains('CHAdeMO')) return ConnectorType.chademo;
    return ConnectorType.type2;
  }

  static ChargerStatus _statusFromString(String value) {
    if (value.contains('operational')) return ChargerStatus.available;
    if (value.contains('charging')) return ChargerStatus.charging;
    if (value.contains('maintenance')) return ChargerStatus.maintenance;
    return ChargerStatus.offline;
  }
}
