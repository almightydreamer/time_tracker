import 'dart:io';


import 'package:domain/modules/home/action/entity/action_entity.dart';
import 'package:domain/modules/home/action/repository/action_repository.dart';
import 'package:domain/modules/core/response.dart';
import 'package:either_dart/either.dart';
import '../datasource/local_datasource.dart';
import '../mapper/movie_mapper.dart';

class ActionRepositoryImpl implements ActionRepository {
  late LocalDataSource _localDataSource;

  ActionRepositoryImpl({required LocalDataSource localDataSource}) {
    _localDataSource = localDataSource;
  }

  @override
  Future<Either<Failure, List<ActionEntity>>> getLocalActionList() async {try {
    return (_localDataSource.retrieveArticles().asyncMap((event) async {
      var mapArticleTags = await _localDataSource.getArticleTagsById(event.map((e) => e.id).toList());
      print(mapArticleTags);
      event.forEachIndexed((index, element) {

        element.tags = mapArticleTags.containsKey(element.id) ? mapArticleTags[element.id]! : [];
      });
      var articles = event.map((e) => ArticleMapper().mapLocalToEntity(e)).toList();
      return Right(articles);
    }));
  } catch (e, s) {
    print('$e\n\n$s');
    yield Left(OtherFailure(e, s));
  }}
  Future<Either<Failure, void>> saveLocalActionList(List<ActionEntity> list) async {}
}
