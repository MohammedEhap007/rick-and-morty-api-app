import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rick_and_morty_api_app/constants/app_colors.dart';
import 'package:rick_and_morty_api_app/helper/setup_get_it.dart';
import 'package:rick_and_morty_api_app/presentation/views/widgets/characters_grid_view.dart';

import '../../../data/models/character_model.dart';
import '../../logic/cubits/characters_cubit.dart';

class CharactersViewBody extends StatefulWidget {
  const CharactersViewBody({
    super.key,
    required this.characters,
    required this.searchTextController,
    required this.searchedCharacters,
  });

  final List<CharacterModel> characters;
  final List<CharacterModel> searchedCharacters;
  final TextEditingController searchTextController;

  @override
  State<CharactersViewBody> createState() => _CharactersViewBodyState();
}

class _CharactersViewBodyState extends State<CharactersViewBody> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Listen to scroll events and load more characters when reaching the bottom
    scrollController.addListener(_loadMoreCharacters);
  }

  @override
  void dispose() {
    // Remove the scroll listener and dispose the controller
    scrollController.removeListener(_loadMoreCharacters);
    scrollController.dispose();
    super.dispose();
  }

  void _loadMoreCharacters() {
    final charactersCubit = getIt<CharactersCubit>();
    if (
    // Check if the scroll position is at the bottom
    scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        // Check if there are characters in the list
        widget.characters.isNotEmpty &&
        // Check if there are more pages to load
        widget.characters.first.totalPages > charactersCubit.currentPage) {
      // Load more characters when reaching the bottom of the list
      charactersCubit.loadMoreCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          CharactersGridView(
            characters: widget.characters,
            searchTextController: widget.searchTextController,
            searchedCharacters: widget.searchedCharacters,
          ),
          BlocBuilder<CharactersCubit, CharactersState>(
            builder: (context, state) {
              // Show a loading indicator when fetching more characters
              if (state is CharactersLoading && !state.isFirstFetch) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: SpinKitThreeBounce(
                    color: AppColors.mortyColor,
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
