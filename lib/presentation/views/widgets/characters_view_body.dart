import 'package:flutter/material.dart';
import 'package:rick_and_morty_api_app/constants/app_colors.dart';
import 'package:rick_and_morty_api_app/presentation/views/widgets/characters_grid_view.dart';

import '../../../data/models/character_model.dart';

class CharactersViewBody extends StatelessWidget {
  const CharactersViewBody({super.key, required this.characters});
  final List<CharacterModel> characters;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.backgroundColor,
        child: Column(
          children: [
            CharactersGridView(characters: characters),
          ],
        ),
      ),
    );
  }
}
