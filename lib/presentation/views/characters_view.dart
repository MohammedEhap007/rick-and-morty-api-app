import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:rick_and_morty_api_app/data/models/character_model.dart';

import '../../constants/app_colors.dart';
import '../logic/cubits/characters_cubit.dart';
import 'widgets/app_bar_actions.dart';
import 'widgets/characters_grid_view.dart';
import 'widgets/characters_grid_view_item.dart';
import 'widgets/characters_view_body.dart';
import 'widgets/characters_view_body_bloc_builder.dart';
import 'widgets/search_text_field.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  List<CharacterModel> characters = [];
  List<CharacterModel> searchedCharacters = [];
  bool isSearching = false;
  final searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch characters for the first time
    context.read<CharactersCubit>().getAllCharacters();

    // Add listener to search controller to update search results
    searchTextController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    // Remove listener from search controller
    searchTextController.removeListener(_onSearchChanged);
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Add a back button when searching
        leading: isSearching ? const BackButton() : const SizedBox.shrink(),
        // Show search field when searching
        title: isSearching
            ? SearchTextField(
                searchTextController: searchTextController,
              )
            : const Text(
                'Characters',
              ),
        actions: appBarActions(
          isSearching: isSearching,
          onStartSearch: _startSearch,
          onStopSearch: _stopSearch,
        ),
      ),
      body: BlocListener<CharactersCubit, CharactersState>(
        listener: (context, state) {
          // Update characters list when new characters are loaded
          if (state is CharactersLoaded) {
            setState(() {
              characters = state.characters;
            });
          }
        },
        // Build the main content area
        child: CharactersViewBodyBlocBuilder(
          searchTextController: searchTextController,
          searchedCharacters: searchedCharacters,
        ),
      ),
    );
  }

  // Handle search text changes
  void _onSearchChanged() {
    // Get the current search query
    final query = searchTextController.text;
    // Update the searched characters list based on the query
    setState(() {
      if (query.isEmpty) {
        searchedCharacters = [];
      } else {
        searchedCharacters = characters
            .where(
              (character) =>
                  character.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  void _startSearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearch() {
    searchTextController.clear();
    setState(() {
      isSearching = false;
    });
  }
}
