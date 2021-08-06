import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_genyosystem/pages/M/mobile_drawer.dart';
import 'package:web_genyosystem/pages/M/mobile_home.dart';
import 'package:web_genyosystem/pages/W/web_home.dart';

import 'pages/M/mobile_pp.dart';
import 'pages/contact_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'サポートページ',
      home: MainPage(),
      getPages: [
        GetPage(name: '/main_page', page: () => MainPage()),
        GetPage(name: '/web_home', page: () => WebHomeScreen()),
        GetPage(name: '/mo_home', page: () => MobilAnimation()),
        GetPage(name: '/mo_dra', page: () => MobilDrawer()),
        GetPage(name: '/mo_pp', page: () => MobilPPScreen()),
        GetPage(name: '/contact', page: () => ContactPage()),
      ],
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
