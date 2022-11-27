import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample extends StatelessWidget {
  const LineChartSample({
    super.key,
    this.gradientColors = const [
      Color(0xff23b6e6),
      Color(0xff02d39a),
    ],
    required this.keys,
    required this.values,
    this.left = false,
    this.bottom = true,
    this.maxValue = 100,
    this.barWidth = 3,
  });

  final List<Color> gradientColors;
  final List<String> keys;
  final List<double> values;
  final bool left;
  final bool bottom;
  final double maxValue;
  final double barWidth;

  @override
  Widget build(BuildContext context) {
    Widget bottomTitleWidgets(double value, TitleMeta meta) {
      var style = Theme.of(context).textTheme.subtitle1;
      Widget text = Text(keys[value.toInt()], style: style);

      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: text,
      );
    }

    Widget leftTitleWidgets(double value, TitleMeta meta) {
      String text = value.toString();

      return Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.left,
      );
    }

    LineChartData mainData() {
      final List<FlSpot> data = [];
      double index = 0;

      for (var value in values) {
        data.add(FlSpot(index, value));
        index += 1;
      }

      return LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 1,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Theme.of(context).colorScheme.background,
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: bottom,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: bottomTitleWidgets,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: left,
              interval: 1,
              getTitlesWidget: leftTitleWidgets,
              reservedSize: 42,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d)),
        ),
        minX: 0,
        maxX: (values.length - 1).toDouble(),
        minY: 0,
        maxY: maxValue,
        lineBarsData: [
          LineChartBarData(
            spots: data,
            isCurved: true,
            gradient: LinearGradient(
              colors: gradientColors,
            ),
            barWidth: barWidth,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
          ),
        ],
      );
    }

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        padding: EdgeInsets.only(
          left: constraints.maxWidth * 0.033,
          right: constraints.maxWidth * 0.033,
          top: constraints.maxHeight * 0.069,
          bottom: constraints.maxHeight * 0.069,
        ),
        child: LineChart(
          mainData(),
        ),
      );
    });
  }
}
