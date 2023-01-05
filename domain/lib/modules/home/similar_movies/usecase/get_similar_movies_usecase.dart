import 'package:domain/core/request/response.dart';
import 'package:either_dart/either.dart';
import '../entity/similar_movie_entity.dart';
import '../repository/similar_movie_repository.dart';

class GetSimilarMoviesUseCase {
  final SimilarMovieRepository repository;

  GetSimilarMoviesUseCase(this.repository);

  Future<Either<Failure, List<SimilarMovieEntity>>> call(int movieId) {
    /*repository.getApiMovieList(pageNumber).then((apiResponse) {
      apiResponse.fold((l) => null, (r) {
        repository.saveArticleListToLocal(r);
      });
    });
      return repository.getLocalArticleList();*/
    return repository.getApiSimilarMovies(movieId);
  }
}
