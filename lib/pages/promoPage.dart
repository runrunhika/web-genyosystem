import 'package:flutter/material.dart';
import 'package:web_video_sample/widget/menuWidget.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Promo Page'),
        leading: MenuWidget(),
      ),
    );
  }
}
