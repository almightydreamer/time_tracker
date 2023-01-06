import 'dart:io';
import 'package:either_dart/either.dart';
import '../datasource/local_datasource.dart';
import '../mapper/movie_mapper.dart';
import 'package:domain/modules/home/activity/entity/activity_entity.dart';
import 'package:domain/modules/home/activity/repository/activity_repository.dart';
import 'package:domain/modules/core/response.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  late LocalDataSource _localDataSource;

  ActivityRepositoryImpl({required LocalDataSource localDataSource}) {
    _localDataSource = localDataSource;
  }

  @override
  Future<Either<Failure, List<ActivityEntity>>> getApiMovieList() async {}
  Future<Either<Failure, void>> saveLocalActionList(List<ActivityEntity> list) async {}

}
