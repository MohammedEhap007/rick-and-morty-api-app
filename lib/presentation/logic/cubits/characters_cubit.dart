import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/character_model.dart';
import '../../../data/repos/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo _charactersRepo;
  late List<CharacterModel> _characters;

  CharactersCubit(this._charactersRepo) : super(CharactersInitial());

  List<CharacterModel> getAllCharacters() {
    _charactersRepo
        .getAllCharacters()
        .then(
          (characters) {
            emit(CharactersLoaded(characters));
            _characters = characters;
          },
        )
        .catchError(
          (error) {
            emit(CharactersError(error.toString()));
          },
        );
    return _characters;
  }
}
