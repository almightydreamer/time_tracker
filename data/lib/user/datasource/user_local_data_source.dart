import 'package:drift/drift.dart';

import '../../core/db/db.dart';

class UserLocalDataSource {
  final LocalDatabase db;

  const UserLocalDataSource({required this.db});

  Future<UserData> retrieveUser() async {
    var query = db.user.select()
      ..limit(1);
    return (await query.get()).first;
  }

  Future<void> deleteUser() async {}

  Future<void> saveUser(UserData user) async {
    await db.into(db.user).insert(user);
  }
}
