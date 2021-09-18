import 'package:flutter/material.dart';
import 'package:web_video_sample/widget/menuWidget.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Payment Page'),
        leading: MenuWidget(),
      ),
    );
  }
}
