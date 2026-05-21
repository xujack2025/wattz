part of 'station_bloc.dart';

sealed class StationEvent extends Equatable {
  const StationEvent();

  @override
  List<Object?> get props => [];
}

final class StationsRequested extends StationEvent {
  const StationsRequested();
}
