import 'package:drift/drift.dart';

import '../../core/db/db.dart';

class ExerciseLocalDataSource {
  final LocalDatabase db;

  const ExerciseLocalDataSource({required this.db});

  Stream<List<ExerciseData>> retrieveExercises() {
    var query = db.exercise.select()..limit(10);
    return query.watch();
  }

  Future<void> deleteExercises() async {}

  Future<void> saveExercises(List<ExerciseData> exercises) async {
    var insertableExercises = exercises
        .map((e) => ExerciseCompanion.insert(
            id: e.id,
            image: e.image,
            title: e.title,
            duration: e.duration,
            plan: e.plan,
            burnCalories: e.burnCalories))
        .toList();
    db.batch((batch) {
      batch.insertAll(db.exercise, insertableExercises,
          mode: InsertMode.insertOrReplace);
    });
  }
}
