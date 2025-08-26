import 'package:flutter/material.dart';
import 'package:rick_and_morty_api_app/constants/app_colors.dart';
import 'package:rick_and_morty_api_app/data/models/character_model.dart';

import '../../../constants/app_strings.dart';

class CharactersGridViewItem extends StatelessWidget {
  const CharactersGridViewItem({super.key, required this.characterModel});

  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: AppColors.rickColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            charactersDetailsView,
            // Pass the character model as an argument to the details view
            arguments: characterModel,
          );
        },
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              characterModel.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.3,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Hero(
            // Add a hero tag for the character image
            tag: characterModel.id,
            child: Container(
              color: AppColors.rickColor,
              child: characterModel.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.gif',
                      image: characterModel.image,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      'assets/images/placeholder.jpg',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
