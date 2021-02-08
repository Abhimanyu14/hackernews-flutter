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

class HackerNewsApiError extends Error {
  final String message;

  HackerNewsApiError(this.message);
}

class HackerNewsBloc {
  static const _baseUrl = 'https://hacker-news.firebaseio.com/v0/';
  final _isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();
  final _storiesTypeController = StreamController<StoriesType>();

  Stream<bool> get isLoading => _isLoadingSubject.stream;

  Stream<List<Article>> get articles => _articlesSubject.stream;

  Sink<StoriesType> get storiesType => _storiesTypeController.sink;
  var _articles = <Article>[];

  HackerNewsBloc() {
    _initializeArticles();
    _storiesTypeController.stream.listen((storiesType) async {
      _getArticlesAndUpdate(await _getIds(storiesType));
    });
  }

  Future<void> _initializeArticles() async {
    _getArticlesAndUpdate(await _getIds(StoriesType.topStories));
  }

  void _getArticlesAndUpdate(List<int> articleIds) async {
    _isLoadingSubject.add(true);
    await _updateArticles(articleIds);
    _articlesSubject.add(UnmodifiableListView(_articles));
    _isLoadingSubject.add(false);
  }

  Future<List<int>> _getIds(StoriesType storiesType) async {
    final url = storiesType == StoriesType.topStories
        ? '${_baseUrl}topstories.json'
        : '${_baseUrl}newstories.json';
    final httpResponse = await http.get(url);
    if (httpResponse.statusCode == 200) {
      return parseTopStories(httpResponse.body).take(10).toList();
    }
    throw HackerNewsApiError('Stories $storiesType could not be fetched.');
  }

  Future<Article> _getArticle(int id) async {
    final url = '$_baseUrl/item/$id.json';
    final httpResponse = await http.get(url);
    if (httpResponse.statusCode == 200) {
      return parseArticle(httpResponse.body);
    }
    throw HackerNewsApiError('Article $id could not be fetched.');
  }

  Future<Null> _updateArticles(List<int> articleIds) async {
    final futureArticles = articleIds.map((id) => _getArticle(id));
    final articles = await Future.wait(futureArticles);
    _articles = articles;
  }

  void close() {
    _storiesTypeController.close();
  }
}
