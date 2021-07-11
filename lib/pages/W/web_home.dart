import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => ContactPage()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("PrivacyPolicy"),
              trailing: Icon(Icons.privacy_tip),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => WebPPScreen()));
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
            child: Center(
              child: Text(
                "サービス",
                style: TextStyle(fontSize: 27, color: Colors.white),
              ),
            ),
          ),

          //クッキングアプリ
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
                      text: "クッキングアプリ (Android版)",
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: OnHoverImageWidget(
                    child: Container(
                      child: Image.asset(
                        'assets/com.jpg',
                        width: 300,
                        height: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: OnHoverImageWidget(
                    child: Container(
                      child: Image.asset(
                        'assets/c1-2.png',
                        width: 300,
                        height: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: OnHoverImageWidget(
                    child: Container(
                      child: Image.asset(
                        'assets/c1-3.png',
                        width: 300,
                        height: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
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
                      text: "翻訳アプリ (iPhone版)",
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
                      text: "翻訳アプリ (Android版)",
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: OnHoverImageWidget(
                    child: Container(
                      child: Image.asset(
                        'assets/1.png',
                        width: 300,
                        height: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: OnHoverImageWidget(
                    child: Container(
                      child: Image.asset(
                        'assets/2.png',
                        width: 300,
                        height: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: OnHoverImageWidget(
                    child: Container(
                      child: Image.asset(
                        'assets/3.png',
                        width: 300,
                        height: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
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

  void _translateAppURL() async => await canLaunch(translateApp)
      ? await launch(translateApp)
      : throw 'Could not launch $translateApp';

  void _translateAppleAppURL() async => await canLaunch(translateAppleApp)
      ? await launch(translateAppleApp)
      : throw 'Could not launch $translateAppleApp';

}
