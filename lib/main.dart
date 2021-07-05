import 'dart:async';

import 'package:flutter/material.dart';
import 'package:web_genyosystem/pages/home_page.dart';

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
      home: HomePage(),
    );
  }
}