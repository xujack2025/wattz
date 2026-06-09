import '../../domain/entities/station_entity.dart';
import '../../domain/repos/station_repository.dart';
import '../datasources/station_remote_datasource.dart';

class StationRepositoryImpl implements StationRepository {
  StationRepositoryImpl(this.remotedataSource);
  final StationRemoteDatasource remotedataSource;

  @override
  Future<List<StationEntity>> getStations() async {
    return await remotedataSource.getStations();
  }
}
