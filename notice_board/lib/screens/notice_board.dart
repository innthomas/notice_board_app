import 'package:flutter/material.dart';
import 'package:notice_board/firebase_service/firebase_service.dart';
import 'package:notice_board/model/model.dart';
import 'package:notice_board/pages/add_notice.dart';
import 'package:notice_board/pages/notice_detail.dart';

class NoticeBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
