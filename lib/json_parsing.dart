import 'dart:convert' as json;

import 'src/article.dart';
import 'src/serializers.dart';

List<int> parseTopStories(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);

  // To convert dynamic to strongly typed list
  final listOfIds = List<int>.from(parsed);
  return listOfIds;
}

Article parseArticle(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);

  // To convert dynamic to strongly typed object
  final article =
      standardSerializers.deserializeWith(Article.serializer, parsed);
  return article;
}
