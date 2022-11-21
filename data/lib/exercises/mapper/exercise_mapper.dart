import 'package:data/core/db/db.dart';
import 'package:data/exercises/dto/exercise_api_dto.dart';
import 'package:domain/exercises/entity/exercise_entity.dart';


class ExercisesMapper {

  ExerciseEntity mapApiToEntity(ExercisesApiDTO input) {
    return ExerciseEntity(
        title: input.title,
        plan: input.plan,
        duration: input.duration,
        burnCalories: input.burnCalories,
        image: input.image,
        id: input.id);
  }

  ExerciseEntity mapLocalToEntity(ExerciseData input) {
    return ExerciseEntity(
        title: input.title,
        plan: input.plan,
        duration: input.duration,
        burnCalories: input.burnCalories,
        image: input.image,
        id: input.id);
  }

  ExerciseData mapEntityToLocal(ExerciseEntity input) {
    return ExerciseData(
        title: input.title,
        plan: input.plan,
        duration: input.duration,
        burnCalories: input.burnCalories,
        image: input.image?? '',
        id: input.id?? 0);
  }
}
