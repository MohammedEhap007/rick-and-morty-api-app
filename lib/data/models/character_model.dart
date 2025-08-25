class CharacterModel {
  final int totalPages;
  final int currentPage;
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
    this.totalPages = 0,
    this.currentPage = 1,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'] ?? '',
      gender: json['gender'],
      origin: Origin(
        name: json['origin']['name'],
        url: json['origin']['url'] ?? '',
      ),
      location: Location(
        name: json['location']['name'],
        url: json['location']['url'] ?? '',
      ),
      image: json['image'],
      episode: List<String>.from(json['episode']),
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
