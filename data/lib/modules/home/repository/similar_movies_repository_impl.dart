import 'dart:io';
import 'package:data/modules/home/dto/api/movie_page_api_dto.dart';
import 'package:data/modules/home/dto/api/similar_movies_page_api_dto.dart';
import 'package:domain/core/request/response.dart';
import 'package:domain/modules/home/similar_movies/entity/similar_movie_entity.dart';
import 'package:either_dart/either.dart';
import '../datasource/api_datasource.dart';
import '../datasource/local_datasource.dart';
import 'package:domain/modules/home/similar_movies/repository/similar_movie_repository.dart';

import '../mapper/similar_movie_mapper.dart';

class SimilarMovieRepositoryImpl implements SimilarMovieRepository {
  late ApiDataSource _apiDataSource;
  late LocalDataSource _localDataSource;

  SimilarMovieRepositoryImpl({required ApiDataSource apiDataSource, required LocalDataSource localDataSource}) {
    _apiDataSource = apiDataSource;
    _localDataSource = localDataSource;
  }

  @override
  Future<Either<Failure, List<SimilarMovieEntity>>> getApiSimilarMovies(int movieId) async {
    try {
      var response = await _apiDataSource.getSimilarMovies(movieId);
      if (response.statusCode != HttpStatus.ok) {
        return Left(ApiFailure(response.data, StackTrace.current));
      }
      SimilarMoviesPageApiDTO similarMoviesPageApiDTO = SimilarMoviesPageApiDTO.fromJson(response.data);
      var entities = similarMoviesPageApiDTO.movies.map((e) => SimilarMovieMapper().mapApiToEntity(e)).toList();
      return Right(entities);
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }
}
