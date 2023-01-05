import 'package:domain/core/request/response.dart';
import 'package:either_dart/either.dart';

import '../entity/movie_details_entity.dart';



abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieDetailsEntity>> getApiMovieDetails(int movieId);
}