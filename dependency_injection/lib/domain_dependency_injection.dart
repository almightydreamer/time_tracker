import 'package:domain/modules/home/movies/usecase/get_movies_usecase.dart';
import 'package:domain/modules/home/movies/repository/movie_repository.dart';

import 'package:get_it/get_it.dart';

Future<void> init() async {
  final domainDi = GetIt.instance;
  print('DomainDI : initialization started');

  domainDi.registerLazySingleton<GetMoviesUseCase>(() => GetMoviesUseCase(domainDi<MovieRepository>()));

  print('DomainDI : initialization finished');
}
