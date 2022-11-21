import 'package:drift/drift.dart';

class User extends Table {
  IntColumn get id => integer()();

  TextColumn get fullName => text()();

  TextColumn get phoneNumber => text().nullable()();
}

class Authorization extends Table {
  TextColumn get refreshToken => text()();

  TextColumn get accessToken => text()();
}

class Goal extends Table {
  IntColumn get id => integer()();

  TextColumn get image => text()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  IntColumn get duration => integer()();

  IntColumn get burnCalories => integer()();
}

class Exercise extends Table {
  IntColumn get id => integer()();

  TextColumn get image => text()();

  TextColumn get title => text()();

  IntColumn get duration => integer()();

  IntColumn get burnCalories => integer()();

  IntColumn get plan => integer()();
}
