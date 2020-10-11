import 'package:flutter/material.dart';
import 'package:notice_board/screens/duty_roster.dart';
import 'package:notice_board/screens/my_drawer.dart';
import 'package:notice_board/screens/notice_board.dart';
import 'package:notice_board/screens/my_news.dart';

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
            unselectedLabelColor: Colors.white,
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
                    "Notice Board",
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
                    "Global News",
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
                    "Duty Roster",
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            NoticeBoard(),
            MyNews(),
            MyDutyRoster(),
          ],
        ),
      ),
    );
  }
}
