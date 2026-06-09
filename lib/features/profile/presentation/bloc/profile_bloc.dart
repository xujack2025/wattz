import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/domain/usecases/is_signed_in_usecase.dart';
import '../../../auth/domain/usecases/logout_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IsSignedInUsecase isSignedInUsecase;
  final LogOutUsecase logOutUsecase;

  ProfileBloc(this.isSignedInUsecase, this.logOutUsecase)
    : super(const ProfileState()) {
    on<IsSignInEvent>((event, emit) async {
      emit(state.copyWith(status: ProfileStatus.loading));
      try {
        final isSignedIn = await isSignedInUsecase();
        emit(
          state.copyWith(
            status: isSignedIn ? ProfileStatus.success : ProfileStatus.initial,
          ),
        );
      } catch (_) {
        emit(state.copyWith(status: ProfileStatus.failure));
      }
    });
    on<LogOutEvent>((event, emit) async {
      emit(state.copyWith(status: ProfileStatus.loading));
      try {
        await logOutUsecase();
        emit(state.copyWith(status: ProfileStatus.initial));
      } catch (_) {
        emit(state.copyWith(status: ProfileStatus.failure));
      }
    });

    add(const IsSignInEvent());
  }
}
