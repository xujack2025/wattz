import '../entities/stationEntity.dart';
import '../repositories/station_repository.dart';

class GetStationsUseCase {
  const GetStationsUseCase(this.repository);
  final StationRepository repository;

  Future<List<StationEntity>> call() async {
    return await repository.getStations();
  }
}
