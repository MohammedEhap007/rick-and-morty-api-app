import '../models/character_model.dart';
import '../services/character_api_service.dart';

class CharactersRepo {
  final CharacterApiService _characterApiService;

  CharactersRepo(this._characterApiService);

  Future<List<CharacterModel>> getAllCharacters() async {
    final characters = await _characterApiService.getAllCharacter();
    return characters.values
        .map(
          (character) => CharacterModel.fromJson(character),
        )
        .toList();
  }
}
