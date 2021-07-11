import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_genyosystem/utils/utils.dart';
import 'package:web_genyosystem/widget/on_hover_widget.dart';

class MobilAnimation extends StatefulWidget {
  const MobilAnimation({Key? key}) : super(key: key);

  @override
  _MobilAnimationState createState() => _MobilAnimationState();
}

class _MobilAnimationState extends State<MobilAnimation> {
  bool menuOpen = false;
  double tranx = 0, trany = 0, scale = 1.0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      transform: Matrix4.translationValues(tranx, trany, 0)..scale(scale),
      decoration: BoxDecoration(
          color: Colors.teal[100],
          borderRadius: BorderRadius.circular(menuOpen ? 30 : 0),
          border: Border.all(color: Colors.white)),
      child: ListView(
        children: [
          !menuOpen
              ? Container(
                  height: 60,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orangeAccent, Colors.lightBlueAccent],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft)),
                  child: ListTile(
                      onTap: () {
                        scale = 0.6;
                        tranx = size.width - 150;
                        trany = (size.height - size.height * scale) / 2;
                        setState(() {
                          menuOpen = true;
                        });
                      },
                      title: Text("お問い合わせサイト",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                          textAlign: TextAlign.center),
                      leading: Icon(
                        Icons.menu,
                        color: Colors.white,
                      )),
                )
              : Container(
                  height: 80,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orangeAccent, Colors.lightBlueAccent],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft)),
                  child: ListTile(
                      onTap: () {
                        scale = 1.0;
                        tranx = 0;
                        trany = 0;
                        setState(() {
                          menuOpen = false;
                        });
                      },
                      title: Text("トップページ\nに戻る",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          textAlign: TextAlign.left),
                      leading: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ),

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
                "Service",
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    child: Image.asset(
                      'assets/com.jpg',
                      width: 300,
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    child: Image.asset(
                      'assets/c1-2.png',
                      width: 300,
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    child: Image.asset(
                      'assets/c1-3.png',
                      width: 300,
                      height: 500,
                      fit: BoxFit.cover,
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    child: Image.asset(
                      'assets/1.png',
                      width: 300,
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    child: Image.asset(
                      'assets/2.png',
                      width: 300,
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    child: Image.asset(
                      'assets/3.png',
                      width: 300,
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),

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
