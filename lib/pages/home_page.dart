import 'package:flutter/material.dart';
import 'package:web_genyosystem/pages/pp/pp_page.dart';
import 'package:web_genyosystem/pages/pp/web_pp.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('お問い合わせサイト'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Divider(),
            ListTile(
              title: Text("PrivacyPolicy"),
              trailing: Icon(Icons.privacy_tip),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => PPPage()));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
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
                child: Column(
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
        ],
      ),
    );
  }

  Widget buildText() {
    final text = 'genyosys2020@gamil.com';

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
}
