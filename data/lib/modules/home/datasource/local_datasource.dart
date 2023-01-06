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
    print('s1');
    var query = db.action.select();
    print('s2');
    var mainStream = query.watch().map((rows) {
      print('s3');
      List<ActionLocalDTO> list = [];
      print('s4');
      for (var row in rows) {
        print('s5');
        list.add(ActionMapper().mapDataToLocal(row));
      }
      return list;
    });
    yield* mainStream;
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
    var query = db.activity.select()..where((activity) => activity.dayId.equals(day));
    var mainStream = query.watch().map((rows) {
      List<ActivityLocalDTO> list = [];
      for (var row in rows) {
        list.add(ActivityMapper().mapDataToLocal(row));
      }
      return list;
    });
    yield* mainStream;
  }

  Future<void> saveActivities(List<ActivityCompanion> activities) async {
    List<ActivityCompanion> list = [];
    for (var activity in activities) {
      list.add(activity);
    }
    db.batch((batch) {
      batch.insertAll(db.activity, list, mode: InsertMode.insertOrReplace);
    });
  }
}
