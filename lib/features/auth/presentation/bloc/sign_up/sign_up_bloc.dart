import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/params/params.dart';
import '../../../domain/usecases/sign_up_with_email_usecase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpWithEmailUsecase signUpWithEmailUsecase;
  SignUpBloc(this.signUpWithEmailUsecase) : super(SignUpState()) {
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email, status: SignUpStatus.editing));
    });
    on<PasswordEvent>((event, emit) {
      emit(
        state.copyWith(password: event.password, status: SignUpStatus.editing),
      );
    });
    on<ConfirmPasswordEvent>((event, emit) {
      emit(
        state.copyWith(
          confirmPassword: event.confirmPassword,
          status: SignUpStatus.editing,
        ),
      );
      if (state.password.isNotEmpty &&
          state.password != event.confirmPassword) {
        emit(
          state.copyWith(
            status: SignUpStatus.failed,
            errorMessage: "Passwords do not match.",
          ),
        );
      }
    });
    on<SignUpSubmittedEvent>((event, emit) async {
      if (state.password.isEmpty ||
          state.confirmPassword.isEmpty ||
          state.password != state.confirmPassword) {
        emit(
          state.copyWith(
            status: SignUpStatus.failed,
            errorMessage: "Passwords do not match.",
          ),
        );
        return;
      }
      emit(state.copyWith(status: SignUpStatus.loading));
      try {
        await signUpWithEmailUsecase(
          AuthParams(email: state.email.trim(), password: state.password),
        );
        emit(state.copyWith(status: SignUpStatus.success));
      } catch (e) {
        print(e.toString());
        emit(
          state.copyWith(
            status: SignUpStatus.failed,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
