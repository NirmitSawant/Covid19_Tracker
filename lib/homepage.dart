import 'dart:convert';

import 'package:covidtracker/creator.dart';
import 'package:covidtracker/datasource.dart';
import 'package:covidtracker/pages/countrypage.dart';
import 'package:covidtracker/pages/faqs.dart';
import 'package:covidtracker/panels/pie_chart.dart';
import 'package:covidtracker/pages/preventions.dart';
import 'package:covidtracker/panels/fourpanel.dart';
import 'package:covidtracker/panels/mythbusters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'panels/topfivepanel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldWideData();
    fetchCountryData();
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('COVID-19 TRACKER'),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new DrawerHeader(
              child: Center(
                child: Text(
                  "COVID-19 Tracker",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: primaryBlack,
                image: DecorationImage(
                  image: AssetImage("images/covid.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/world");
              },
              selected: true,
              leading: Icon(Icons.blur_circular_rounded),
              title: new Text(
                'World',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new Divider(),
            ListTile(
              selected: true,
              leading: Icon(Icons.flag_rounded),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/india");
              },
              title: new Text(
                'India',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new Divider(),
            ListTile(
              selected: true,
              leading: Icon(Icons.question_answer),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FAQPage()));
              },
              title: new Text(
                'FAQs',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new Divider(),
            ListTile(
              selected: true,
              leading: Icon(Icons.all_inclusive_rounded),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MythBusters()));
              },
              title: new Text(
                'MythBusters',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            ListTile(
              selected: true,
              leading: Icon(Icons.add_moderator),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Preventions()));
              },
              title: new Text(
                'Preventions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: primaryBlack,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Creator()));
                    },
                    selected: true,
                    leading: Icon(
                      Icons.supervised_user_circle_rounded,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Creator",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange[100],
                  ),
                  child: Text(
                    DataSource.quote,
                    style: TextStyle(
                      color: Colors.orange[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Worldwide",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CountryPage()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryBlack,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Countries",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              worldData == null
                  ? Center(child: CircularProgressIndicator())
                  : FourPanel(
                      fourData: worldData,
                    ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                child: Text(
                  "WorldWide Graph",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              worldData == null
                  ? Center(child: CircularProgressIndicator())
                  : Piechart(
                      pieData: worldData,
                    ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Text(
                  "Most Affected Countries",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              countryData == null
                  ? Center(child: CircularProgressIndicator())
                  : TopFivePanel(
                      fiveData: countryData,
                    ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  launch('https://www.pmcares.gov.in/en/');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  color: primaryBlack,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "DONATE TO PM CARES",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  "GO CORONA. CORONA GO!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
