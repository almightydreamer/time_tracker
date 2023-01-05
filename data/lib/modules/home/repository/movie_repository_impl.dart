import 'dart:io';
import 'package:data/modules/home/dto/api/movie_page_api_dto.dart';
import 'package:domain/core/request/response.dart';
import 'package:domain/modules/home/movies/entity/movie_entity.dart';
import 'package:either_dart/either.dart';
import '../datasource/api_datasource.dart';
import '../datasource/local_datasource.dart';
import '../mapper/movie_mapper.dart';
import 'package:domain/modules/home/movies/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  late ApiDataSource _apiDataSource;
  late LocalDataSource _localDataSource;

  MovieRepositoryImpl({required ApiDataSource apiDataSource, required LocalDataSource localDataSource}) {
    _apiDataSource = apiDataSource;
    _localDataSource = localDataSource;
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getApiMovieList(int pageNumber, List<int>? genres) async {
    try {
      var response = await _apiDataSource.getMovieList(pageNumber, genres);
      if (response.statusCode != HttpStatus.ok) {
        return Left(ApiFailure(response.data, StackTrace.current));
      }
      MoviePageApiDTO moviesPageApiDTO = MoviePageApiDTO.fromJson(response.data);
      var entities = moviesPageApiDTO.movies.map((e) => MovieMapper().mapApiToEntity(e)).toList();
      return Right(entities);
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }
}
