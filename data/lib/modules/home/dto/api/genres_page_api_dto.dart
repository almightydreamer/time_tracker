import 'genre_api_dto.dart';

class GenrePageApiDTO {
  final List<GenreApiDTO> genres;

  const GenrePageApiDTO({
    required this.genres,
  });

  static GenrePageApiDTO fromJson(json) {
    List<GenreApiDTO> genres = (json['genres'] as List).map((e) => GenreApiDTO.fromJson(e)).toList();
    return GenrePageApiDTO(
        genres: genres);
  }
}
