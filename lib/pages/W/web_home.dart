import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:marquee/marquee.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_genyosystem/data/data.dart';
import 'package:web_genyosystem/pages/W/web_pp.dart';
import 'package:web_genyosystem/utils/utils.dart';
import 'package:web_genyosystem/widget/on_hover_image.dart';
import 'package:web_genyosystem/widget/on_hover_widget.dart';

import '../contact_page.dart';

class WebHomeScreen extends StatefulWidget {
  @override
  _WebHomeScreenState createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
          title: Text("お問い合わせサイト"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orangeAccent, Colors.lightBlueAccent],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft)),
          )),
      drawer: Drawer(
        child: ListView(
          children: [
            Divider(),
            ListTile(
              title: Text("Contact"),
              trailing: Icon(Icons.meeting_room),
              onTap: () {
                Get.to(ContactPage());
              },
            ),
            Divider(),
            ListTile(
              title: Text("PrivacyPolicy"),
              trailing: Icon(Icons.privacy_tip),
              onTap: () {
                Get.to(WebPPScreen());
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          //Service
          Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.8),
                  gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.greenAccent])),
              child: Marquee(
                text: 'Other services',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 100.0,
                pauseAfterRound: Duration(seconds: 1),
                startPadding: 10.0,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              )),
          //クッキングアプリ ios
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 40, top: 20),
            child: OnHoverWidget(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.pink, width: 4),
                    shape: StadiumBorder(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.asset(
                        'assets/logo.jpeg',
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RichText(
                        text: TextSpan(
                      text: "クッキングアプリ \n(iPhone用)",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          decoration: TextDecoration.underline),
                    )),
                  ],
                ),
                onPressed: _cookAppleAppURL,
              ),
            ),
          ),

          //クッキングアプリ and
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 40, top: 20),
            child: OnHoverWidget(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.purple, width: 4),
                    shape: StadiumBorder(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.asset(
                        'assets/logo.jpeg',
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RichText(
                        text: TextSpan(
                      text: "クッキングアプリ \n(Android版)",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          decoration: TextDecoration.underline),
                    )),
                  ],
                ),
                onPressed: _cookAppURL,
              ),
            ),
          ),

          //画像
//画像
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              height: 900,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      cookImage[index]['image'],
                      fit: BoxFit.fill,
                    ),
                  );
                },
                itemCount: cookImage.length,
                pagination: SwiperPagination(),
                control: SwiperControl(size: 50, color: Colors.red),
              ),
            ),
          ),
          Divider(
            color: Colors.purple,
          ),

          //翻訳アプリ (ios)
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 40, top: 20),
            child: OnHoverWidget(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.pink, width: 4),
                    shape: StadiumBorder(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.asset(
                        'assets/newicon.png',
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RichText(
                        text: TextSpan(
                      text: "翻訳アプリ \n(iPhone版)",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          decoration: TextDecoration.underline),
                    )),
                  ],
                ),
                onPressed: _translateAppleAppURL,
              ),
            ),
          ),

          //翻訳アプリ (android)
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 40, top: 20),
            child: OnHoverWidget(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.purple, width: 4),
                    shape: StadiumBorder(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.asset(
                        'assets/newicon.png',
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RichText(
                        text: TextSpan(
                      text: "翻訳アプリ \n(Android版)",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          decoration: TextDecoration.underline),
                    )),
                  ],
                ),
                onPressed: _translateAppURL,
              ),
            ),
          ),

          //画像
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              height: 900,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      traImage[index]['image'],
                      fit: BoxFit.fill,
                    ),
                  );
                },
                itemCount: traImage.length,
                pagination: SwiperPagination(),
                control: SwiperControl(size: 50, color: Colors.red),
              ),
            ),
          ),

          //ボトム
          BottomAppBar(
            elevation: 30,
            color: Colors.cyan.withOpacity(.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "お問い合わせサイト",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _cookAppURL() async => await canLaunch(cookApp)
      ? await launch(cookApp)
      : throw 'Could not launch $cookApp';

  void _cookAppleAppURL() async => await canLaunch(cookAppleApp)
      ? await launch(cookAppleApp)
      : throw 'Could not launch $cookAppleApp';

  void _translateAppURL() async => await canLaunch(translateApp)
      ? await launch(translateApp)
      : throw 'Could not launch $translateApp';

  void _translateAppleAppURL() async => await canLaunch(translateAppleApp)
      ? await launch(translateAppleApp)
      : throw 'Could not launch $translateAppleApp';
}
