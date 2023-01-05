import 'package:data/modules/home/mapper/genre_mapper.dart';
import 'package:domain/modules/home/genres/entity/genre_entity.dart';
import 'package:domain/modules/home/movie_details/entity/movie_details_entity.dart';

import '../dto/api/movie_details_api_dto.dart';

class MovieDetailsMapper {
  MovieDetailsEntity mapApiToEntity(MovieDetailsApiDTO input) {
    List<GenreEntity> genres = input.genres.map((genre) => GenreMapper().mapApiToEntity(genre)).toList();
    return MovieDetailsEntity(
        id: input.id,
        voteAverage: input.voteAverage,
        runtime: input.runtime,
        title: input.title,
        posterPath: input.posterPath,
        genres: genres,
        releaseDate: input.releaseDate,
        popularity: input.popularity,
        overview: input.overview,
        backdropPath: input.backdropPath);
  }
}
