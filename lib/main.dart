import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_providers.dart';
import 'core/routes/app_route_generator.dart';
import 'core/routes/app_routes.dart';
import 'core/themes/app_colors.dart';
import 'global.dart';

void main() async {
  await Global.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.allBlocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            primary: AppColors.primary,
          ),
        ),
        initialRoute: AppRoutes.onBoardingPage,
        onGenerateRoute: AppRouteGenerator.onGenerateRoute,
      ),
    );
  }
}
