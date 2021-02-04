import 'dart:async';
import 'dart:collection';

import 'package:hackernews/json_parsing.dart';
import 'package:hackernews/src/article.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

enum StoriesType {
  topStories,
  newStories,
}

class HackerNewsBloc {
  Stream<List<Article>> get articles => _articlesSubject.stream;

  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  var _articles = <Article>[];

  Sink<StoriesType> get storiesType => _storiesTypeController.sink;

  final _storiesTypeController = StreamController<StoriesType>();

  HackerNewsBloc() {
    _getArticlesAndUpdate(_topStoriesIds);

    _storiesTypeController.stream.listen((storiesType) {
      if (storiesType == StoriesType.newStories) {
        _getArticlesAndUpdate(_newStoriesIds);
      } else if (storiesType == StoriesType.topStories) {
        _getArticlesAndUpdate(_topStoriesIds);
      }
    });
  }

  void _getArticlesAndUpdate(List<int> articleIds) {
    _updateArticles(articleIds).then((_) {
      _articlesSubject.add(UnmodifiableListView(_articles));
    });
  }

  static List<int> _topStoriesIds = [
    26006656,
    26010237,
    26010927,
    26011025,
    26007100,
    26010782,
  ];

  static List<int> _newStoriesIds = [
    26009542,
    25997906,
    26011309,
    25993624,
    25989115,
    26010977,
  ];

  Future<Article> _getArticle(int id) async {
    final itemUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final itemResponse = await http.get(itemUrl);
    if (itemResponse.statusCode == 200) {
      return parseArticle(itemResponse.body);
    } else {
      return null;
    }
  }

  Future<Null> _updateArticles(List<int> articleIds) async {
    final futureArticles = articleIds.map((id) => _getArticle(id));
    final articles = await Future.wait(futureArticles);
    _articles = articles;
  }
}
