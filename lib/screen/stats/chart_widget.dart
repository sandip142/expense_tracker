import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(mainChartData());
  }

  BarChartGroupData makeGroupdata(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
            toY: y,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary
              ],
              transform: const GradientRotation(pi / 40),
            ),
            width: 10,
            backDrawRodData: BackgroundBarChartRodData(
                show: true, toY: 5, color: Colors.grey.shade300)),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(8, (i) {
        switch (i) {
          case 0:
            return makeGroupdata(0, 2);
          case 1:
            return makeGroupdata(1, 2);
          case 2:
            return makeGroupdata(2, 4);
          case 3:
            return makeGroupdata(3, 2.3);
          case 4:
            return makeGroupdata(4, 2);
          case 5:
            return makeGroupdata(5, 4);
          case 6:
            return makeGroupdata(6, 1);
          case 7:
            return makeGroupdata(7, 3);
          default:
            return throw Error();
        }
      });

  BarChartData mainChartData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: getTiles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true, getTitlesWidget: leftTitle),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      gridData: const FlGridData(show: false),
      barGroups: showingGroups(),
    );
  }

  Widget getTiles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = const Text('01', style: style);
        break;
      case 1:
        text = const Text('02', style: style);
        break;
      case 2:
        text = const Text('03', style: style);
        break;
      case 3:
        text = const Text('04', style: style);
        break;
      case 4:
        text = const Text('05', style: style);
        break;
      case 5:
        text = const Text('06', style: style);
        break;
      case 6:
        text = const Text('07', style: style);
        break;
      case 7:
        text = const Text('08', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: text,
    );
  }

  Widget leftTitle(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = "1k";
    } else if (value == 2) {
      text = '2k';
    } else if (value == 3) {
      text = '3k';
    } else if (value == 3) {
      text = '3k';
    } else if (value == 4) {
      text = '4k';
    } else if (value == 5) {
      text = '5k';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }
}
