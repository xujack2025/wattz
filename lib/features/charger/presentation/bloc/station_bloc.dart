import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/stationEntity.dart';
import '../../domain/usecases/get_shopping_stations.dart';

part 'station_event.dart';
part 'station_state.dart';

class StationBloc extends Bloc<StationEvent, StationState> {
  final GetStationsUseCase getStationsUseCase;

  StationBloc(this.getStationsUseCase) : super(const StationInitial()) {
    on<StationsRequested>((event, emit) async {
      emit(StationLoading());
      try {
        final stations = await getStationsUseCase();
        emit(StationsLoaded(stations));
      } catch (e) {
        emit(StationFailure(e.toString()));
      }
    });
  }
}
