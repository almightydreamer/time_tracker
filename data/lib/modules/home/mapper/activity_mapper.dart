import 'package:data/core/db/db.dart';
import 'package:data/modules/home/dto/activity_local_dto.dart';
import 'package:domain/modules/home/activity/entity/activity_entity.dart';

class ActivityMapper {
  ActivityEntity mapLocalToEntity(ActivityLocalDTO input) {
    return ActivityEntity(
        id: input.data.id,
        day: input.data.dayId,
        actionId: input.data.actionId,
        endOfActivity: input.data.endTime,
        startOfActivity: input.data.startTime);
  }

  ActivityLocalDTO mapDataToLocal(ActivityData data) {
    return ActivityLocalDTO(data: data);
  }

  ActivityData mapEntityToData(ActivityEntity entity) {
    return ActivityData(
        id: entity.id,
        dayId: entity.day,
        actionId: entity.actionId,
        startTime: entity.startOfActivity,
        endTime: entity.endOfActivity);
  }

//MovieLocalDTO mapDataToLocal(MovieData input) {}

//MovieEntity mapLocalToEntity(MovieLocalDTO input) {}

//MovieLocalDTO mapEntityToLocal(MovieEntity input) {}
}
