import 'package:equatable/equatable.dart';
import 'charger.dart';

enum StationStatus { available, busy, offline, maintenance }

class Station extends Equatable {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final StationStatus status;
  final List<Charger> chargers;

  Station({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.status,
    required List<Charger> chargers,
  }) : chargers = List.unmodifiable(chargers);

  List<Charger> getAvailableChargers() {
    return chargers.where((charger) => charger.isAvailable).toList();
  }

  Station copyWith({
    String? id,
    String? name,
    String? address,
    double? latitude,
    double? longitude,
    StationStatus? status,
    List<Charger>? chargers,
  }) {
    return Station(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      status: status ?? this.status,

      chargers: chargers ?? this.chargers,
    );
  }

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
