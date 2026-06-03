part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class AuthStatusChecked extends SignInEvent {
  const AuthStatusChecked();
}

class EmailEvent extends SignInEvent {
  final String email;
  const EmailEvent(this.email);
  @override
  List<Object> get props => [email];
}

class PasswordEvent extends SignInEvent {
  final String password;
  const PasswordEvent(this.password);
  @override
  List<Object> get props => [password];
}

class SignInSubmittedEvent extends SignInEvent {
  const SignInSubmittedEvent();
}
