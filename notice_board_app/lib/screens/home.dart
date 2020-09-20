import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("NoticeBoard"),
          bottom: TabBar(
            tabs: [
              Text("News"),
              Text("Pinned"),
              Text("Duty Roster"),
              Text("timesTable"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
