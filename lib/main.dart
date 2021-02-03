import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'json_parsing.dart';
import 'src/article.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _ids = [
    26006656,
    26010237,
    26010927,
    26011025,
    26007100,
    26010782,
    26009542,
    25997906,
    26011309,
    25993624,
    25989115,
    26010977,
    26006841,
    26010312,
    26006138,
    26006731,
    26005330,
    25993822,
    26002335,
    25995835,
    26002657,
    26005758,
    26004552,
    26007444,
    26005038,
    25995623,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _ids
            .map(
              (id) => FutureBuilder<Article>(
                future: _getArticle(id),
                builder:
                    (BuildContext context, AsyncSnapshot<Article> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return _buildItem(snapshot.data);
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Future<Article> _getArticle(int id) async {
    final itemUrl = 'https://hacker-news.firebaseio.com/v0/item/${id}.json';
    final itemResponse = await http.get(itemUrl);
    if (itemResponse.statusCode == 200) {
      return parseArticle(itemResponse.body);
    } else {
      return null;
    }
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
