import 'dart:io';

import 'package:data/modules/home/mapper/action_mapper.dart';
import 'package:domain/modules/home/action/entity/action_entity.dart';
import 'package:domain/modules/home/action/repository/action_repository.dart';
import 'package:domain/modules/core/response.dart';
import 'package:either_dart/either.dart';
import '../datasource/local_datasource.dart';
import '../mapper/activity_mapper.dart';

class ActionRepositoryImpl implements ActionRepository {
  late LocalDataSource _localDataSource;

  ActionRepositoryImpl({required LocalDataSource localDataSource}) {
    _localDataSource = localDataSource;
  }

  @override
  Stream<Either<Failure, List<ActionEntity>>> getLocalActionList() async* {
    print('food_repository_impl > getLocalFOodList() started');
    try {
      var actionsStream = _localDataSource.retrieveActions();
      await for (var actions in actionsStream) {
        var list = actions.map((e) => ActionMapper().mapLocalToEntity(e)).toList();
        yield Right(list);
      }
    } catch (e, s) {
      yield Left(OtherFailure(e, s));
    }
  }

  Future<Either<Failure, void>> saveLocalActionList(List<ActionEntity> list) async {
    try {
      var actions = list.map((e) => ActionMapper().mapEntityToData(e)).toList();
      await _localDataSource.saveActions(actions);
      return Right(null);
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }
}
