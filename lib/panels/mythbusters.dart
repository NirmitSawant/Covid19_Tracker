import 'package:covidtracker/datasource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MythBusters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("MythBusters"),
        backgroundColor: primaryBlack,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Image.asset('images/mb1.PNG'),
              Image.asset('images/mb2.PNG'),
              Image.asset('images/mb3.PNG'),
            ],
          ),
        ),
      ),
    );
  }
}
