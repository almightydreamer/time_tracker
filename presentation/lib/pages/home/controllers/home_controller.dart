import 'dart:async';

import 'package:domain/modules/home/genres/entity/genre_entity.dart';
import 'package:domain/modules/home/genres/usecase/get_genres_usecase.dart';
import 'package:domain/modules/home/movie_details/entity/movie_details_entity.dart';
import 'package:domain/modules/home/movie_details/usecase/get_movie_details_usecase.dart';
import 'package:domain/modules/home/movies/entity/movie_entity.dart';
import 'package:domain/modules/home/movies/usecase/get_movies_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class HomeController extends GetxController {

  final _getMoviesUseCase = GetIt.instance.get<GetMoviesUseCase>();
  final _getGenresUseCase = GetIt.instance.get<GetGenresUseCase>();
  final _getMovieDetailsUseCase = GetIt.instance.get<GetMovieDetailsUseCase>();

  RxList<Widget> tabs = RxList();
  Map<int,String> genreEntities = {};

  RxInt selectedIndex = 0.obs;
  int pageNumber = 1;
  int pageLimit = 10;
  RxBool loading = false.obs;
  RxBool pageLoaded = false.obs;
  RxBool allLoaded = false.obs;
  StreamSubscription? subscription;
  RxList<MovieEntity> movieList = RxList();


  Future<MovieDetailsEntity> getDetails(int movieId) async {
    var details = await _getMovieDetailsUseCase(movieId);
    return details.fold((left) {
      throw (Exception);
    }, (entity) => entity);
  }

  Future<void> getGenres() async {
    print('controller getGenres');
    var value = await _getGenresUseCase();
    value.fold((l) => null, (genres) {
      print('controller getGenres right');
      for (GenreEntity genre in genres) {
        genreEntities[genre.id]=genre.name;
        tabs.add(Tab(text: genre.name));
      }
    });
  }

  Future<void> getMovies(List<int>? genres) async {
    var value = await _getMoviesUseCase(pageNumber, genres);
    print('controller getMovies');
    value.fold((left) => null, (movies) {
      print('controller getMovies');
      for (MovieEntity movie in movies) {
        movieList.add(movie);
      }
    });
  }
}