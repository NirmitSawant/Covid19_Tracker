import 'package:covidtracker/datasource.dart';
import 'package:covidtracker/homepage.dart';
import 'package:covidtracker/india/indiahomepage.dart';
import 'package:covidtracker/pages/faqs.dart';
import 'package:covidtracker/panels/mythbusters.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Montserrat',
      primaryColor: primaryBlack,
    ),
    home: Splash(),
    routes: {
      "/india": (_) => new IndiaHomePage(),
      "/world": (_) => new HomePage(),
      "/faqs": (_) => new FAQPage(),
      "/myths": (_) => new MythBusters(),
    },
  ));
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.white,
      image: Image.asset("images/covid.png"),
      photoSize: 100,
      loaderColor: Colors.black,
      navigateAfterSeconds: HomePage(),
    );
  }
}
