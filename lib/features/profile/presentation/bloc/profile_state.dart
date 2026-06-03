part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, success, failure }

class ProfileState extends Equatable {
  const ProfileState({this.status = ProfileStatus.initial});

  final ProfileStatus status;

  @override
  List<Object> get props => [status];

  ProfileState copyWith({ProfileStatus? status}) {
    return ProfileState(status: status ?? this.status);
  }
}
