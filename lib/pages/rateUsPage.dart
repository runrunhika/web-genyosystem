import 'package:flutter/material.dart';
import 'package:web_video_sample/widget/menuWidget.dart';

class RateUsPage extends StatelessWidget {
  const RateUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: Text('RateUs Page'),
        leading: MenuWidget(),
      ),
    );
  }
}
