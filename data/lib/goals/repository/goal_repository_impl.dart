import 'dart:html';

import 'package:data/goals/dto/goals_page_api_dto.dart';
import 'package:data/goals/mapper/goal_mapper.dart';
import 'package:domain/core/request/response.dart';
import 'package:domain/goals/entity/goal_list_entity.dart';
import 'package:domain/goals/repository/goal_repository.dart';
import 'package:either_dart/either.dart';

import '../datasource/goal_api_datasource.dart';
import '../datasource/goal_local_datasource.dart';

class GoalRepositoryImpl implements GoalRepository {
  late GoalApiDataSource _apiDataSource;
  late GoalLocalDataSource _localDataSource;

  GoalRepositoryImpl(
      {required GoalApiDataSource goalApiDataSource,
      required GoalLocalDataSource goalLocalDataSource}) {
    _apiDataSource = goalApiDataSource;
    _localDataSource = goalLocalDataSource;
  }

  @override
  Future<Either<Failure, GoalListEntity>> getApiGoalList(
      int pageNumber, int pageLimit) async {
    try {
      var response = await _apiDataSource.getGoalsList(pageNumber, pageLimit);
      if (response.statusCode != HttpStatus.ok) {
        return Left(ApiFailure(response.data, StackTrace.current));
      }

      GoalsPageApiDTO goalsPageApiDTO = GoalsPageApiDTO.fromJson(response.data);
      var entities = goalsPageApiDTO.results
          .map((e) => GoalsMapper().mapApiToEntity(e))
          .toList();
      GoalListEntity list = GoalListEntity(entities: entities);
      return Right(list);
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }

  @override
  Stream<Either<Failure, GoalListEntity>> getLocalGoalList(
      int pageNumber, int pageLimit) async* {
    try {
      var goalsStream = await _localDataSource.retrieveGoals();
      await for(var goals in goalsStream){
        var list = goals.map((e) => GoalsMapper().mapLocalToEntity(e)).toList();
        var entity = GoalListEntity(entities: list);
        yield Right(entity);
      }
    } catch (e, s) {
      yield Left(OtherFailure(e, s));
    }
  }

  @override
  Future<Either<Failure, void>> saveGoalListToLocal(GoalListEntity list) async {
    try {
      var goals =
          list.entities.map((e) => GoalsMapper().mapEntityToLocal(e)).toList();
      await _localDataSource.saveGoals(goals);
      return Right(null);
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }
}
