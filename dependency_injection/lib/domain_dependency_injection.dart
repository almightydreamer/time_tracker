import 'package:domain/modules/home/movies/usecase/get_movies_usecase.dart';
import 'package:domain/modules/home/movies/repository/movie_repository.dart';
import 'package:domain/modules/home/similar_movies/usecase/get_similar_movies_usecase.dart';
import 'package:domain/modules/home/similar_movies/repository/similar_movie_repository.dart';
import 'package:domain/modules/home/genres/usecase/get_genres_usecase.dart';
import 'package:domain/modules/home/genres/repository/genre_repository.dart';
import 'package:domain/modules/home/movie_details/usecase/get_movie_details_usecase.dart';
import 'package:domain/modules/home/movie_details/repository/movie_details_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  final domainDi = GetIt.instance;
  print('DomainDI : initialization started');

  domainDi.registerLazySingleton<GetMoviesUseCase>(() => GetMoviesUseCase(domainDi<MovieRepository>()));

  domainDi.registerLazySingleton<GetGenresUseCase>(() => GetGenresUseCase(domainDi<GenreRepository>()));

  domainDi.registerLazySingleton<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(domainDi<MovieDetailsRepository>()));

  domainDi.registerLazySingleton<GetSimilarMoviesUseCase>(() => GetSimilarMoviesUseCase(domainDi<SimilarMovieRepository>()));

  print('DomainDI : initialization finished');
}
