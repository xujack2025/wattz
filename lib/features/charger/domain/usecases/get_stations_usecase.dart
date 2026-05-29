import '../entities/station_entity.dart';
import '../repos/station_repository.dart';

class GetStationsUseCase {
  const GetStationsUseCase(this.repository);
  final StationRepository repository;

  Future<List<StationEntity>> call() async {
    return await repository.getStations();
  }
}
