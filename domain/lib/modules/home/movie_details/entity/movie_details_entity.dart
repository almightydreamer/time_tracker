import 'package:domain/modules/home/genres/entity/genre_entity.dart';

class MovieDetailsEntity {
  final String? backdropPath;
  final List<GenreEntity> genres;
  final int id;
  final String? overview;
  final num popularity;
  final String? posterPath;
  final String releaseDate;
  final String title;
  final int? runtime;
  final num voteAverage;

  const MovieDetailsEntity(
      {required this.id,
        required this.runtime,
        required this.voteAverage,
        required this.title,
        required this.posterPath,
        required this.genres,
        required this.releaseDate,
        required this.popularity,
        required this.overview,
        required this.backdropPath});
}
