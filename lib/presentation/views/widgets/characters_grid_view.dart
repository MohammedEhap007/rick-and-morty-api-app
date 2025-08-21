import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_api_app/presentation/views/widgets/characters_grid_view_item.dart';

import '../../../data/models/character_model.dart';
import '../../logic/cubits/characters_cubit.dart';

class CharactersGridView extends StatelessWidget {
  const CharactersGridView({super.key, required this.characters});

  final List<CharacterModel> characters;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 2 / 3,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return CharactersGridViewItem(
          characterModel: characters[index],
        );
      },
    );
  }
}
