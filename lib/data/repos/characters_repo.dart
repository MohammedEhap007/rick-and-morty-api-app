import '../models/character_model.dart';
import '../services/character_api_service.dart';

class CharactersRepo {
  final CharacterApiService _characterApiService;

  CharactersRepo(this._characterApiService);

  Future<List<CharacterModel>> getAllCharacters() async {
    final response = await _characterApiService.getAllCharacter();

    // Extract the total pages and results from the API response
    final totalPages = response['info']['pages'] as int;
    final results = response['results'] as List<dynamic>;

    // Parse each character and set totalCharacters
    return results.map((jsonCharacter) {
      final characterModel = CharacterModel.fromJson(jsonCharacter);
      return CharacterModel(
        totalPages: totalPages,
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

  Future<List<CharacterModel>> loadMoreCharacters(int page) async {
    final response = await _characterApiService.loadMoreCharacters(page);

    // Extract the total pages and results from the API response
    final totalPages = response['info']['pages'] as int;
    final results = response['results'] as List<dynamic>;

    // Parse each character and set totalCharacters
    return results.map((jsonCharacter) {
      final characterModel = CharacterModel.fromJson(jsonCharacter);
      return CharacterModel(
        totalPages: totalPages,
        currentPage: page,
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
