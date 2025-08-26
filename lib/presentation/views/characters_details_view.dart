import 'package:flutter/material.dart';
import 'package:rick_and_morty_api_app/presentation/views/widgets/custom_sliver_app_bar.dart';

import '../../data/models/character_model.dart';

class CharactersDetailsView extends StatelessWidget {
  const CharactersDetailsView({super.key, required this.characterModel});

  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            characterModel: characterModel,
          ),
        ],
      ),
    );
  }
}
