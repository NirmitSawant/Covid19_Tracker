import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: <Widget>[
                Image.network(
                  countryData[index]['countryInfo']['flag'],
                  height: 30.0,
                  width: 60.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  countryData[index]['country'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Confirmed Cases: ' + countryData[index]['cases'].toString(),
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
