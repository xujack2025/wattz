import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/app_routes.dart';
import 'core/themes/app_colors.dart';
import 'core/widgets/navigation_bar/custom_bottom_nav_bar.dart';
import 'features/charger/data/datasources/mock_station_datasource.dart';
import 'features/charger/data/repositories/station_repository_impl.dart';
import 'features/charger/domain/usecases/get_shopping_stations.dart';
import 'features/charger/presentation/bloc/station_bloc.dart';
import 'features/home/presentation/bloc/navigation/bottom_nav_bloc.dart';
import 'features/map/presentation/pages/map_page.dart';
import 'features/onboarding/onboarding_page.dart';
import 'features/profile/presentation/pages/profile_page.dart';
import 'features/reward/presentation/pages/reward_page.dart';
import 'features/scan/presentation/pages/scan_page.dart';

void main() {
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
            final dataSource = MockStationDataSource();
            final repository = StationRepositoryImpl(dataSource);
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
