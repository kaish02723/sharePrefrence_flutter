import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_prefrence_flutter/login_page.dart';
import 'package:share_prefrence_flutter/main.dart';
import 'package:share_prefrence_flutter/profile_page.dart';
import 'package:share_prefrence_flutter/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            if (email.isEmpty) {
             return LoginPage();
            } else {
            return ProfilePage();
            }
          },
        ));
      },
    );
    getEmail();
  }

  var email = "";

  getEmail() async {
    var shareP = await SharedPreferences.getInstance();
    email = shareP.getString("Email")!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    "assets/logo.png",
                    height: 100,
                    width: 100,
                  )),
              SizedBox(
                height: 120,
              ),
              Image.asset(
                'assets/logo1.png',
                height: 300,
              ),
              SizedBox(
                height: 230,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('Welcome To Edugaon',
                      speed: Duration(milliseconds: 80),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
