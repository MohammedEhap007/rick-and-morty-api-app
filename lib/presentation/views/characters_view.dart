import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:rick_and_morty_api_app/data/models/character_model.dart';

import '../../constants/app_colors.dart';
import '../logic/cubits/characters_cubit.dart';
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
  List<CharacterModel> allCharacters = []; // Initialize as empty list
  List<CharacterModel> searchedCharacters = []; // Initialize as empty list
  bool isSearching = false;
  final searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CharactersCubit>().getAllCharacters();

    // Add listener to search controller to update search results
    searchTextController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchTextController.removeListener(_onSearchChanged);
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mortyColor,
        leading: isSearching ? const BackButton() : const SizedBox(),
        title: isSearching
            ? SearchTextField(
                searchTextController: searchTextController,
              )
            : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: BlocListener<CharactersCubit, CharactersState>(
        listener: (context, state) {
          if (state is CharactersLoaded) {
            setState(() {
              allCharacters = state.characters;
            });
          }
        },
        child: CharactersViewBodyBlocBuilder(
          searchTextController: searchTextController,
          searchedCharacters: searchedCharacters,
        ),
      ),
    );
  }

  void _onSearchChanged() {
    final query = searchTextController.text;
    if (query.isEmpty) {
      setState(() {
        searchedCharacters = [];
      });
    } else {
      setState(() {
        searchedCharacters = allCharacters
            .where(
              (character) =>
                  character.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      });
    }
  }

  Widget _buildAppBarTitle() {
    return const Text(
      'Characters',
    );
  }

  List<Widget> _buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            Icons.search,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }
}
