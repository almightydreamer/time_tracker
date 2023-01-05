import 'package:data/core/db/db.dart';
import 'package:data/modules/home/datasource/api_datasource.dart';
import 'package:data/modules/home/datasource/local_datasource.dart';
import 'package:data/modules/home/repository/movie_repository_impl.dart';
import 'package:domain/modules/home/movies/repository/movie_repository.dart';
import 'package:data/modules/home/repository/similar_movies_repository_impl.dart';
import 'package:domain/modules/home/similar_movies/repository/similar_movie_repository.dart';
import 'package:data/modules/home/repository/genre_repository_impl.dart';
import 'package:domain/modules/home/genres/repository/genre_repository.dart';
import 'package:data/modules/home/repository/movie_details_repository_impl.dart';
import 'package:domain/modules/home/movie_details/repository/movie_details_repository.dart';

import 'package:get_it/get_it.dart';

Future<void> init() async {
  final dataDi = GetIt.instance;
  print('DataDI : initialization started');

  dataDi.registerLazySingleton<LocalDatabase>(() => LocalDatabase());

  dataDi.registerLazySingleton<LocalDataSource>(() => LocalDataSource(db: dataDi<LocalDatabase>()));

  dataDi.registerLazySingleton<ApiDataSource>(() => ApiDataSource());

  dataDi.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(apiDataSource: dataDi<ApiDataSource>(), localDataSource: dataDi<LocalDataSource>()));

  dataDi.registerLazySingleton<GenreRepository>(
          () => GenreRepositoryImpl(apiDataSource: dataDi<ApiDataSource>(), localDataSource: dataDi<LocalDataSource>()));

  dataDi.registerLazySingleton<MovieDetailsRepository>(
          () => MovieDetailsRepositoryImpl(apiDataSource: dataDi<ApiDataSource>(), localDataSource: dataDi<LocalDataSource>()));

  dataDi.registerLazySingleton<SimilarMovieRepository>(
          () => SimilarMovieRepositoryImpl(apiDataSource: dataDi<ApiDataSource>(), localDataSource: dataDi<LocalDataSource>()));

  print('DataDI : initialization finished');
}
