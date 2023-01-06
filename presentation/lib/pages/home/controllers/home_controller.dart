import 'dart:async';
import 'package:domain/modules/home/movies/usecase/get_actions_usecase.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class HomeController extends GetxController {
  final _getMoviesUseCase = GetIt.instance.get<GetMoviesUseCase>();

  Future<void> getMovies(List<int>? genres) async {
    var value = await _getMoviesUseCase();
  }
}