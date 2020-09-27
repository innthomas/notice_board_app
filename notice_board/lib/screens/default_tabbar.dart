import 'package:flutter/material.dart';
import 'package:notice_board/screens/duty_roster.dart';
import 'package:notice_board/screens/my_drawer.dart';
import 'package:notice_board/screens/news.dart';
import 'package:notice_board/screens/pinned.dart';

class MyDefaultTabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              //color: Colors.red,
            ),
            child: Text(
              "Notice Board",
              style: TextStyle(
                  fontFamily: "Pacifico",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.redAccent,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.redAccent,
            ),
            tabs: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(color: Colors.redAccent, width: 1)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "news",
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(color: Colors.redAccent, width: 1)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "duty roster",
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(color: Colors.redAccent, width: 1)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "pinned",
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MyNews(),
            MyDutyRoster(),
            MyPinned(),
          ],
        ),
      ),
    );
  }
}
