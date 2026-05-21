import '../../../../core/utils/all_station.dart';
import '../models/station_model.dart';

class MockStationDataSource {
  Future<List<StationModel>> getStations() async {
    return stationList.map(StationModel.fromJson).toList();
  }
}
