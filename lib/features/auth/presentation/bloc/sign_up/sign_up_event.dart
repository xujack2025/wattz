part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class EmailEvent extends SignUpEvent {
  final String email;
  const EmailEvent(this.email);
  @override
  List<Object> get props => [email];
}

class PasswordEvent extends SignUpEvent {
  final String password;
  const PasswordEvent(this.password);
  @override
  List<Object> get props => [password];
}

class ConfirmPasswordEvent extends SignUpEvent {
  final String confirmPassword;
  const ConfirmPasswordEvent(this.confirmPassword);
  @override
  List<Object> get props => [confirmPassword];
}

class SignUpSubmittedEvent extends SignUpEvent {}
