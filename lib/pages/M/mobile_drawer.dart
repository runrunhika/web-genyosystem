import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contact_page.dart';
import 'mobile_pp.dart';

class MobilDrawer extends StatefulWidget {
  const MobilDrawer({Key? key}) : super(key: key);

  @override
  _MobilDrawerState createState() => _MobilDrawerState();
}

class _MobilDrawerState extends State<MobilDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orangeAccent, Colors.lightBlueAccent],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft)),
            child: ListTile(
              title: Text("お問い合わせサイト",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                  textAlign: TextAlign.center),
            ),
          ),
          ListTile(
            title: Text(
              "Contact",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(Icons.meeting_room, color: Colors.white),
            onTap: () {
              Get.to(ContactPage());
            },
          ),
          Divider(color: Colors.white),
          ListTile(
            title: Text(
              "PrivacyPolicy",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(Icons.privacy_tip, color: Colors.white),
            onTap: () {
              Get.to(MobilPPScreen());
            },
          ),
        ],
      ),
    );
  }
}
