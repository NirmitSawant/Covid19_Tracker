import 'package:covidtracker/datasource.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQs"),
      ),
      body: ListView.builder(
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: ExpansionTile(
                  title: Text(
                    DataSource.questionAnswers[index]['question'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    Text(DataSource.questionAnswers[index]['answer'])
                  ],
                ),
              ),
            );
          }),
    );
  }
}
