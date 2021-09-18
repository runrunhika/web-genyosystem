import 'package:flutter/material.dart';
import 'package:web_video_sample/widget/menuWidget.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('AboutUs Page'),
        leading: MenuWidget(),
      ),
    );
  }
}
