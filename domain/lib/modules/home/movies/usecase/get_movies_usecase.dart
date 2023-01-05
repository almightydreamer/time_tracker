import 'package:domain/core/request/response.dart';
import 'package:either_dart/either.dart';
import '../entity/movie_entity.dart';
import '../repository/movie_repository.dart';

class GetMoviesUseCase {
  final MovieRepository repository;

  GetMoviesUseCase(this.repository);

  Future<Either<Failure, List<MovieEntity>>> call(int pageNumber, List<int>? genres) {
    /*repository.getApiMovieList(pageNumber).then((apiResponse) {
      apiResponse.fold((l) => null, (r) {
        repository.saveArticleListToLocal(r);
      });
    });
      return repository.getLocalArticleList();*/
    return repository.getApiMovieList(pageNumber, genres);
  }
}
