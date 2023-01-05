import 'package:domain/core/request/response.dart';
import 'package:either_dart/either.dart';

import '../entity/movie_details_entity.dart';
import '../repository/movie_details_repository.dart';

class GetMovieDetailsUseCase {
  final MovieDetailsRepository repository;

  GetMovieDetailsUseCase(this.repository);

  Future<Either<Failure, MovieDetailsEntity>> call(int movieId) {
    /*repository.getApiGenreList(pageNumber).then((apiResponse) {
      apiResponse.fold((l) => null, (r) {
        repository.saveGenreListToLocal(r);
      });
    });
      return repository.getLocalGenreList();*/
    return repository.getApiMovieDetails(movieId);
  }
}
