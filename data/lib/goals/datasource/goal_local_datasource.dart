import 'package:drift/drift.dart';

import '../../core/db/db.dart';

class GoalLocalDataSource {
  final LocalDatabase db;

  const GoalLocalDataSource({required this.db});

  Stream<List<GoalData>> retrieveGoals() {
    var query = db.goal.select()..limit(10);
    return query.watch();
  }

  Future<void> deleteGoals() async {}

  Future<void> saveGoals(List<GoalData> goals) async {
    var insertableGoals = goals
        .map((e) => GoalCompanion.insert(
            id: e.id,
            image: e.image,
            title: e.title,
            description: e.description,
            duration: e.duration,
            burnCalories: e.burnCalories))
        .toList();
    db.batch((batch) {
      batch.insertAll(db.goal, insertableGoals,
          mode: InsertMode.insertOrReplace);
    });
  }
}
