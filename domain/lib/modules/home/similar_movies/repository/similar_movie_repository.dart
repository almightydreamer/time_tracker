import 'package:domain/core/request/response.dart';
import 'package:either_dart/either.dart';

import '../entity/similar_movie_entity.dart';

abstract class SimilarMovieRepository {
  Future<Either<Failure, List<SimilarMovieEntity>>> getApiSimilarMovies(int movieId);
}