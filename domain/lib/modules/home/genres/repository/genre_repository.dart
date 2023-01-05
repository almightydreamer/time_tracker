import 'package:domain/core/request/response.dart';
import 'package:either_dart/either.dart';

import '../entity/genre_entity.dart';


abstract class GenreRepository {
  Future<Either<Failure, List<GenreEntity>>> getApiGenreList();
}