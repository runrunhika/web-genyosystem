import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  final String title;
  final List<Tab> tabs;
  final List<Widget> children;

  const TabBarWidget(
      {Key? key,
      required this.title,
      required this.tabs,
      required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title, style: TextStyle(color: Colors.black),),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightGreenAccent, Colors.yellow],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft)),
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.pink,
            indicatorWeight: 3,
            tabs: tabs,
          ),
          elevation: 20,
          titleSpacing: 20,
        ),
        body: TabBarView(
          children: children,
        ),
      ),
    );
  }
}
