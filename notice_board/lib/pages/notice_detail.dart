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
        title: Text("${news.title} details "),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  news.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  news.author,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blueGrey,
                    fontFamily: "FugazOne",
                  ),
                )
              ],
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
