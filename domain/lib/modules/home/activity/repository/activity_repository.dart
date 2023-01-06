import 'package:domain/modules/core/response.dart';
import 'package:either_dart/either.dart';

import '../entity/activity_entity.dart';

abstract class ActivityRepository {
  Future<Either<Failure, List<ActivityEntity>>> getLocalActivityList();
  Future<Either<Failure, void>> saveLocalActivity(List<ActivityEntity> list);
}