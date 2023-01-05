import 'package:domain/core/request/response.dart';
import 'package:either_dart/either.dart';

import '../entity/genre_entity.dart';
import '../repository/genre_repository.dart';

class GetGenresUseCase {
  final GenreRepository repository;

  GetGenresUseCase(this.repository);

  Future<Either<Failure, List<GenreEntity>>> call() {
    /*repository.getApiGenreList(pageNumber).then((apiResponse) {
      apiResponse.fold((l) => null, (r) {
        repository.saveGenreListToLocal(r);
      });
    });
      return repository.getLocalGenreList();*/
    return repository.getApiGenreList();
  }
}
