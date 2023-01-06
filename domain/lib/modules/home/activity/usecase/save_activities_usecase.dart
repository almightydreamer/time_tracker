import 'package:domain/modules/core/response.dart';
import 'package:either_dart/either.dart';
import '../entity/activity_entity.dart';
import '../repository/activity_repository.dart';

class SaveActivitiesUseCase {
  final ActivityRepository repository;

  SaveActivitiesUseCase(this.repository);

  Future<Either<Failure, void>> call(List<ActivityEntity> list) {
    return repository.saveLocalActivity(list);
  }
}
