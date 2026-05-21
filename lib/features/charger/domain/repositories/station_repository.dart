import '../entities/stationEntity.dart';

abstract class StationRepository {
  Future<List<StationEntity>> getStations();
}
