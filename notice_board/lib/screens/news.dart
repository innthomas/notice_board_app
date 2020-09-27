import 'package:flutter/material.dart';
import 'package:notice_board/firebase_service/firebase_service.dart';
import 'package:notice_board/model/model.dart';
import 'package:notice_board/pages/add_news.dart';
import 'package:notice_board/pages/news_detail.dart';

class MyNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        centerTitle: true,
        title: Text('News'),
      ),
      body: StreamBuilder(
        stream: FirestoreService().getNews(),
        builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
          if (snapshot.hasError || !snapshot.hasData)
            return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              News news = snapshot.data[index];
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Colors.white,
                elevation: 15.0,
                child: ListTile(
                  leading: Image.asset(
                    "images/pin.png",
                    height: 30.0,
                  ),
                  title: Text(
                    news.title,
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    "by ${news.author}",
                    style: TextStyle(color: Colors.brown),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // IconButton(
                      //  color: Colors.blue,
                      //  icon: Icon(Icons.edit),
                      //  onPressed: () => Navigator.push(
                      //    context,
                      //   MaterialPageRoute(
                      //    builder: (_) => AddNewsPage(),
                      //    )),
                      // ),
                      IconButton(
                        color: Colors.red,
                        icon: Icon(Icons.delete),
                        onPressed: () => _deletenews(context, news.id),
                      ),
                    ],
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NewsDetailsPage(
                        news: news,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddNewsPage()));
        },
      ),
    );
  }

  void _deletenews(BuildContext context, String id) async {
    if (await _showConfirmationDialog(context)) {
      try {
        await FirestoreService().deleteNews(id);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              content: Text("Are you sure you want to delete?"),
              actions: <Widget>[
                FlatButton(
                  textColor: Colors.red,
                  child: Text("yes"),
                  onPressed: () => Navigator.pop(context, true),
                ),
                FlatButton(
                  textColor: Colors.black,
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ],
            ));
  }
}
