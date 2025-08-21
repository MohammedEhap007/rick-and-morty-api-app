import 'package:flutter/material.dart';
import 'package:rick_and_morty_api_app/constants/app_colors.dart';
import 'package:rick_and_morty_api_app/presentation/views/widgets/characters_grid_view.dart';

import '../../../data/models/character_model.dart';

class CharactersViewBody extends StatelessWidget {
  const CharactersViewBody({
    super.key,
    required this.allCharacters,
    required this.searchTextController,
    required this.searchedCharacters,
  });

  final List<CharacterModel> allCharacters;
  final List<CharacterModel> searchedCharacters;
  final TextEditingController searchTextController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.backgroundColor,
        child: Column(
          children: [
            CharactersGridView(
              allCharacters: allCharacters,
              searchTextController: searchTextController,
              searchedCharacters: searchedCharacters,
            ),
          ],
        ),
      ),
    );
  }
}
