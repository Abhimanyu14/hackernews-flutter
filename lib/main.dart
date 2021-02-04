import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hackernews/src/hacker_news_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:hackernews/src/article.dart';

void main() {
  final hackerNewsBloc = HackerNewsBloc();
  runApp(MyApp(bloc: hackerNewsBloc));
}

class MyApp extends StatelessWidget {
  MyApp({
    Key key,
    this.bloc,
  }) : super(key: key);

  final HackerNewsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: 'Flutter Hacker News',
        bloc: bloc,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
    this.bloc,
  }) : super(key: key);

  final HackerNewsBloc bloc;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<UnmodifiableListView<Article>>(
        stream: widget.bloc.articles,
        initialData: UnmodifiableListView<Article>([]),
        builder: (
          BuildContext context,
          AsyncSnapshot<UnmodifiableListView<Article>> snapshot,
        ) =>
            ListView(
          children: snapshot.data.map(_buildItem).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            label: 'Top Stories',
            icon: Icon(Icons.trending_up),
          ),
          BottomNavigationBarItem(
            label: 'New Stories',
            icon: Icon(Icons.new_releases),
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            widget.bloc.storiesType.add(StoriesType.topStories);
          } else if (index == 1) {
            widget.bloc.storiesType.add(StoriesType.newStories);
          }
        },
      ),
    );
  }

  Widget _buildItem(Article article) {
    return Padding(
      // Expansion Tile selection bug fix in list
      key: Key(article.title),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(
          article.title,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('${article.type}'),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () async {
                  final url = "${article.url}";
                  if (await canLaunch(url)) {
                    launch(url);
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
