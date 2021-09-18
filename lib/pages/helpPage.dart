import 'package:flutter/material.dart';
import 'package:web_video_sample/widget/menuWidget.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Help Page'),
        leading: MenuWidget(),
      ),
    );
  }
}
