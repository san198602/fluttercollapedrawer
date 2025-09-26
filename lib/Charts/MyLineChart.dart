import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyLineChart extends StatelessWidget {
  const MyLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true), // Hide grid lines
        titlesData: const FlTitlesData(show: true), // Hide titles/labels
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1),
        ),
        minX: 0,
        maxX: 10,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 3),
              FlSpot(2.6, 2),
              FlSpot(4.9, 5),
              FlSpot(6.8, 2.5),
              FlSpot(8, 4),
              FlSpot(9.5, 3),
              FlSpot(10, 4),
            ],
            isCurved: true,
            gradient: LinearGradient(
              colors: [Colors.cyanAccent, Colors.blueAccent],
            ),
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false), // Hide dots on the line
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  Colors.cyanAccent.withOpacity(0.3),
                  Colors.blueAccent.withOpacity(0.3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
