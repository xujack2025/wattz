import '../../../../core/utils/all_station.dart';
import '../models/station_model.dart';

abstract class StationLocalDataSource {
  Future<List<StationModel>> getStations();
}

class StationLocalDataSourceImpl extends StationLocalDataSource {
  @override
  Future<List<StationModel>> getStations() async {
    return stationList.map(StationModel.fromJson).toList();
  }
}
