import 'movie_api_dto.dart';

class GenreApiDTO {
  final int id;
  final String name;

  const GenreApiDTO({
    required this.id,
    required this.name,
  });

  static GenreApiDTO fromJson(json) {
    return GenreApiDTO(id: json['id'], name: json['name']);
  }
}
