import 'package:flutter/material.dart';
import 'package:rick_and_morty_api_app/constants/app_colors.dart';

import '../../../data/models/character_model.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.characterModel});

  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      foregroundColor: Colors.white,
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.rickColor,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            characterModel.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        background: Hero(
          tag: characterModel.id,
          child: Image.network(
            characterModel.image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
