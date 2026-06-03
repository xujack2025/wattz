import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/params/params.dart';
import '../../../domain/usecases/sign_in_with_email_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInWithEmailUsecase signInWithEmailUsecase;
  SignInBloc(this.signInWithEmailUsecase) : super(SignInState()) {
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email, status: SignInStatus.editing));
    });
    on<PasswordEvent>((event, emit) {
      emit(
        state.copyWith(password: event.password, status: SignInStatus.editing),
      );
    });
    on<SignInSubmittedEvent>((event, emit) async {
      emit(state.copyWith(status: SignInStatus.loading));
      try {
        await signInWithEmailUsecase(
          AuthParams(email: state.email.trim(), password: state.password),
        );
        emit(state.copyWith(status: SignInStatus.success));
      } catch (e) {
        emit(
          state.copyWith(
            status: SignInStatus.failure,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
