import 'package:domain/goals/entity/goal_list_entity.dart';
import 'package:domain/goals/repository/goal_repository.dart';
import 'package:either_dart/either.dart';

import '../../core/request/response.dart';

class GetGoalsUseCase {
  final GoalRepository repository;

  GetGoalsUseCase(this.repository);

  Stream<Either<Failure, GoalListEntity>> call(
      int pageNumber, int pageLimit) {
    // var dbResponse = await repository.getLocalGoalList(pageNumber, pageLimit);
    // GoalListEntity goalListEntity = GoalListEntity(entities: []);
    // dbResponse.fold((l) => null, (r) {
    //   goalListEntity = r;
    // });
    // if (goalListEntity.entities.isNotEmpty) {
    //   yield Right(goalListEntity);
    // }
    // yield await repository.getApiGoalList(pageNumber, pageLimit);

    repository.getApiGoalList(pageNumber, pageLimit).then((apiResponse) {
      apiResponse.fold((l) => null, (r) {
        repository.saveGoalListToLocal(r);
      });
    });

    return repository.getLocalGoalList(pageNumber, pageLimit);
  }
}
