import 'package:dio/dio.dart';

import '../../../../core/constants/constant.dart';
import '../models/station_model.dart';

abstract class StationRemoteDatasource {
  Future<List<StationModel>> getStations();
}

class StationRemoteDatasourceImpl implements StationRemoteDatasource {
  final Dio dio;

  final apiUrl = 'https://api.openchargemap.io/v3/poi';

  StationRemoteDatasourceImpl(this.dio);
  @override
  Future<List<StationModel>> getStations() async {
    final response = await dio.get(
      apiUrl,
      queryParameters: {
        // 'boundingbox': '(3.24,101.60),(3.04,101.75)',
        'latitude': 3.219693,
        'longitude': 101.643854,
        // 'latitude': 3.034233,
        // 'longitude': 101.623258,
        'distance': 200,
        'distanceunit': 'KM',
        'maxresults': maxresults,
        'countrycode': 'MY',
        'key': '04cf9f9e-114a-497c-8c8c-e6dbdbd52ac6',
      },
      options: Options(headers: {'User-Agent': 'wattz_app'}),
    );

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((json) => StationModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load stations: ${response.statusCode}');
    }
  }
}
