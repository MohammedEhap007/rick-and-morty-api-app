import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/character_model.dart';
import '../../logic/cubits/characters_cubit.dart';
import 'characters_view_body.dart';

class CharactersViewBodyBlocBuilder extends StatefulWidget {
  const CharactersViewBodyBlocBuilder({super.key});

  @override
  State<CharactersViewBodyBlocBuilder> createState() =>
      _CharactersViewBodyBlocBuilderState();
}

class _CharactersViewBodyBlocBuilderState
    extends State<CharactersViewBodyBlocBuilder> {
  @override
  void initState() {
    super.initState();
    // Call getAllCharacters when the widget initializes
    context.read<CharactersCubit>().getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CharactersLoaded) {
          return CharactersViewBody(characters: state.characters);
        } else if (state is CharactersError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${state.message}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<CharactersCubit>().getAllCharacters();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('No characters available'));
        }
      },
    );
  }
}
