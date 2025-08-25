import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../constants/app_colors.dart';
import '../../../data/models/character_model.dart';
import '../../logic/cubits/characters_cubit.dart';
import 'characters_view_body.dart';

class CharactersViewBodyBlocBuilder extends StatelessWidget {
  const CharactersViewBodyBlocBuilder({
    super.key,
    required this.searchTextController,
    required this.searchedCharacters,
  });
  final TextEditingController searchTextController;
  final List<CharacterModel> searchedCharacters;

  @override
  Widget build(BuildContext context) {
    List<CharacterModel> characters = [];
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoading && state.isFirstFetch) {
          return const Center(
            child: SpinKitThreeInOut(
              color: AppColors.mortyColor,
            ),
          );
        }

        if (state is CharactersLoaded) {
          characters = state.characters;
        }

        return CharactersViewBody(
          characters: characters,
          searchTextController: searchTextController,
          searchedCharacters: searchedCharacters,
        );
      },
    );
  }
}
