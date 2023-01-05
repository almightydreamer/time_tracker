

import 'package:data/modules/home/datasource/local_datasource.dart';
import 'package:domain/core/request/response.dart';
import 'package:domain/modules/home/genres/entity/genre_entity.dart';
import 'package:either_dart/either.dart';

import '../datasource/api_datasource.dart';
import '../dto/api/genres_page_api_dto.dart';
import '../mapper/genre_mapper.dart';
import 'package:domain/modules/home/genres/repository/genre_repository.dart';


class GenreRepositoryImpl implements GenreRepository {
  late ApiDataSource _apiDataSource;
  late LocalDataSource _localDataSource;

  GenreRepositoryImpl({required ApiDataSource apiDataSource, required LocalDataSource localDataSource}) {
    _apiDataSource = apiDataSource;
    _localDataSource = localDataSource;
  }

  @override
  Future<Either<Failure, List<GenreEntity>>> getApiGenreList() async {
    try {
      var response = await _apiDataSource.getGenres();
      if (response.statusCode != 200) {
        return Left(ApiFailure(response.data, StackTrace.current));
      }
      print('right');
      print(response.data);
      GenrePageApiDTO genresPageApiDTO = GenrePageApiDTO.fromJson(response.data);
      print('right');
      var entities = genresPageApiDTO.genres.map((genre) => GenreMapper().mapApiToEntity(genre)).toList();
      print('right');
      return Right(entities);
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }
}
