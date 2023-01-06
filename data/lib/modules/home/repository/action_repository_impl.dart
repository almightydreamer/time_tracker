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
    try {
      print('1');
      var actionsStream = _localDataSource.retrieveActions();
      print('2');
      await for (var actions in actionsStream) {
        print('3');
        var list = actions.map((e) => ActionMapper().mapLocalToEntity(e)).toList();
        print('4');
        yield Right(list);
      }
    } catch (e, s) {
      yield Left(OtherFailure(e, s));
    }
  }

  @override
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
