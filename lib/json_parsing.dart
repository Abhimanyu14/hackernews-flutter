import 'dart:convert' as json;

import 'package:built_value/built_value.dart';

part 'json_parsing.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  String get text;
  String get domain;
  String get by;
  String get age;
  int get score;
  int get commentsCount;

  Article._();
  factory Article([void Function(ArticleBuilder) updates]) = _$Article;
}

/*class Article {
  final String text;
  final String url;
  final String by;
  final int time;
  final int score;

  const Article({
    this.text,
    this.url,
    this.by,
    this.time,
    this.score,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return Article(
      // Second string is used if text is null
      text: json['text'] ?? '[null]',
      url: json['url'],
      by: json['by'],
      time: json['time'],
      score: json['score'],
    );
  }
}*/

List<int> parseTopStories(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);

  // To convert dynamic to strongly typed list
  final listOfIds = List<int>.from(parsed);
  return listOfIds;
}

Article parseArticle(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);

  // To convert dynamic to strongly typed object
  final article = Article.fromJson(parsed);
  return article;
}
