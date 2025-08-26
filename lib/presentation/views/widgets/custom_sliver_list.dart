import 'package:flutter/material.dart';

import '../../../data/models/character_model.dart';
import 'character_details_item.dart';
import 'custom_character_details_divider.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({super.key, required this.characterModel});

  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CharacterDetailsItem(
                  detailTitle: 'Name : ',
                  detailValue: characterModel.name,
                ),
                const CustomCharacterDetailsDivider(endIndent: 295),
                CharacterDetailsItem(
                  detailTitle: 'Status : ',
                  detailValue: characterModel.status,
                ),
                const CustomCharacterDetailsDivider(endIndent: 290),
                CharacterDetailsItem(
                  detailTitle: 'Species : ',
                  detailValue: characterModel.species,
                ),
                const CustomCharacterDetailsDivider(endIndent: 280),
                CharacterDetailsItem(
                  detailTitle: 'Gender : ',
                  detailValue: characterModel.gender,
                ),
                const CustomCharacterDetailsDivider(endIndent: 285),
                CharacterDetailsItem(
                  detailTitle: 'Origin : ',
                  detailValue: characterModel.origin.name,
                ),
                const CustomCharacterDetailsDivider(endIndent: 295),
                CharacterDetailsItem(
                  detailTitle: 'Location : ',
                  detailValue: characterModel.location.name,
                ),
                const CustomCharacterDetailsDivider(endIndent: 275),
                CharacterDetailsItem(
                  detailTitle: 'Episodes Appeared In : ',
                  detailValue: characterModel.episode.length.toString(),
                ),
                const CustomCharacterDetailsDivider(endIndent: 170),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
