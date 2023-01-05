import 'package:domain/modules/home/movies/entity/movie_entity.dart';
import 'package:domain/modules/home/similar_movies/entity/similar_movie_entity.dart';
import '../dto/api/similar_movie_api_dto.dart';

class SimilarMovieMapper {
  SimilarMovieEntity mapApiToEntity(SimilarMovieApiDTO input) {
    return SimilarMovieEntity(id: input.id,
        posterPath: input.posterPath,
        backdropPath: input.backdropPath,
        title: input.title,
        originalTitle: input.originalTitle,
        originalLanguage: input.originalLanguage,
        adultRestricted: input.adultRestricted,
        genreIds: input.genreIds,
        isVideo: input.isVideo,
        overview: input.overview,
        popularity: input.popularity,
        releaseDate: input.releaseDate,
        voteAverage: input.voteAverage,
        voteCount: input.voteCount
    );
  }

  //MovieLocalDTO mapDataToLocal(MovieData input) {}

  //MovieEntity mapLocalToEntity(MovieLocalDTO input) {}

  //MovieLocalDTO mapEntityToLocal(MovieEntity input) {}
}
