import 'dart:convert';

import 'package:covidtracker/datasource.dart';
import 'package:covidtracker/india/statespage.dart';
import 'package:covidtracker/india/topfivestates.dart';
import 'package:covidtracker/panels/fourpanel.dart';
import 'package:covidtracker/panels/infopanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IndiaHomePage extends StatefulWidget {
  @override
  _IndiaHomePageState createState() => _IndiaHomePageState();
}

class _IndiaHomePageState extends State<IndiaHomePage> {
  Map indiaData;
  fetchIndiaData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries/india');
    setState(() {
      indiaData = json.decode(response.body);
    });
  }

  Map stateData;
  fetchStateData() async {
    http.Response response =
        await http.get('https://api.covid19india.org/data.json');
    setState(() {
      stateData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchIndiaData();
    fetchStateData();
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
        title: Text(
          'COVID-19 TRACKER',
        ),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("COVID-19 Tracker"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/world");
              },
              child: ListTile(
                title: new Text(
                  'World',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            new Divider(),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/india");
              },
              child: ListTile(
                title: new Text(
                  'India',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
              Container(
                height: 100,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                color: Colors.orange[100],
                child: Text(
                  DataSource.quoteindia,
                  style: TextStyle(
                    color: Colors.orange[900],
                    fontWeight: FontWeight.bold,
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
                      "Nationwide",
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
                                builder: (context) => StatesPage()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryBlack,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "States",
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
              indiaData == null
                  ? Center(child: CircularProgressIndicator())
                  : FourPanel(
                      fourData: indiaData,
                    ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Text(
                  "Most Affected States",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              stateData == null
                  ? Center(child: CircularProgressIndicator())
                  : TopFiveStates(
                      fiveStates: stateData,
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
