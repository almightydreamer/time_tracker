import 'package:either_dart/either.dart';

import '../../core/request/response.dart';
import '../entity/exercise_list_entity.dart';

abstract class ExerciseRepository {
  Future<Either<Failure, ExerciseListEntity>> getApiExerciseList(int pageNumber, int pageLimit);
  Stream<Either<Failure, ExerciseListEntity>> getLocalExerciseList(int pageNumber, int pageLimit);
  Future<Either<Failure, void>> saveExerciseListToLocal(ExerciseListEntity list);
}