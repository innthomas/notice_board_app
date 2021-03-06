import 'package:flutter/material.dart';
import 'package:notice_board/screens/notice_board.dart';

import 'notice_board_settings.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 25.0,
      child: Container(
        color: Colors.white12,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            CircleAvatar(
              backgroundColor: Colors.teal[100],
              radius: 50.0,
              child: Image.asset("images/notice5.png"),
            ),
            SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NoticeBoardSettings()),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset("images/settings.png"),
                radius: 50.0,
              ),
            ),
            SizedBox(height: 20.0),
            CircleAvatar(
              child: Image.asset("images/notice2.png"),
              radius: 50.0,
            ),
            SizedBox(height: 20.0),
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
