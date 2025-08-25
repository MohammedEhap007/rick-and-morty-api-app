import 'package:flutter/material.dart';
import 'package:rick_and_morty_api_app/constants/app_colors.dart';
import 'package:rick_and_morty_api_app/helper/navigator_key.dart';

import 'constants/app_strings.dart';
import 'helper/on_generate_routes.dart';

class RickAndMortyApiApp extends StatelessWidget {
  const RickAndMortyApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty API App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.backgroundColor,
        ),
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mortyColor,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: charactersView,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: navigatorKey,
    );
  }
}
