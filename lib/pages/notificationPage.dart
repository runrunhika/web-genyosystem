import 'package:flutter/material.dart';
import 'package:web_video_sample/widget/menuWidget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Notification Page'),
        leading: MenuWidget(),
      ),
    );
  }
}
