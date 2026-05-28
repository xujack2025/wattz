import '../../domain/entities/station_entity.dart';
import 'charger_model.dart';

class StationModel extends StationEntity {
  StationModel({
    required super.id,
    required super.name,
    required super.address,
    required super.latitude,
    required super.longitude,
    required super.status,
    required super.chargers,
  });

  factory StationModel.fromJson(Map<String, dynamic> json) {
    return StationModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      status: _statusFromString(json['status'] as String),
      chargers: ((json['chargers'] as List))
          .map((e) => ChargerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  static StationStatus _statusFromString(String value) {
    switch (value) {
      case 'active':
        return StationStatus.available;
      case 'busy':
        return StationStatus.busy;
      case 'maintenance':
        return StationStatus.maintenance;
      case 'offline':
      default:
        return StationStatus.offline;
    }
  }
}
