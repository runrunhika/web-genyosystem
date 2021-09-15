import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_genyosystem/utils/utils.dart';
import 'package:web_genyosystem/widget/on_hover_widget.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MobilAnimation extends StatefulWidget {
  const MobilAnimation({Key? key}) : super(key: key);

  @override
  _MobilAnimationState createState() => _MobilAnimationState();
}

class _MobilAnimationState extends State<MobilAnimation> {
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

  bool menuOpen = false;
  double tranx = 0, trany = 0, scale = 1.0;

  YoutubePlayerController _Ycontroller = YoutubePlayerController(
    initialVideoId: 'pGghKmmxaAw',
    params: YoutubePlayerParams(
      startAt: Duration(seconds: 0),
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  YoutubePlayerController _Ycontroller2 = YoutubePlayerController(
    initialVideoId: 'p2EowM8yjKg',
    params: YoutubePlayerParams(
      startAt: Duration(seconds: 0),
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final appStyle = TextStyle(
        color: Colors.blue, fontSize: 25, decoration: TextDecoration.underline);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      transform: Matrix4.translationValues(tranx, trany, 0)..scale(scale),
      decoration: BoxDecoration(
          color: Colors.teal[100],
          borderRadius: BorderRadius.circular(menuOpen ? 30 : 0),
          border: Border.all(color: Colors.white)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            !menuOpen
                ? Container(
                    height: 60,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.orangeAccent,
                      Colors.lightBlueAccent
                    ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
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
                        gradient: LinearGradient(colors: [
                      Colors.orangeAccent,
                      Colors.lightBlueAccent
                    ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
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
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Service',
                style: TextStyle(
                    fontFamily: 'BebasNeue', fontSize: 80, color: Colors.white),
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
                            text: "クッキングアプリ \n(iPhone用)", style: appStyle),
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
                              text: "クッキングアプリ \n(Android用)", style: appStyle)),
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
                // buildButton(),
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
                              text: "翻訳アプリ \n(iPhone用)", style: appStyle)),
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
                              text: "翻訳アプリ \n(Android用)", style: appStyle)),
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
                      return buildTranslateImage(serviceTranslateImage, index);
                    },
                  ),
                ),
                // buildButton2(),
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
                              text: "掲示板 \n(Android用)", style: appStyle)),
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
                // buildButton3(),
              ],
            ),

            buildIndicator3(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                color: Colors.purple,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey.withOpacity(.3)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('''実績''', style: (TextStyle(fontSize: 35))),
                ),
              ),
            ),

            Text('''Youtube広告をブロックするシステム''', style: (TextStyle(fontSize: 20))),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 200,
                child: YoutubePlayerControllerProvider(
                  controller: _Ycontroller,
                  child: YoutubePlayerIFrame(
                    aspectRatio: 16 / 9,
                  ),
                ),
              ),
            ),

            Text('''3DFPSゲーム''', style: (TextStyle(fontSize: 20))),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 200,
                child: YoutubePlayerControllerProvider(
                  controller: _Ycontroller2,
                  child: YoutubePlayerIFrame(
                    aspectRatio: 16 / 9,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),
          ],
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
