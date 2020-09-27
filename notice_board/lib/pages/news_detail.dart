import 'package:flutter/material.dart';
import 'package:notice_board/model/model.dart';

class NewsDetailsPage extends StatelessWidget {
  final News news;

  const NewsDetailsPage({Key key, @required this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("${news.title} details by ${news.author}"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              news.title,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              news.description,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
