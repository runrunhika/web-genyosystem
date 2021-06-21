import 'dart:async';

import 'package:flutter/material.dart';
import 'package:web_genyosystem/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '翻訳ウェブアプリ',
      home: HomeScreen(),
    );
  }
}