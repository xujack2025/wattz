import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/station_entity.dart';
import '../../domain/usecases/get_stations_usecase.dart';

part 'station_event.dart';
part 'station_state.dart';

class StationBloc extends Bloc<StationEvent, StationState> {
  final GetStationsUseCase getStationsUseCase;

  StationBloc(this.getStationsUseCase) : super(const StationInitial()) {
    on<StationsRequested>((event, emit) async {
      emit(StationLoading());
      // await Future.delayed(const Duration(seconds: 3));
      try {
        final stations = await getStationsUseCase();
        emit(StationsLoaded(stations));
      } catch (e) {
        emit(StationFailure(e.toString()));
      }
    });
  }
}
