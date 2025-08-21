import 'package:flutter/material.dart';
import 'package:rick_and_morty_api_app/constants/app_colors.dart';
import 'package:rick_and_morty_api_app/presentation/views/widgets/characters_view_body_bloc_builder.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        backgroundColor: AppColors.mortyColor,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: const CharactersViewBodyBlocBuilder(),
    );
  }
}
