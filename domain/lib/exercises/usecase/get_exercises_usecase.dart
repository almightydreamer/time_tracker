import 'package:either_dart/either.dart';

import '../../core/request/response.dart';
import '../entity/exercise_list_entity.dart';
import '../repository/exercise_repository.dart';

class GetExerciseUseCase {
  final ExerciseRepository repository;

  GetExerciseUseCase(this.repository);

  Stream<Either<Failure,ExerciseListEntity>> call(
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

    repository.getApiExerciseList(pageNumber, pageLimit).then((apiResponse) {
      apiResponse.fold((l) => null, (r) {
        repository.saveExerciseListToLocal(r);
      });
    });

    return repository.getLocalExerciseList(pageNumber, pageLimit);
  }
}
