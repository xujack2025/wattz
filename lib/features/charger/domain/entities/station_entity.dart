import 'package:equatable/equatable.dart';

import 'charger_entity.dart';

enum StationStatus { available, busy, offline, maintenance }

class StationEntity extends Equatable {
  final String id;
  final String name;
  final String operatorName;
  final String address;
  final double latitude;
  final double longitude;
  final double distance;
  final String town;
  final StationStatus status;
  final List<ChargerEntity> chargers;

  const StationEntity({
    required this.id,
    required this.name,
    required this.operatorName,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.distance,
    required this.town,
    required this.status,
    required this.chargers,
  });

  double get maxPower {
    if (chargers.isEmpty) return 0.0;

    return chargers.map((c) => c.powerOutput).reduce((a, b) => a > b ? a : b);
  }

  // List<ChargerEntity> getAllCharger() {
  //   return chargers;
  // }

  // List<ChargerEntity> getAvailableChargers() {
  //   return chargers.where((charger) => charger.isAvailable).toList();
  // }

  // Station copyWith({
  //   String? id,
  //   String? name,
  //   String? address,
  //   double? latitude,
  //   double? longitude,
  //   StationStatus? status,
  //   List<ChargerEntity>? chargers,
  // }) {
  //   return Station(
  //     id: id ?? this.id,
  //     name: name ?? this.name,
  //     address: address ?? this.address,
  //     latitude: latitude ?? this.latitude,
  //     longitude: longitude ?? this.longitude,
  //     status: status ?? this.status,

  //     chargers: chargers ?? this.chargers,
  //   );
  // }

  @override
  List<Object?> get props => [
    id,
    name,
    address,
    latitude,
    longitude,
    status,
    chargers,
  ];
}
