part of 'sign_up_bloc.dart';

enum SignUpStatus { initial, loading, editing, success, failed }

class SignUpState extends Equatable {
  const SignUpState({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.status = SignUpStatus.initial,
    this.errorMessage,
  });
  final String email;
  final String password;
  final String confirmPassword;
  final SignUpStatus status;
  final String? errorMessage;

  SignUpState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    SignUpStatus? status,
    String? errorMessage,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    confirmPassword,
    status,
    errorMessage,
  ];
}
