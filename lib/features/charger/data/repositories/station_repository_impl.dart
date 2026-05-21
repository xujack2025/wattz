import '../../domain/entities/stationEntity.dart';
import '../../domain/repositories/station_repository.dart';
import '../datasources/mock_station_datasource.dart';

class StationRepositoryImpl implements StationRepository {
  final MockStationDataSource dataSource;
  StationRepositoryImpl(this.dataSource);

  @override
  Future<List<StationEntity>> getStations() async {
    return await dataSource.getStations();
  } 
}
