import 'package:flutter/material.dart';
import 'package:rick_and_morty_api_app/presentation/views/home_view.dart';

class RickAndMortyApiApp extends StatelessWidget {
  const RickAndMortyApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty API App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF97CE4C),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF97CE4C),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const HomeView(),
    );
  }
}
