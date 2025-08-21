import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/character_model.dart';
import '../../../data/repos/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo _charactersRepo;

  CharactersCubit(this._charactersRepo) : super(CharactersInitial());

  Future<void> getAllCharacters() async {
    try {
      emit(CharactersLoading());
      final characters = await _charactersRepo.getAllCharacters();
      emit(CharactersLoaded(characters));
    } catch (error) {
      emit(CharactersError(error.toString()));
    }
  }
}
