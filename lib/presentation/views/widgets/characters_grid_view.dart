import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_api_app/presentation/views/widgets/characters_grid_view_item.dart';

import '../../../data/models/character_model.dart';
import '../../logic/cubits/characters_cubit.dart';

class CharactersGridView extends StatelessWidget {
  const CharactersGridView({
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
          ? allCharacters.length
          : searchedCharacters.length,
      itemBuilder: (ctx, index) {
        return CharactersGridViewItem(
          characterModel: searchTextController.text.isEmpty
              ? allCharacters[index]
              : searchedCharacters[index],
        );
      },
    );
  }
}
