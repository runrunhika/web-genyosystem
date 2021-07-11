import 'package:flutter/material.dart';
import 'package:web_genyosystem/pages/M/mobile_pp.dart';
import 'package:web_genyosystem/pages/W/web_pp.dart';

class PPPage extends StatelessWidget {
  const PPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 700) {
        return WebPPScreen();
      } else {
        return Stack(
          children: [MobilPPScreen()],
        );
      }
    });
  }
}
