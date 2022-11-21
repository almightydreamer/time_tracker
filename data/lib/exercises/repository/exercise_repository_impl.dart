import 'dart:html';

import 'package:domain/core/request/response.dart';
import 'package:domain/exercises/entity/exercise_list_entity.dart';
import 'package:domain/exercises/repository/exercise_repository.dart';
import 'package:either_dart/either.dart';

import '../datasource/exercise_api_datasource.dart';
import '../datasource/exercise_local_datasource.dart';
import '../dto/exercise_page_api_dto.dart';
import '../mapper/exercise_mapper.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  late ExerciseApiDataSource _apiDataSource;
  late ExerciseLocalDataSource _localDataSource;

  ExerciseRepositoryImpl(
      {required ExerciseApiDataSource exerciseApiDataSource,
      required ExerciseLocalDataSource exerciseLocalDataSource}) {
    _apiDataSource = exerciseApiDataSource;
    _localDataSource = exerciseLocalDataSource;
  }

  @override
  Future<Either<Failure, ExerciseListEntity>> getApiExerciseList(
      int pageNumber, int pageLimit) async {
    try {
      var response = await _apiDataSource.getExercisesList(pageNumber, pageLimit);
      if (response.statusCode != HttpStatus.ok) {
        return Left(ApiFailure(response.data, StackTrace.current));
      }

      ExercisesPageApiDTO exercisesPageApiDTO = ExercisesPageApiDTO.fromJson(response.data);
      var entities = exercisesPageApiDTO.results
          .map((e) => ExercisesMapper().mapApiToEntity(e))
          .toList();
      ExerciseListEntity list = ExerciseListEntity(entities: entities);
      return Right(list);
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }

  @override
  Stream<Either<Failure, ExerciseListEntity>> getLocalExerciseList(
      int pageNumber, int pageLimit) async* {
    try {
      var exercisesStream = await _localDataSource.retrieveExercises();
      await for(var exercises in exercisesStream){
        var list = exercises.map((e) => ExercisesMapper().mapLocalToEntity(e)).toList();
        var entity = ExerciseListEntity(entities: list);
        yield Right(entity);
      }
    } catch (e, s) {
      yield Left(OtherFailure(e, s));
    }
  }

  @override

  Future<Either<Failure, void>> saveExerciseListToLocal(ExerciseListEntity list) async {
    try {
      var exercises =
          list.entities.map((e) => ExercisesMapper().mapEntityToLocal(e)).toList();
      await _localDataSource.saveExercises(exercises);
      return Right(null);
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }
}
