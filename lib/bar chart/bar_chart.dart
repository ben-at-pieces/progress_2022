// ignore_for_file: prefer__ructors, prefer__literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';

import '../chart data/statistics_singleton.dart';

class BarGraph extends StatefulWidget {
  @override
  State<BarGraph> createState() => _BarChartState();
}

class _BarChartState extends State<BarGraph> {
  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: BarChart(
          BarChartData(
            // maxY: 50,
            alignment: BarChartAlignment.spaceAround,
            borderData: FlBorderData(
              show: true,
              // border: Border.symmetric(
              //   horizontal: BorderSide(
              //     color: Colors.transparent,
              //   ),
              // ),
            ),
            titlesData: FlTitlesData(
              show: true,
              leftTitles: AxisTitles(
                drawBehindEverything: true,
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 42,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toString(),
                      style: TextStyle(
                        color: Color(0xFF606060),
                      ),
                      textAlign: TextAlign.left,
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                axisNameWidget: Text(
                  'U S E R _ S T A T S',
                  style: ParticleFont.button(context,
                      customization: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                ),
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 36,
                  getTitlesWidget: (value, meta) {
                    String text = 'default';

                    switch (value.toString()) {
                      case '0':
                        text = 'Saved';
                        break;
                      case '1':
                        text = 'Shared';
                        break;
                      // case '2':
                      //   text = 'Total Lines';
                      //   break;
                      case '2':
                        text = 'Updates';
                        break;
                    }

                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text(text),
                    );
                  },
                ),
              ),
              rightTitles: AxisTitles(),
              topTitles: AxisTitles(),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (value) => FlLine(
                color: Color(0xFFececec),
                strokeWidth: 1,
              ),
            ),
            barGroups: [
              /// Total Saved Snippets in your repo ================================================================
              // BarChartGroupData(
              //   x: 0,
              //   barRods: [
              //     BarChartRodData(
              //       borderRadius: BorderRadius.zero,
              //       toY: StatisticsSingleton().statistics?.snippetsSaved ?? 0,
              //       width: 40,
              //       color: Colors.black54,
              //     ),
              //   ],
              // ),

              /// Total Updated Snippets in your repo ================================================================
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(
                    borderRadius: BorderRadius.zero,
                    toY: StatisticsSingleton().statistics?.updatedSnippets ?? 0,
                    width: 45,
                    color: Colors.deepPurple,
                  ),
                ],
              ),

              /// Total user shares ================================================================
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                    borderRadius: BorderRadius.zero,
                    toY: StatisticsSingleton().statistics?.shareableLinks ?? 0,
                    width: 30,
                    color: Colors.grey,
                  ),
                ],
              ),

              /// This is our line count for all of the snippets (is an outlier for thi)
              // BarChartGroupData(
              //   x: 2,
              //   barRods: [
              //     BarChartRodData(
              //       toY: StatisticsSingleton().statistics?.totalLinesSaved ?? 0,
              //       width: 30,
              //       color: Colors.green,
              //     ),
              //   ],
              // ),
            ],
            barTouchData: BarTouchData(
              enabled: true,
              handleBuiltInTouches: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipMargin: 0,
                getTooltipItem: (
                  BarChartGroupData group,
                  int groupIndex,
                  BarChartRodData rod,
                  int rodIndex,
                ) {
                  return BarTooltipItem(
                    rod.toY.toString(),
                    TextStyle(
                      fontWeight: FontWeight.bold,
                      color: rod.color,
                      fontSize: 18,
                    ),
                  );
                },
              ),
              touchCallback: (event, response) {
                if (event.isInterestedForInteractions &&
                    response != null &&
                    response.spot != null) {
                  setState(() {
                    touchedGroupIndex = response.spot!.touchedBarGroupIndex;
                  });
                } else {
                  setState(() {
                    touchedGroupIndex = -1;
                  });
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// ructor for Bar Graph data

class _BarData {
  _BarData(this.value, this.language);

  final String language;
  final double value;
}
