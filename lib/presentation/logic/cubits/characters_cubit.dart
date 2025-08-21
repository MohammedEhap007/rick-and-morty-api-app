import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/character_model.dart';
import '../../../data/repos/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo _charactersRepo;
  List<CharacterModel> _characters = [];
  CharactersCubit(this._charactersRepo) : super(CharactersInitial());

  List<CharacterModel> getAllCharacters() {
    if (_characters.isEmpty) {
      emit(CharactersLoading());
      _charactersRepo
          .getAllCharacters()
          .then((characters) {
            _characters = characters;
            emit(CharactersLoaded(_characters));
          })
          .catchError((error) {
            emit(CharactersError(error.toString()));
          });
    }
    return _characters;
  }
}
