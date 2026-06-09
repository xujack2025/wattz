import '../../../../core/constants/constant.dart';
import '../../domain/entities/station_entity.dart';
import 'charger_model.dart';

class StationModel extends StationEntity {
  const StationModel({
    required super.id,
    required super.name,
    required super.operatorName,
    required super.address,
    required super.latitude,
    required super.longitude,
    required super.distance,
    required super.town,
    required super.status,
    required super.chargers,
  });

  factory StationModel.fromJson(Map<String, dynamic> json) {
    return StationModel(
      id: (json[sId]).toString(),
      name: json[sAddressInfo][sTitle],
      operatorName: (json[sOperatorInfo]?[sTitle] as String? ?? "Wattz"),
      address: json[sAddressInfo][sAddress1],
      latitude: (json[sAddressInfo][sLat] as num).toDouble(),
      longitude: (json[sAddressInfo][sLon] as num).toDouble(),
      distance: (json[sAddressInfo][sDistance] as num).toDouble(),
      town: (json[sAddressInfo][sTown] as String? ?? ''),
      status: _statusFromString(json[sStatusType]?[sTitle] as String),
      chargers: ((json[sConnections] as List))
          .map((e) => ChargerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  static StationStatus _statusFromString(String value) {
    switch (value) {
      case 'Operational':
        return StationStatus.available;
      case 'busy':
        return StationStatus.busy;
      case 'maintenance':
        return StationStatus.maintenance;
      case 'Not Operational':
      default:
        return StationStatus.offline;
    }
  }
}
