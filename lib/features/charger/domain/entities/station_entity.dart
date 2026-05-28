import 'package:equatable/equatable.dart';

import 'charger_entity.dart';

enum StationStatus { available, busy, offline, maintenance }

class StationEntity extends Equatable {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final StationStatus status;
  final List<ChargerEntity> chargers;

  StationEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.status,
    required List<ChargerEntity> chargers,
  }) : chargers = List.unmodifiable(chargers);

  List<ChargerEntity> getAllCharger() {
    return chargers;
  }

  List<ChargerEntity> getAvailableChargers() {
    return chargers.where((charger) => charger.isAvailable).toList();
  }

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
