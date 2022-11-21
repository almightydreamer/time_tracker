import 'package:data/core/db/db.dart';
import 'package:data/user/datasource/user_local_data_source.dart';
import 'package:get_it/get_it.dart';


Future<void> init() async {
  final dataDi = GetIt.instance;

  dataDi.registerLazySingleton<LocalDatabase>(() => LocalDatabase());

  dataDi.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSource(db: dataDi<LocalDatabase>()));
}
