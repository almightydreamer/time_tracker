import 'package:either_dart/either.dart';

import '../../core/request/response.dart';
import '../entity/goal_list_entity.dart';

abstract class GoalRepository {
  Future<Either<Failure, GoalListEntity>> getApiGoalList(int pageNumber, int pageLimit);
  Stream<Either<Failure, GoalListEntity>> getLocalGoalList(int pageNumber, int pageLimit);
  Future<Either<Failure, void>> saveGoalListToLocal(GoalListEntity list);
}