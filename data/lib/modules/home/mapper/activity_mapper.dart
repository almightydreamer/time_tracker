import 'package:data/core/db/db.dart';
import 'package:data/modules/home/dto/activity_local_dto.dart';
import 'package:domain/modules/home/activity/entity/activity_entity.dart';

class ActivityMapper {
  ActivityEntity mapLocalToEntity(ActivityLocalDTO input) {
    return ActivityEntity(
        id: input.id,
        day: input.day,
        actionId: input.actionId,
        endOfActivity: input.endOfActivity,
        startOfActivity: input.startOfActivity);
  }

  ActivityLocalDTO mapDataToLocal(ActivityData data) {
    return ActivityLocalDTO(
      day: data.dayId,
      endOfActivity: data.endTime,
      startOfActivity: data.startTime,
      actionId: data.actionId,
    );
  }

  ActivityCompanion mapEntityToData(ActivityEntity entity) {
    return ActivityCompanion.insert(
        dayId: entity.day, actionId: entity.actionId, startTime: entity.startOfActivity, endTime: entity.endOfActivity);
  }

//MovieLocalDTO mapDataToLocal(MovieData input) {}

//MovieEntity mapLocalToEntity(MovieLocalDTO input) {}

//MovieLocalDTO mapEntityToLocal(MovieEntity input) {}
}
