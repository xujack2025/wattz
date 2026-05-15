part of 'charging_bloc.dart';

sealed class ChargingState extends Equatable {
  const ChargingState();
  
  @override
  List<Object> get props => [];
}

final class ChargingInitial extends ChargingState {}
