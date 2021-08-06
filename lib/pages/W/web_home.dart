import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:marquee/marquee.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_genyosystem/utils/utils.dart';
import 'package:web_genyosystem/widget/on_hover_image.dart';
import 'package:web_genyosystem/widget/on_hover_widget.dart';
import 'package:http/http.dart' as http;

import '../contact_page.dart';

class WebHomeScreen extends StatefulWidget {
  @override
  _WebHomeScreenState createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  final controller = CarouselController();
  int activeIndex = 0;
  final cookImages = [
    'assets/c1.png',
    'assets/c2.png',
    'assets/c3.png',
    'assets/c4.png',
    'assets/c5.png',
    'assets/c6.png',
  ];

  final controller2 = CarouselController();
  int activeIndex2 = 0;
  final translateImages = [
    'assets/t1.png',
    'assets/t2.png',
    'assets/t3.png',
  ];

  final controller3 = CarouselController();
  int activeIndex3 = 0;
  final kImages = [
    'assets/k1.png',
    'assets/k2.png',
    'assets/k3.png',
  ];

  final itemKey = GlobalKey();
  final itemKey4 = GlobalKey();
  final itemKey5 = GlobalKey();
  Future scrollToItem() async {
    final context = itemKey.currentContext;

    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: Duration(seconds: 1));
  }

  Future scrollToItem4() async {
    final context2 = itemKey4.currentContext;

    await Scrollable.ensureVisible(context2!,
        alignment: 0, duration: Duration(seconds: 2));
  }

  Future scrollToItem5() async {
    final context2 = itemKey5.currentContext;

    await Scrollable.ensureVisible(context2!,
        alignment: 0, duration: Duration(seconds: 2));
  }

  //Contact
  late final nameCont = TextEditingController();
  late final emailCont = TextEditingController();
  final subjectCont = TextEditingController();
  final messageCont = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final namefocus = FocusNode();
  final agefocus = FocusNode();

  _showSnackBar() {
    Get.snackbar('送信完了', '返信お待ちください',
        backgroundColor: Colors.white,
        duration: Duration(seconds: 5),
        snackPosition: SnackPosition.TOP);
  }

  @override
  Widget build(BuildContext context) {
    final appStyle = TextStyle(
        color: Colors.blue, fontSize: 35, decoration: TextDecoration.underline);
    final style = TextStyle(decoration: TextDecoration.underline, fontSize: 35);
    final stylePP = TextStyle(fontSize: 20);

    return Scaffold(
      floatingActionButton: FabCircularMenu(
        fabSize: 90,
        fabOpenIcon: Icon(
          Icons.open_in_browser,
          color: Colors.white,
          size: 70,
        ),
        fabCloseIcon: Icon(
          Icons.close,
          size: 70,
          color: Colors.white,
        ),
        fabOpenColor: Colors.yellow,
        fabCloseColor: Colors.lightBlue,
        ringColor: Colors.yellowAccent,
        alignment: Alignment.bottomCenter,
        animationDuration: Duration(seconds: 1),
        children: [
          TextButton.icon(
              icon: Icon(Icons.production_quantity_limits),
              onPressed: scrollToItem,
              label: Text(
                'Service',
                style: TextStyle(fontFamily: 'BebasNeue', fontSize: 25),
              )),
          TextButton.icon(
              icon: Icon(Icons.contact_mail),
              onPressed: scrollToItem4,
              label: Text(
                'Contact',
                style: TextStyle(fontFamily: 'BebasNeue', fontSize: 25),
              )),
          TextButton.icon(
              icon: Icon(Icons.privacy_tip),
              onPressed: scrollToItem5,
              label: Text(
                'Privacy Policy',
                style: TextStyle(fontFamily: 'BebasNeue', fontSize: 25),
              )),
        ],
      ),
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Service
              Container(
                key: itemKey,
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  'Service',
                  style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 80,
                      color: Colors.white),
                ),
              ),

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
                            'assets/cookLogo.png',
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
                              text: "クッキングアプリ (iPhone用)", style: appStyle),
                        )
                      ],
                    ),
                    onPressed: _cookAppleAppURL,
                  ),
                ),
              ),

              //クッキングアプリ android
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
                            'assets/cookLogo.png',
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
                                text: "クッキングアプリ (Android用)", style: appStyle)),
                      ],
                    ),
                    onPressed: _cookAppURL,
                  ),
                ),
              ),

              //画像
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    child: CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: cookImages.length,
                      options: CarouselOptions(
                          height: 600,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          autoPlay: true,
                          reverse: false,
                          autoPlayAnimationDuration: Duration(seconds: 2),
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex = index;
                            });
                          }),
                      itemBuilder: (ctx, index, realIndex) {
                        final serviceCookImage = cookImages[index];
                        return buildCookImage(serviceCookImage, index);
                      },
                    ),
                  ),
                  buildButton(),
                ],
              ),

              buildIndicator(),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Divider(
                  color: Colors.purple,
                ),
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
                                text: "翻訳アプリ (iPhone用)", style: appStyle)),
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
                                text: "翻訳アプリ (Android用)", style: appStyle)),
                      ],
                    ),
                    onPressed: _translateAppURL,
                  ),
                ),
              ),

              //画像
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    child: CarouselSlider.builder(
                      carouselController: controller2,
                      itemCount: translateImages.length,
                      options: CarouselOptions(
                          height: 600,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          reverse: false,
                          autoPlayInterval: Duration(seconds: 2),
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex2 = index;
                            });
                          }),
                      itemBuilder: (ctx, index, realIndex) {
                        final serviceTranslateImage = translateImages[index];
                        return buildTranslateImage(
                            serviceTranslateImage, index);
                      },
                    ),
                  ),
                  buildButton2(),
                ],
              ),

              buildIndicator2(),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Divider(
                  color: Colors.purple,
                ),
              ),

              // 掲示板　App
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40, top: 20),
                child: OnHoverWidget(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.yellow, width: 4),
                        shape: StadiumBorder(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: Image.asset(
                            'assets/kLogo.png',
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
                                text: "掲示板 (Android用)", style: appStyle)),
                      ],
                    ),
                    onPressed: _chatAppURL,
                  ),
                ),
              ),

              //画像
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    child: CarouselSlider.builder(
                      carouselController: controller3,
                      itemCount: kImages.length,
                      options: CarouselOptions(
                          height: 600,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          // autoPlay: true,
                          reverse: false,
                          // autoPlayAnimationDuration: Duration(seconds: 2),
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex3 = index;
                            });
                          }),
                      itemBuilder: (ctx, index, realIndex) {
                        final kImage = kImages[index];
                        return buildkImage(kImage, index);
                      },
                    ),
                  ),
                  buildButton3(),
                ],
              ),

              buildIndicator3(),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Divider(
                  color: Colors.purple,
                ),
              ),

              const SizedBox(
                height: 70,
              ),

              //contact
              Container(
                key: itemKey4,
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  'Contact',
                  style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 80,
                      color: Colors.white),
                ),
              ),

              // Mail
              buildTextField(
                  title: 'お名前',
                  controller: nameCont,
                  icon: Icon(Icons.person),
                  hint: '山田太郎　または　会社名'),
              emailTextField(
                  title: 'メールアドレス',
                  controller: emailCont,
                  icon: Icon(Icons.mail),
                  hint: 'example@mail.com'),
              buildTextField(
                  title: '件名',
                  controller: subjectCont,
                  icon: Icon(Icons.subject),
                  hint: '〇〇の依頼'),
              contentTextField(
                  title: '内容',
                  controller: messageCont,
                  icon: Icon(Icons.edit),
                  hint: ''),

              // Send Button
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          sendEmail(
                              name: nameCont.text,
                              email: emailCont.text,
                              subject: subjectCont.text,
                              message: messageCont.text);
                        });
                        _showSnackBar();
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                              colors: [Colors.lightBlue, Colors.white]),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue.withOpacity(.6),
                                spreadRadius: 1,
                                blurRadius: 16,
                                offset: Offset(8, 8))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("送信する",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25)),
                        ],
                      ),
                    ),
                  )),

              const SizedBox(
                height: 70,
              ),

              //プライバシーポリシーについて
              Container(
                key: itemKey5,
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 80,
                      color: Colors.white),
                ),
              ),

              //全文
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 20, top: 20),
                    child: Text(
                        "当アプリは、お客様の個人情報は、当アプリの信頼のもとお客様が自らの意志により特定の目的での利用のために当アプリに預託されたものであり、この個人情報を安全に保管し、お客様の意志を尊重して利用することが、当アプリに課せられた最大の課題であると認識しております。\n当アプリは、個人情報に関する法令を遵守し、個人情報の適切な取り扱いを実現致します。",
                        style: stylePP),
                  ),

                  //小見出し
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_police_outlined,
                          color: Colors.blue,
                        ),
                        Text(
                          "個人情報の取得について",
                          style: style,
                        ),
                      ],
                    ),
                  ),
                  //本文
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20, top: 5),
                    child: Text(
                      "当アプリは、偽りその他不正の手段によらず適正に個人情報を取得致します。",
                      style: stylePP,
                    ),
                  ),
                  //見出し
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_police_outlined,
                          color: Colors.blue,
                        ),
                        Text(
                          "個人情報の利用について",
                          style: style,
                        ),
                      ],
                    ),
                  ),
                  //本文
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20, top: 5),
                    child: Text(
                        "当アプリは、利用目的を出来る限り限定した上で、あらかじめご本人の同意を得た場合、および法令により例外と認められた場合を除き、明示または公表した利用目的の範囲内でのみ個人情報を取り扱います。",
                        style: stylePP),
                  ),
                  //見出し
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_police_outlined,
                          color: Colors.blue,
                        ),
                        Text(
                          "個人情報の安全管理について",
                          style: style,
                        ),
                      ],
                    ),
                  ),
                  //本文
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20, top: 5),
                    child: Text(
                        "当アプリは、取り扱う個人情報の漏洩、滅失またはき損の防止その他の個人情報の安全管理のために必要かつ適切な措置を講じます。",
                        style: stylePP),
                  ),
                  //見出し
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_police_outlined,
                          color: Colors.blue,
                        ),
                        Text(
                          "個人情報の委託について",
                          style: style,
                        ),
                      ],
                    ),
                  ),
                  //本文
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20, top: 5),
                    child: Text(
                        "当アプリは、個人情報の取り扱いの全部または一部を第三者に委託する場合は、当該第三者について厳正な調査を行い、取り扱いを委託された個人情報の安全管理が図られるよう当該第三者に対する必要かつ適切な監督を行います。",
                        style: stylePP),
                  ),
                  //見出し
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_police_outlined,
                          color: Colors.blue,
                        ),
                        Text(
                          "個人情報の第三者提供について",
                          style: style,
                        ),
                      ],
                    ),
                  ),
                  //本文
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20, top: 5),
                    child: Text(
                        "当アプリは、個人情報保護法等の法令に定めのある場合を除き、個人情報をあらかじめご本人の同意を得ることなく、第三者に提供致しません。",
                        style: stylePP),
                  ),
                  //見出し
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_police_outlined,
                          color: Colors.blue,
                        ),
                        Text(
                          "個人情報の開示・訂正などについて",
                          style: style,
                        ),
                      ],
                    ),
                  ),
                  //本文
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20, top: 5),
                    child: Text(
                        "当アプリは、ご本人から自己の個人情報についての開示の請求がある場合、速やかに開示を致します。\nその際、ご本人であることが確認できない場合には、開示に応じません。\n個人情報の内容に誤りがあり、ご本人から訂正・追加・削除の請求がある場合、調査の上、速やかにこれらの請求に対応致します。\nその際、ご本人であることが確認できない場合には、これらの請求に応じません。",
                        style: stylePP),
                  ),
                  //見出し
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_police_outlined,
                          color: Colors.blue,
                        ),
                        Text(
                          "スマートフォン用アプリケーションに\nおけるポリシーについて",
                          style: style,
                        ),
                      ],
                    ),
                  ),
                  //本文
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20, top: 5),
                    child: Text(
                        "当アプリは、提供するスマートフォン用アプリケーションを通じてユーザーの個人情報（氏名、電話番号、写真データ、音声データ、顔の特徴等）を取得することはありません。\nまた、ユーザーの写真またはカメラ機能を使用する当アプリケーションは、ユーザーのスマートフォン端末内でのみ写真データの処理を行います。当アプリケーションが、当アプリを含む第三者に対して、当該写真データを送信することはありません。",
                        style: stylePP),
                  ),
                  //見出し
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_police_outlined,
                          color: Colors.blue,
                        ),
                        Text(
                          "組織・体制",
                          style: style,
                        ),
                      ],
                    ),
                  ),
                  //本文
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20, top: 5),
                    child: Text(
                        "当アプリは、内部規定の整備、従業員教育および適正な監査の実施等を通じて、本ポリシーの見直しを含めた社内体制の継続的強化・改善に努めます。",
                        style: stylePP),
                  ),
                  //見出し
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_police_outlined,
                          color: Colors.blue,
                        ),
                        Text(
                          "方針の変更",
                          style: style,
                        ),
                      ],
                    ),
                  ),
                  //本文
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20, top: 5),
                    child: Text(
                        "本方針の内容は変更されることがあります。\n変更後の本方針については、当アプリが別途定める場合を除いて、当サイトに掲載した時から効力を生じるものとします。",
                        style: stylePP),
                  ),
                  //制定日
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 20, top: 35, bottom: 15),
                    child: Text(
                      "制定日：2021年3月10日",
                      style: TextStyle(color: Colors.black.withOpacity(.5)),
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
        ),
      ),
    );
  }

  Widget buildCookImage(String cookImage, int index) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
              Colors.lightBlueAccent,
              Colors.greenAccent,
              Colors.tealAccent
            ])),
        width: double.infinity,
        child: Image.asset(
          cookImage,
          fit: BoxFit.contain,
        ));
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: cookImages.length,
      onDotClicked: animateToSlide,
      duration: Duration(seconds: 1),
      effect: ExpandingDotsEffect(
          activeDotColor: Colors.red,
          dotColor: Colors.black12,
          dotWidth: 20,
          dotHeight: 20),
    );
  }

  Widget buildButton() => Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.deepOrangeAccent,
                        Colors.pinkAccent,
                        Colors.yellowAccent
                      ])),
              child: IconButton(
                  onPressed: previous,
                  icon: Icon(
                    Icons.arrow_back,
                    size: 60,
                    color: Colors.white,
                  )),
            ),
            Spacer(),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.deepOrangeAccent,
                        Colors.pinkAccent,
                        Colors.yellowAccent
                      ])),
              child: IconButton(
                  onPressed: next,
                  icon:
                      Icon(Icons.arrow_forward, size: 60, color: Colors.white)),
            )
          ],
        ),
      );

  Widget buildTranslateImage(String translateImage, int index) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
              Colors.lightBlueAccent,
              Colors.greenAccent,
              Colors.tealAccent
            ])),
        width: double.infinity,
        child: Image.asset(
          translateImage,
          fit: BoxFit.contain,
        ));
  }

  Widget buildIndicator2() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex2,
      count: translateImages.length,
      onDotClicked: animateToSlide2,
      duration: Duration(seconds: 1),
      effect: ExpandingDotsEffect(
          activeDotColor: Colors.red,
          dotColor: Colors.black12,
          dotWidth: 20,
          dotHeight: 20),
    );
  }

  Widget buildButton2() => Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.deepOrangeAccent,
                        Colors.pinkAccent,
                        Colors.yellowAccent
                      ])),
              child: IconButton(
                  onPressed: previous2,
                  icon: Icon(
                    Icons.arrow_back,
                    size: 60,
                    color: Colors.white,
                  )),
            ),
            Spacer(),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.deepOrangeAccent,
                        Colors.pinkAccent,
                        Colors.yellowAccent
                      ])),
              child: IconButton(
                  onPressed: next2,
                  icon:
                      Icon(Icons.arrow_forward, size: 60, color: Colors.white)),
            )
          ],
        ),
      );

  Widget buildkImage(String kImage, int index) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
              Colors.lightBlueAccent,
              Colors.greenAccent,
              Colors.tealAccent
            ])),
        width: double.infinity,
        child: Image.asset(
          kImage,
          fit: BoxFit.contain,
        ));
  }

  Widget buildIndicator3() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex3,
      count: kImages.length,
      onDotClicked: animateToSlide3,
      duration: Duration(seconds: 1),
      effect: ExpandingDotsEffect(
          activeDotColor: Colors.red,
          dotColor: Colors.black12,
          dotWidth: 20,
          dotHeight: 20),
    );
  }

  Widget buildButton3() => Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.deepOrangeAccent,
                        Colors.pinkAccent,
                        Colors.yellowAccent
                      ])),
              child: IconButton(
                  onPressed: previous3,
                  icon: Icon(
                    Icons.arrow_back,
                    size: 60,
                    color: Colors.white,
                  )),
            ),
            Spacer(),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.deepOrangeAccent,
                        Colors.pinkAccent,
                        Colors.yellowAccent
                      ])),
              child: IconButton(
                  onPressed: next3,
                  icon:
                      Icon(Icons.arrow_forward, size: 60, color: Colors.white)),
            )
          ],
        ),
      );

  void animateToSlide(int index) => controller.animateToPage(index);

  void next() => controller.nextPage(duration: Duration(seconds: 1));

  void previous() => controller.previousPage(duration: Duration(seconds: 1));

  void animateToSlide2(int index) => controller2.animateToPage(index);

  void next2() => controller2.nextPage(duration: Duration(seconds: 1));

  void previous2() => controller2.previousPage(duration: Duration(seconds: 1));

  void animateToSlide3(int index) => controller3.animateToPage(index);

  void next3() => controller3.nextPage(duration: Duration(seconds: 1));

  void previous3() => controller3.previousPage(duration: Duration(seconds: 1));

  Future sendEmail(
      {required String name,
      required String email,
      required String subject,
      required String message}) async {
    final serviceId = 'service_1cwqwpt';
    final tempateId = 'template_1i08wn1';
    final userId = 'user_QJq7e6a5biy5mQMKpkqSs';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': tempateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'to_email': 'mirokurokumi@gmail.com',
            'user_subject': subject,
            'user_message': message
          }
        }));
    print(response.body);
  }

  Widget buildTextField(
          {required String title,
          required String hint,
          required Icon icon,
          required TextEditingController controller,
          int maxLines = 1}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(text: "必須   ", style: TextStyle(color: Colors.red)),
              TextSpan(
                  text: title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28)),
            ])),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return '入力してください';
                }
              },
              decoration: InputDecoration(
                  prefixIcon: icon,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.grey)),
              textInputAction: TextInputAction.done,
              controller: controller,
              enabled: true,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ],
        ),
      );

  Widget emailTextField(
          {required String title,
          required String hint,
          required Icon icon,
          required TextEditingController controller,
          int maxLines = 1}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(text: "必須   ", style: TextStyle(color: Colors.red)),
              TextSpan(
                  text: title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28)),
            ])),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  hintText: 'example@mail.com',
                  hintStyle: TextStyle(color: Colors.grey)),
              validator: (value) {
                final pattern =
                    r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                final regExp = RegExp(pattern);

                if (value!.isEmpty) {
                  return '入力してください';
                } else if (!regExp.hasMatch(value)) {
                  return '無効なメールアドレスです';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
            )
          ],
        ),
      );

  Widget contentTextField(
          {required String title,
          required String hint,
          required Icon icon,
          required TextEditingController controller,
          int maxLines = 5}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(text: "必須   ", style: TextStyle(color: Colors.red)),
              TextSpan(
                  text: title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28)),
            ])),
            TextFormField(
              controller: controller,
              maxLines: maxLines,
              validator: (value) {
                if (value!.isEmpty) {
                  return '入力してください';
                }
              },
              decoration: InputDecoration(
                prefixIcon: icon,
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      );

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

  void _chatAppURL() async => await canLaunch(chatApp)
      ? await launch(chatApp)
      : throw 'Could not launch $chatApp';
}
