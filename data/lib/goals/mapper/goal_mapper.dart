import 'package:data/core/db/db.dart';
import 'package:data/goals/dto/goals_api_dto.dart';
import 'package:domain/goals/entity/goal_entity.dart';


class GoalsMapper {

  GoalEntity mapApiToEntity(GoalsApiDTO input) {
    return GoalEntity(
        title: input.title,
        description: input.description,
        duration: input.duration,
        burnCalories: input.burnCalories,
        image: input.image,
        id: input.id);
  }

  GoalEntity mapLocalToEntity(GoalData input) {
    return GoalEntity(
        title: input.title,
        description: input.description,
        duration: input.duration,
        burnCalories: input.burnCalories,
        image: input.image,
        id: input.id);
  }

  GoalData mapEntityToLocal(GoalEntity input) {
    return GoalData(
        title: input.title,
        description: input.description,
        duration: input.duration,
        burnCalories: input.burnCalories,
        image: input.image?? '',
        id: input.id?? 0);
  }
}
