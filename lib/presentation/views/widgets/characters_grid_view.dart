import 'package:flutter/material.dart';

import '../../../data/models/character_model.dart';
import 'characters_grid_view_item.dart';

class CharactersGridView extends StatelessWidget {
  const CharactersGridView({
    super.key,
    required this.characters,
    required this.searchTextController,
    required this.searchedCharacters,
  });

  final List<CharacterModel> characters;
  final List<CharacterModel> searchedCharacters;
  final TextEditingController searchTextController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: searchTextController.text.isEmpty
          ? characters.length
          : searchedCharacters.length,
      itemBuilder: (ctx, index) {
        return CharactersGridViewItem(
          characterModel: searchTextController.text.isEmpty
              ? characters[index]
              : searchedCharacters[index],
        );
      },
    );
  }
}
