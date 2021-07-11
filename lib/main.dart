import 'dart:async';

import 'package:flutter/material.dart';
import 'package:web_genyosystem/pages/M/mobile_drawer.dart';
import 'package:web_genyosystem/pages/M/mobile_home.dart';
import 'package:web_genyosystem/pages/W/web_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'サポートページ',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 700) {
        return WebHomeScreen();
      } else {
        return Stack(
          children: [MobilDrawer(), MobilAnimation()],
        );
      }
    }));
  }
}
