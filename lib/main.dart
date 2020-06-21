import 'package:covidtracker/datasource.dart';
import 'package:covidtracker/homepage.dart';
import 'package:covidtracker/india/indiahomepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Montserrat',
      primaryColor: primaryBlack,
    ),
    home: HomePage(),
    routes: {
      "/india": (_) => new IndiaHomePage(),
      "/world": (_) => new HomePage(),
    },
  ));
}
