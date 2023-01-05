import 'dart:async';
import 'package:domain/modules/home/movie_details/entity/movie_details_entity.dart';
import 'package:domain/modules/home/movie_details/usecase/get_movie_details_usecase.dart';
import 'package:domain/modules/home/similar_movies/entity/similar_movie_entity.dart';
import 'package:domain/modules/home/similar_movies/usecase/get_similar_movies_usecase.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class MovieDetailsController extends GetxController {
  final _getSimilarMoviesUseCase = GetIt.instance.get<GetSimilarMoviesUseCase>();

  RxInt movieTotalTime = 120.obs;
  RxInt movieCurrentTime = 40.obs;
  RxList<SimilarMovieEntity> similarMovieList = RxList();

  Future<void> getSimilarMovies(int movieId) async {
    var value = await _getSimilarMoviesUseCase(movieId);
    print('controller getMovies');
    value.fold((left) => null, (movies) {
      print(movies.length);
      print('controller getMovies');
      for (SimilarMovieEntity movie in movies) {
        print(movie.title);
        similarMovieList.add(movie);
      }
    });
  }

  double maxPixels = 0;
  RxDouble animationCoefficient = 0.0.obs;
  RxBool alreadyAnimated = false.obs;
  RxBool animate1 = false.obs;
  RxBool animate2 = false.obs;
  RxBool animate3 = false.obs;
  RxBool animate4 = false.obs;
  RxBool animate5 = false.obs;

  void resetAnimation() {
    alreadyAnimated.value = false;
    animate1.value = false;
    animate2.value = false;
    animate3.value = false;
    animate4.value = false;
    animate5.value = false;
  }

  void waterfallAnimation() {
    Future.delayed(const Duration(milliseconds: 500)).then((_) {
      animate1.value = true;
      Future.delayed(const Duration(milliseconds: 200)).then((_) {
        animate2.value = true;
        Future.delayed(const Duration(milliseconds: 200)).then((_) {
          animate3.value = true;
          Future.delayed(const Duration(milliseconds: 200)).then((_) {
            animate4.value = true;
            Future.delayed(const Duration(milliseconds: 200)).then((_) {
              animate5.value = true;
            });
          });
        });
      });
    });
  }
}
