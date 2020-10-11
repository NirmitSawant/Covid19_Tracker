import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';

class Piechart extends StatelessWidget {
  final Map pieData;

  const Piechart({Key key, this.pieData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cases = pieData['cases'];
    var active = pieData['active'];
    var recovered = pieData['recovered'];
    var deaths = pieData['deaths'];

    dynamic total = cases + active + recovered + deaths;
    dynamic percent = total / 100;
    dynamic cp = cases / percent;
    var cp1 = double.parse(cp.toStringAsFixed(2));
    dynamic ap = active / percent;
    var ap1 = double.parse(ap.toStringAsFixed(2));
    dynamic rp = recovered / percent;
    var rp1 = double.parse(rp.toStringAsFixed(2));
    dynamic dp = deaths / percent;
    var dp1 = double.parse(dp.toStringAsFixed(2));

    return Column(
      children: [
        PieChart(
          values: [cp1, ap1, rp1, dp1],
          labels: [
            "Confirmed \n$cases",
            "Active \n$active",
            "Recovered \n$recovered",
            "Deaths \n$deaths",
          ],
          sliceFillColors: [
            Colors.redAccent,
            Colors.blueAccent,
            Colors.greenAccent,
            Colors.grey,
          ],
          animationDuration: Duration(milliseconds: 1500),
          legendPosition: LegendPosition.Left,
        ),
      ],
    );
  }
}
