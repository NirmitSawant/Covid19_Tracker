import 'dart:convert';

import 'package:covidtracker/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: Search(countryData));
              },
            )
          ],
          title: Text(
            "Country Stats",
          ),
        ),
        body: countryData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      width: 200,
                      height: 130,
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  countryData[index]['country'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Image.network(
                                  countryData[index]['countryInfo']['flag'],
                                  height: 70.0,
                                  width: 50.0,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "CONFIRMED: " +
                                        countryData[index]['cases'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    'ACTIVE: ' +
                                        countryData[index]['active'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    'RECOVERED: ' +
                                        countryData[index]['recovered']
                                            .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    'DEATHS: ' +
                                        countryData[index]['deaths'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[900],
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: countryData == null ? 0 : countryData.length,
              ));
  }
}
