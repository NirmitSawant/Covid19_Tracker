import 'package:flutter/material.dart';

class Preventions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Common Preventions"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 10.0, 10.0, 10.0),
              child: Container(
                height: 140,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 160),
                      height: 120,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Wash hands regularly",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 21.0,
                              color: Colors.blueGrey[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 26.0, 5.0, 4.2),
                      child: Image.asset('images/Hand.gif'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 03),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 10.0, 10.0, 10.0),
              child: Container(
                height: 140,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 160),
                      height: 120,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Always use mask",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 21.0,
                              color: Colors.blueGrey[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 26.0, 6.0, 4.2),
                      child: Image.asset('images/mask.gif'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 03),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 10.0, 10.0, 10.0),
              child: Container(
                height: 140,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 160),
                      height: 120,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Social Distancing",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 21.0,
                              color: Colors.blueGrey[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 26.0, 6.0, 4.2),
                      child: Image.asset('images/social.gif'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 03),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 10.0, 10.0, 10.0),
              child: Container(
                height: 140,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 160),
                      height: 120,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Support Lockdowns",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 21.0,
                              color: Colors.blueGrey[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 26.0, 6.0, 4.2),
                      child: Image.asset('images/calender.gif'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
