import 'package:data/core/db/db.dart';
import 'package:data/modules/home/dto/action_local_dto.dart';
import 'package:data/modules/home/dto/activity_local_dto.dart';
import 'package:data/modules/home/mapper/action_mapper.dart';
import 'package:data/modules/home/mapper/activity_mapper.dart';
import 'package:drift/drift.dart';

class LocalDataSource {
  final LocalDatabase db;

  const LocalDataSource({required this.db});

  Stream<List<ActionLocalDTO>> retrieveActions() async* {
    var query = db.action.select();
    var mainStream = query.watch().map((rows) {
      List<ActionLocalDTO> list = [];
      for (var row in rows) {
        list.add(ActionMapper().mapDataToLocal(row));
      }
      return list;
    });
    yield* mainStream;
  }

  Future<ActionLocalDTO> getAction(int actionId) async {
    var query = db.action.select()
      ..where((e) => e.id.equals(actionId));
    var value = await query.getSingle();
    return ActionMapper().mapDataToLocal(value);
  }

  Future<void> saveActions(List<ActionCompanion> actions) async {
    List<ActionCompanion> list = [];
    for (var action in actions) {
      list.add(action);
    }
    db.batch((batch) {
      batch.insertAll(db.action, list, mode: InsertMode.insertOrReplace);
    });
  }

  Stream<List<ActivityLocalDTO>> retrieveActivities(int day) async* {
    var query = db.activity.select()
      ..where((activity) => activity.dayId.equals(day));
    var mainStream = query.watch().map((rows) {
      List<ActivityLocalDTO> list = [];
      for (var row in rows) {
        list.add(ActivityMapper().mapDataToLocal(row));
      }
      return list;
    });
    yield* mainStream;
  }

  Future<ActivityLocalDTO> getLastActivity() async {
    var query = db.activity.select();
    var value = await query.get();
    return ActivityMapper().mapDataToLocal(value.last);
  }

  Future<void> saveActivities(List<ActivityCompanion> activities) async {
    List<ActivityCompanion> list = [];
    for (var activity in activities) {
      var query = db.activity.select();
      var lastActivity = (await query.get()).last;
      ActivityCompanion newActivity = ActivityCompanion.insert(dayId: lastActivity.dayId,
        actionId: lastActivity.actionId,
        startTime: lastActivity.startTime,
        id: Value(lastActivity.id),
        endTime: activity.startTime,);
      list.add(newActivity);
      list.add(activity);
      db.batch((batch) {
        batch.insertAll(db.activity, list, mode: InsertMode.insertOrReplace);
      });
    }
  }
}
