import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'features/auth/data/datasources/remote_datasource/firebase_data_source_impl.dart';
import 'features/auth/data/repos/auth_repository_impl.dart';
import 'features/auth/domain/usecases/is_signed_in_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/domain/usecases/sign_in_with_email_usecase.dart';
import 'features/auth/domain/usecases/sign_up_with_email_usecase.dart';
import 'features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'features/charger/data/datasources/station_local_datasource.dart';
import 'features/charger/data/repos/station_repository_impl.dart';
import 'features/charger/domain/usecases/get_stations_usecase.dart';
import 'features/charger/presentation/bloc/station_bloc.dart';
import 'features/home/presentation/bloc/navigation/bottom_nav_bloc.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';

class BlocProviders {
  static dynamic get allBlocProviders => [
    BlocProvider(create: (context) => BottomNavBloc()),
    BlocProvider(
      create: (context) {
        final localdataSource = StationLocalDataSourceImpl();
        final repository = StationRepositoryImpl(localdataSource);
        final getStationsUseCase = GetStationsUseCase(repository);

        return StationBloc(getStationsUseCase);
      },
    ),
    BlocProvider(
      create: (context) {
        final remoteDataSource = FirebaseDataSourceImpl(
          FirebaseAuth.instance,
          GoogleSignIn.instance,
          FirebaseFirestore.instance,
        );
        final repo = AuthRepositoryImpl(remoteDataSource);
        final signInWithEmailUsecase = SignInWithEmailUsecase(repo);
        return SignInBloc(signInWithEmailUsecase);
      },
      child: Container(),
    ),
    BlocProvider(
      create: (contex) {
        final remoteDataSource = FirebaseDataSourceImpl(
          FirebaseAuth.instance,
          GoogleSignIn.instance,
          FirebaseFirestore.instance,
        );
        final repo = AuthRepositoryImpl(remoteDataSource);
        final isSignedInUsecase = IsSignedInUsecase(repo);
        final logOutUsecase = LogOutUsecase(repo);
        return ProfileBloc(isSignedInUsecase, logOutUsecase);
      },
    ),
    BlocProvider(
      create: (contex) {
        final dataSource = FirebaseDataSourceImpl(
          FirebaseAuth.instance,
          GoogleSignIn.instance,
          FirebaseFirestore.instance,
        );
        final repo = AuthRepositoryImpl(dataSource);
        final signUpWithEmailUsecase = SignUpWithEmailUsecase(repo);
        return SignUpBloc(signUpWithEmailUsecase);
      },
    ),
  ];
}
