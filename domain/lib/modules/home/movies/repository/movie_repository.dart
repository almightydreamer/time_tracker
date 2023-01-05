import 'package:domain/core/request/response.dart';
import 'package:either_dart/either.dart';

import '../entity/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getApiMovieList(int pageNumber, List<int>? genres);
}