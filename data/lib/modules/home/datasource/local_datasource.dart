import 'package:data/core/db/db.dart';
import 'package:data/modules/home/mapper/movie_mapper.dart';
import 'package:drift/drift.dart';
import '../dto/local/article_local_dto.dart';

class LocalDataSource {
  final LocalDatabase db;

  const LocalDataSource({required this.db});

  /*Stream<List<ArticleLocalDTO>> retrieveArticles() async* {}

  Future<Map<int, List<String>>> getArticleTagsById(List<int> articleIds) async {}

  Future<void> saveArticles(List<ArticleLocalDTO> articles) async {}*/
}
