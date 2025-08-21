class CharacterModel {
  final int totalCharacters;
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;
  final List<String> episode;

  CharacterModel({
    required this.totalCharacters,
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      totalCharacters: json['info']['count'],
      id: json['results'][0]['id'],
      name: json['results'][0]['name'],
      status: json['results'][0]['status'],
      species: json['results'][0]['species'],
      type: json['results'][0]['type'],
      gender: json['results'][0]['gender'],
      origin: Origin(
        name: json['results'][0]['origin']['name'],
        url: json['results'][0]['origin']['url'],
      ),
      location: Location(
        name: json['results'][0]['location']['name'],
        url: json['results'][0]['location']['url'],
      ),
      image: json['results'][0]['image'],
      episode: json['results'][0]['episode'],
    );
  }
}

class Origin {
  final String name;
  final String url;

  Origin({required this.name, required this.url});
}

class Location {
  final String name;
  final String url;

  Location({required this.name, required this.url});
}
