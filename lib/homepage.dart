import 'dart:convert';

import 'package:covidtracker/datasource.dart';
import 'package:covidtracker/pages/countrypage.dart';
import 'package:covidtracker/panels/infopanel.dart';
import 'package:covidtracker/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'panels/mostaffectedcountry.dart';

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
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                color: Colors.orange[100],
                child: Text(
                  DataSource.quote,
                  style: TextStyle(
                    color: Colors.orange[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
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
                        fontSize: 22,
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
                          "Regional",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              worldData == null
                  ? CircularProgressIndicator()
                  : WorldWidePanel(
                      worldData: worldData,
                    ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Text(
                  "Most Affected Countries",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              countryData == null
                  ? Container()
                  : MostAffectedPanel(
                      countryData: countryData,
                    ),
              SizedBox(
                height: 20.0,
              ),
              InfoPanel(),
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
