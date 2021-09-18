import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'pages/aboutUsPage.dart';
import 'pages/helpPage.dart';
import 'pages/menuPage.dart';
import 'pages/notificationPage.dart';
import 'pages/paymentPage.dart';
import 'pages/promoPage.dart';
import 'pages/rateUsPage.dart';
import 'widget/menuItem.dart';

//flutter create .
//flutter build web


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MenuItem currentItem = MenuItems.payment;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.Style1,
      borderRadius: 40,
      angle: -10,
      slideWidth: MediaQuery.of(context).size.width * 0.5,
      //my favorite
      showShadow: true,
      backgroundColor: Colors.orange,
      mainScreen: getScreen(),
      menuScreen: Builder(
        builder: (context) => MenuPage(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() {
                currentItem = item;

                ZoomDrawer.of(context)!.close();
              });
            }),
      ),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.payment:
        return PaymentPage();
      case MenuItems.promos:
        return PromoPage();
      case MenuItems.notifications:
        return NotificationPage();
      case MenuItems.help:
        return HelpPage();
      case MenuItems.aboutUs:
        return AboutUsPage();
      default:
        return RateUsPage();
    }
  }
}
