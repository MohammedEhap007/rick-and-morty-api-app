import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../data/models/character_model.dart';
import 'widgets/custom_animated_text.dart';
import 'widgets/custom_sliver_app_bar.dart';
import 'widgets/custom_sliver_list.dart';

class CharactersDetailsView extends StatelessWidget {
  const CharactersDetailsView({super.key, required this.characterModel});

  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.rickColor,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            characterModel: characterModel,
          ),
          CustomSliverList(
            characterModel: characterModel,
          ),
          SliverFillRemaining(
            child: CustomAnimatedText(characterModel: characterModel),
          ),
        ],
      ),
    );
  }
}
