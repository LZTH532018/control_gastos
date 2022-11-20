import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PrincipalChart extends StatelessWidget {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  Widget build(BuildContext context) {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    return Center(
      child: SfCircularChart(
        palette: <Color>[Colors.green, Colors.deepPurple],
        legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          PieSeries<GDPData, String>(
            dataSource: _chartData,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.gdp,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
          )
        ],
      ),
    );
  }

  List<GDPData> getChartData() {
    final int remaining = 3200 - 2720;
    final List<GDPData> charData = [
      GDPData('Gastos', 2720),
      GDPData('Sobrante', remaining),
    ];
    return charData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
