import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/app_routes.dart';
import 'core/themes/app_colors.dart';
import 'core/widgets/navigation_bar/custom_bottom_nav_bar.dart';
import 'features/charger/data/datasources/station_local_datasource.dart';
import 'features/charger/data/repos/station_repository_impl.dart';
import 'features/charger/domain/usecases/get_stations_usecase.dart';
import 'features/charger/presentation/bloc/station_bloc.dart';
import 'features/home/presentation/bloc/navigation/bottom_nav_bloc.dart';
import 'features/map/presentation/pages/map_page.dart';
import 'features/onboarding/onboarding_page.dart';
import 'features/profile/presentation/pages/profile_page.dart';
import 'features/reward/presentation/pages/reward_page.dart';
import 'features/scan/presentation/pages/scan_page.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavBloc()),
        BlocProvider(
          create: (context) {
            final localdataSource = StationLocalDataSourceImpl();
            final repository = StationRepositoryImpl(localdataSource);
            final getStationsUseCase = GetStationsUseCase(repository);

            return StationBloc(getStationsUseCase);
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            primary: AppColors.primary,
          ),
        ),
        home: const CustomBottomNavBar(),
        routes: {
          AppRoutes.homePage: (context) => const CustomBottomNavBar(),
          AppRoutes.mapPage: (context) => const MapPage(),
          AppRoutes.rewardPage: (context) => const RewardPage(),
          AppRoutes.scanPage: (context) => const ScanPage(),
          AppRoutes.profilePage: (context) => const ProfilePage(),
          AppRoutes.onBoardingPage: (context) => const OnBoardingPage(),
        },
      ),
    );
  }
}
