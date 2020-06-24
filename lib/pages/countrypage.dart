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
                        child: Column(
                          children: <Widget>[
                            Text(
                              countryData[index]['country'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Image.network(
                                    countryData[index]['countryInfo']['flag'],
                                    height: 50.0,
                                    width: 60.0,
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "CONFIRMED: " +
                                            countryData[index]['cases']
                                                .toString()
                                                .replaceAllMapped(
                                                    new RegExp(
                                                        r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                    (Match m) => '${m[1]},'),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                      Text(
                                        'ACTIVE: ' +
                                            countryData[index]['active']
                                                .toString()
                                                .replaceAllMapped(
                                                    new RegExp(
                                                        r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                    (Match m) => '${m[1]},'),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue),
                                      ),
                                      Text(
                                        'RECOVERED: ' +
                                            countryData[index]['recovered']
                                                .toString()
                                                .replaceAllMapped(
                                                new RegExp(
                                                    r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                    (Match m) => '${m[1]},'),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green),
                                      ),
                                      Text(
                                        'DEATHS: ' +
                                            countryData[index]['deaths']
                                                .toString()
                                                .replaceAllMapped(
                                                new RegExp(
                                                    r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                    (Match m) => '${m[1]},'),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[900]),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        )),
                  );
                },
                itemCount: countryData == null ? 0 : countryData.length,
              ));
  }
}
