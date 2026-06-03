part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class IsSignInEvent extends ProfileEvent {
  const IsSignInEvent();
}

class LogOutEvent extends ProfileEvent {
  const LogOutEvent();
}
