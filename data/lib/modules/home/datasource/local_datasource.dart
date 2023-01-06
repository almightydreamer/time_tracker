import 'package:data/core/db/db.dart';

class LocalDataSource {
  final LocalDatabase db;

  const LocalDataSource({required this.db});

  /*Stream<List<ArticleLocalDTO>> retrieveArticles() async* {}

  Future<void> saveArticles(List<ArticleLocalDTO> articles) async {}*/
}
