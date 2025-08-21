import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          return CharactersViewBody(
            allCharacters: state.characters,
            searchTextController: searchTextController,
            searchedCharacters: searchedCharacters,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
