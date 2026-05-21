import '../entities/station_entity.dart';

abstract class StationRepository {
  Future<List<StationEntity>> getStations();
}
