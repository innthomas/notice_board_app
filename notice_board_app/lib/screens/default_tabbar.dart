import 'package:flutter/material.dart';
import 'package:notice_board_app/screens/duty_roster.dart';
import 'package:notice_board_app/screens/my_drawer.dart';
import 'package:notice_board_app/screens/news.dart';
import 'package:notice_board_app/screens/pinned.dart';

class MyDefaultTabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white10,
          centerTitle: true,
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              //color: Colors.red,
            ),
            child: Text(
              "Notice Board",
              style: TextStyle(
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
            MyDutyRoster(),
            MyNews(),
            MyPinned(),
          ],
        ),
      ),
    );
  }
}
