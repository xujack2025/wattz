part of 'station_bloc.dart';

sealed class StationState extends Equatable {
  const StationState();

  @override
  List<Object?> get props => [];
}

final class StationInitial extends StationState {
  const StationInitial();
}

final class StationLoading extends StationState {
  const StationLoading();
}

final class StationsLoaded extends StationState {
  const StationsLoaded(this.stations);

  final List<StationEntity> stations;

  @override
  List<Object?> get props => [stations];
}

final class StationFailure extends StationState {
  const StationFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
