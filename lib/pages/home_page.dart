import 'package:flutter/material.dart';
import 'package:web_genyosystem/pages/contact_page.dart';
import 'package:web_genyosystem/pages/pp/pp_page.dart';
import 'package:web_genyosystem/widget/tabbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
      title: 'サポートページ',
      tabs: [
        Tab(
            icon: Icon(Icons.contact_mail, size: 20, color: Colors.black),
            text: 'お問い合わせ'),
        Tab(
            icon: Icon(Icons.privacy_tip, size: 20, color: Colors.black),
            text: 'プライバシーポリシー'),
      ],
      children: [ContactPage(), PPPage()],
    );
  }
}
