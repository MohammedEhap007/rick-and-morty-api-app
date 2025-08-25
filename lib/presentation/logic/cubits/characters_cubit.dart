import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/character_model.dart';
import '../../../data/repos/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo _charactersRepo;
  List<CharacterModel> _characters = [];
  int currentPage = 1;
  bool _isFetching = false;

  CharactersCubit(this._charactersRepo) : super(CharactersInitial());

  Future<void> getAllCharacters() async {
    // Don't re-fetch if already loaded
    if (_characters.isNotEmpty) return;
    // Show loading indicator
    emit(CharactersLoading(isFirstFetch: true));
    try {
      // Fetch characters from the repository
      final characters = await _charactersRepo.getAllCharacters();
      // Cache the fetched characters
      _characters = characters;
      emit(CharactersLoaded(List.from(_characters)));
    } catch (e) {
      emit(CharactersError(e.toString()));
    }
  }

  Future<void> loadMoreCharacters() async {
    // Don't re-fetch if already loading
    if (_isFetching) return;
    // Show loading indicator and fetch more characters
    _isFetching = true;
    // Emit loading state for pagination
    emit(CharactersLoading());

    try {
      // Fetch more characters from the repository
      final newCharacters = await _charactersRepo.loadMoreCharacters(
        ++currentPage,
      );
      // Cache the fetched new characters
      // and add them to the characters list
      _characters.addAll(newCharacters);
      // Emit loaded state with the updated list
      emit(CharactersLoaded(List.from(_characters)));
    } catch (e) {
      emit(CharactersError(e.toString()));
    } finally {
      // Stop the loading indicator
      _isFetching = false;
    }
  }
}
