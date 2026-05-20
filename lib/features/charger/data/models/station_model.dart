import '../../domain/entities/station.dart';
import 'charger_model.dart';

class StationModel extends Station {
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
    final chargersJson =
        (json['chargers'] as List?)?.cast<Map<String, dynamic>>() ?? [];

    return StationModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      address: json['address'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      status: _statusFromString(json['status'] as String?),
      chargers: chargersJson.map(ChargerModel.fromJson).toList(),
    );
  }

  static StationStatus _statusFromString(String? value) {
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
