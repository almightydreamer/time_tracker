import 'dart:io';
import 'package:domain/core/request/response.dart';
import 'package:domain/modules/home/movie_details/entity/movie_details_entity.dart';
import 'package:either_dart/either.dart';
import '../datasource/api_datasource.dart';
import '../datasource/local_datasource.dart';
import '../dto/api/movie_details_api_dto.dart';
import 'package:domain/modules/home/movie_details/repository/movie_details_repository.dart';

import '../mapper/movie_details_mapper.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  late ApiDataSource _apiDataSource;
  late LocalDataSource _localDataSource;

  MovieDetailsRepositoryImpl({required ApiDataSource apiDataSource, required LocalDataSource localDataSource}) {
    _apiDataSource = apiDataSource;
    _localDataSource = localDataSource;
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getApiMovieDetails(int movieId) async {
    try {
      var response = await _apiDataSource.getMovieDetails(movieId);
      if (response.statusCode != HttpStatus.ok) {
        return Left(ApiFailure(response.data, StackTrace.current));
      }
      MovieDetailsApiDTO moviesDetailsApiDTO = MovieDetailsApiDTO.fromJson(response.data);
      var entity = MovieDetailsMapper().mapApiToEntity(moviesDetailsApiDTO);
      return Right(entity);
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }
}
