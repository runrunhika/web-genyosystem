import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ContactPage extends StatefulWidget {
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
            title: Text("元昜システム株式会社"),
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
          child: ListView(
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
                          Text(
                            "送信する",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      );

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
                      fontSize: 18)),
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
                      fontSize: 18)),
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
                      fontSize: 18)),
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
}
