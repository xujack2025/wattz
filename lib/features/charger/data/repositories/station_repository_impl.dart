import '../../domain/entities/station_entity.dart';
import '../../domain/repositories/station_repository.dart';
import '../datasources/station_local_datasource.dart';

class StationRepositoryImpl implements StationRepository {
  StationRepositoryImpl(this.localdataSource);
  final StationLocalDataSource localdataSource;

  @override
  Future<List<StationEntity>> getStations() async {
    return await localdataSource.getStations();
  }
}
