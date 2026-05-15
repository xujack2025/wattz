import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'charging_event.dart';
part 'charging_state.dart';

class ChargingBloc extends Bloc<ChargingEvent, ChargingState> {
  ChargingBloc() : super(ChargingInitial()) {
    on<ChargingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
