import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List countryList;

  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Container(
                width: 200,
                height: 130,
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                            suggestionList[index]['country'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Image.network(
                            suggestionList[index]['countryInfo']['flag'],
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
                                  suggestionList[index]['cases'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 18),
                            ),
                            Text(
                              'ACTIVE: ' +
                                  suggestionList[index]['active'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 18),
                            ),
                            Text(
                              'RECOVERED: ' +
                                  suggestionList[index]['recovered'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 18),
                            ),
                            Text(
                              'DEATHS: ' +
                                  suggestionList[index]['deaths'].toString(),
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
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              width: 200,
              height: 130,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                          suggestionList[index]['country'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Image.network(
                          suggestionList[index]['countryInfo']['flag'],
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
                                suggestionList[index]['cases'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 18),
                          ),
                          Text(
                            'ACTIVE: ' +
                                suggestionList[index]['active'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 18),
                          ),
                          Text(
                            'RECOVERED: ' +
                                suggestionList[index]['recovered'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 18),
                          ),
                          Text(
                            'DEATHS: ' +
                                suggestionList[index]['deaths'].toString(),
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
        });
  }
}
