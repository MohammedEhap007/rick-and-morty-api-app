import '../models/character_model.dart';
import '../services/character_api_service.dart';

class CharactersRepo {
  final CharacterApiService _characterApiService;

  CharactersRepo(this._characterApiService);

  Future<List<CharacterModel>> getAllCharacters() async {
    final response = await _characterApiService.getAllCharacter();

    // Extract the total count and results from the API response
    final totalCount = response['info']['count'] as int;
    final results = response['results'] as List<dynamic>;

    // Parse each character and set totalCharacters
    return results.map((jsonCharacter) {
      final characterModel = CharacterModel.fromJson(jsonCharacter);
      return CharacterModel(
        totalCharacters: totalCount,
        id: characterModel.id,
        name: characterModel.name,
        status: characterModel.status,
        species: characterModel.species,
        type: characterModel.type,
        gender: characterModel.gender,
        origin: characterModel.origin,
        location: characterModel.location,
        image: characterModel.image,
        episode: characterModel.episode,
      );
    }).toList();
  }
}
