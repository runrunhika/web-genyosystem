import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_genyosystem/pages/privacy_policy_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '元昜システム株式会社　ホームページ',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "ようこそ！\n元昜システム株式会社\nホームページへ",
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      )),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("元昜システム株式会社"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orangeAccent, Colors.lightBlueAccent],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft)),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => PPScreen()));
              },
              child: Text(
                "プライバシーポリシー",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ))
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Image(image: AssetImage('assets/logo_bik.png')),
              Center(
                child: ColorizeAnimatedTextKit(
                  onTap: null,
                  pause: Duration(milliseconds: 3000),
                  text: ["今日のための今日", "元昜システム株式会社"],
                  textStyle: TextStyle(fontSize: 50.0, fontFamily: "Horizon"),
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                  textAlign: TextAlign.start,
                  repeatForever: true,
                ),
              ),
            ],
          ),
          Image(
            image: AssetImage('assets/it03.png'),
            fit: BoxFit.cover,
          ),

          //service
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
          Container(
              decoration: BoxDecoration(border: Border.all()),
              child: RichText(
                  text: TextSpan(
                      text: "掲示板アプリ",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = launchWebSite))),
          Container(
              decoration: BoxDecoration(border: Border.all()),
              child: RichText(
                  text: TextSpan(
                      text: "翻訳アプリ",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()..onTap = launchApp1))),

          //事業内容
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.8),
                gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.greenAccent])),
            child: Center(
              child: Text(
                "事業内容",
                style: TextStyle(fontSize: 27, color: Colors.white),
              ),
            ),
          ),
          //Image
          Container(
            width: double.infinity,
            height: 400,
            child: Image(
              image: AssetImage('assets/it01.png'),
              fit: BoxFit.cover,
            ),
          ),
          //Android & Ios
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(.3)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.all_inclusive,
                        color: Colors.red[300],
                      ),
                      Text(
                        "スマホアプリ開発",
                        style: TextStyle(fontSize: 25),
                      ),
                      Icon(
                        Icons.all_inclusive,
                        color: Colors.red[300],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                        '''貴社のサービスのためのiOS(iPhone)/Androidアプリの企画からお手伝いし、アプリ開発まで行います。
                          \nAWS及びFirebaseを用いたバックエンド開発・構築や監視・運用も可能です。
                          \nご安心してお任せください'''),
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: double.infinity,
            height: 400,
            child: Image(
              image: AssetImage('assets/it02.png'),
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(.3)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.all_inclusive,
                        color: Colors.red[300],
                      ),
                      Text(
                        "Webサイト作成",
                        style: TextStyle(fontSize: 25),
                      ),
                      Icon(
                        Icons.all_inclusive,
                        color: Colors.red[300],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('''企業のホームページから、個人のブログ・Webアプリケーションなど
                          \nさまざまなWebサイト開発をお手伝いさせていただきます。
                          \n開発では、FlutterやPHP・HTMLを多く使用しております。
                          \nバックエンドでは、FirebaseやAWSなどを用いて開発しております。
                          \nどうぞよろしくお願いします。'''),
                  ),
                ],
              ),
            ),
          ),

          //会社概要
          Image(
            image: AssetImage('assets/it04.png'),
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.8),
                gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.greenAccent])),
            child: Center(
              child: Text(
                "会社概要",
                style: TextStyle(fontSize: 27, color: Colors.white),
              ),
            ),
          ),

          //本文
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Text("会社名"),
                        title: Center(child: Text("元昜システム株式会社")),
                      ),
                      Divider(),
                      ListTile(
                        leading: Text("代表者"),
                        title: Center(child: Text("水野光琉")),
                      ),
                      Divider(),
                      ListTile(
                        leading: Text("所在地"),
                        title: Column(
                          children: [
                            Text("〒 737-0811"),
                            Text("広島県呉市西中央3丁目"),
                            Text("TEL: 080-1932-0107"),
                          ],
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Text("資本金"),
                        title: Center(child: Text("120万円")),
                      ),
                      Divider(),
                      ListTile(
                        leading: Text("設立日"),
                        title: Center(child: Text("2020年7月28日")),
                      ),
                      Divider(),
                      ListTile(
                          leading: Text("主な事業内容"),
                          title: Center(
                              child: RichText(
                                  text: TextSpan(
                                      text: "ごはんの時間",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = launchWebSite)))),
                      Divider(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image(image: AssetImage('assets/face.png')),
                      TextButton(
                          onPressed: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (ctx) => TopMes()));
                          },
                          child: Text(
                            "代表メッセージ",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ))
                    ],
                  ),
                )
              ])),

          //contact
          Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.8),
                  gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.greenAccent])),
              child: Center(
                child: Text(
                  "お問い合わせ",
                  style: TextStyle(fontSize: 27, color: Colors.white),
                ),
              )),
          // Mail
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.mail,
                size: 200,
                color: Colors.grey.withOpacity(.5),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("メールでのお問い合わせ", style: TextStyle(fontSize: 18)),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildText())
                  ],
                ),
              ),
            ],
          ),
          // Phone
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.phone,
                size: 200,
                color: Colors.grey.withOpacity(.5),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("お電話でのお問い合わせ", style: TextStyle(fontSize: 18)),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildPhoneText())
                  ],
                ),
              ),
            ],
          ),

          //ボトム
          BottomAppBar(
            elevation: 30,
            color: Colors.cyan.withOpacity(.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "元昜システム株式会社",
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

  Widget buildText() {
    final text = 'mirokurokumi@gamil.com';

    return TextSelectionTheme(
      data: TextSelectionThemeData(
          // cursorColor: Colors.red,
          // selectionColor: Colors.orange,
          // selectionHandleColor: Colors.green,
          ),
      child: SelectableText(
        text,
        style: TextStyle(fontSize: 32),
        scrollPhysics: BouncingScrollPhysics(),
        toolbarOptions: ToolbarOptions(
          copy: true,
          paste: true,
          cut: true,
          selectAll: true,
        ),
        // maxLines: 10,
        showCursor: true,
        onSelectionChanged: (selection, cause) {},
      ),
    );
  }

  Widget buildPhoneText() {
    final text = '080-1932-0107';

    return TextSelectionTheme(
      data: TextSelectionThemeData(),
      child: SelectableText(
        text,
        style: TextStyle(fontSize: 32),
        scrollPhysics: BouncingScrollPhysics(),
        toolbarOptions: ToolbarOptions(
          copy: true,
          paste: true,
          cut: true,
          selectAll: true,
        ),
        showCursor: true,
        onSelectionChanged: (selection, cause) {},
      ),
    );
  }
}

Future launchWebSite() async {
  const url = "https://flutter-web-82849.web.app/#/";
  await launch(url);
}

Future launchApp1() async {
  const url =
      "https://play.google.com/store/apps/details?id=com.genyo.translate_voice_app";
  await launch(url);
}
