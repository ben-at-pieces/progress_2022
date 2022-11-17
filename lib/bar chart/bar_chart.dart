// ignore_for_file: prefer__ructors, prefer__literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:collection/collection.dart';
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
  double highestCount = [
    StatisticsSingleton().statistics?.snippetsSaved ?? 0.0,
    StatisticsSingleton().statistics?.shareableLinks ?? 0.0,
    StatisticsSingleton().statistics?.updatedSnippets ?? 0.0,
    StatisticsSingleton().statistics?.tags.length.toDouble() ?? 0.0,
    StatisticsSingleton().statistics?.persons.length.toDouble() ?? 0.0,
    StatisticsSingleton().statistics?.relatedLinks.length.toDouble() ?? 0.0
  ].max;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: BarChart(
          BarChartData(
            maxY: highestCount + 5,
            alignment: BarChartAlignment.spaceAround,
            borderData: FlBorderData(
              show: true,
            ),
            titlesData: FlTitlesData(
              show: true,
              leftTitles: AxisTitles(
                drawBehindEverything: false,

                /// TODO this is where we will decide to either show/not show the Y Axis
                /// TODO plan to use a stateful pop over to show data cleaner than the Y Axis
                sideTitles: SideTitles(
                  showTitles: false,
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

              /// Bottom titles { meta data :  count} ================================================================

              bottomTitles: AxisTitles(
                axisNameWidget: Text(
                  'P I E C E S _ U S E R _ S T A T S',
                  style: ParticleFont.button(context,
                      customization: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                ),
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 50,
                  getTitlesWidget: (value, meta) {
                    String text = 'default';

                    switch (value.toString()) {
                      case '0':
                        text = 'Saved: ${StatisticsSingleton().statistics?.snippetsSaved}';
                        break;
                      case '1':
                        text = 'Updated: ${StatisticsSingleton().statistics?.updatedSnippets}';
                        break;
                      case '2':
                        text = 'Shared ${StatisticsSingleton().statistics?.shareableLinks}';
                        break;
                      case '3':
                        text =
                            'People: ${StatisticsSingleton().statistics?.persons.length.toDouble()}';
                        break;
                      case '4':
                        text = 'Tags: ${StatisticsSingleton().statistics?.tags.length.toDouble()}';
                        break;

                      case '5':
                        text =
                            'Related Links: ${StatisticsSingleton().statistics?.relatedLinks.length.toDouble()}';
                        break;
                    }

                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text(text),
                    );
                  },
                ),
              ),

              /// No titles to the right ================================================================
              rightTitles: AxisTitles(),

              /// No TOP Titles ================================================================
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

            /// Indexed Meta Data Names and Counts =========================================================
            barGroups: [
              /// Total Saved Snippets ================================================================
              BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(
                    borderRadius: BorderRadius.zero,
                    toY: StatisticsSingleton().statistics?.snippetsSaved ?? 0,
                    width: 40,
                    color: Colors.black54,
                  ),
                ],
              ),

              /// Total user Updates ================================================================
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                    borderRadius: BorderRadius.zero,
                    toY: StatisticsSingleton().statistics?.updatedSnippets ?? 0,
                    width: 30,
                    color: Colors.grey,
                  ),
                ],
              ),

              /// Total Shares ================================================================
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(
                    borderRadius: BorderRadius.zero,
                    toY: StatisticsSingleton().statistics?.shareableLinks ?? 0,
                    width: 45,
                    color: Colors.deepPurple,
                  ),
                ],
              ),

              /// Total Persons ====================================================================
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(
                    borderRadius: BorderRadius.zero,
                    toY: StatisticsSingleton().statistics?.persons.length.toDouble() ?? 0,
                    width: 30,
                    color: Colors.greenAccent,
                  ),
                ],
              ),

              /// Total Tags ====================================================================
              BarChartGroupData(
                x: 4,
                barRods: [
                  BarChartRodData(
                    borderRadius: BorderRadius.zero,
                    toY: StatisticsSingleton().statistics?.tags.length.toDouble() ?? 0,
                    width: 30,
                    color: Colors.blueGrey,
                  ),
                ],
              ),

              /// Total Related Links ====================================================================
              BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(
                    borderRadius: BorderRadius.zero,
                    toY: StatisticsSingleton().statistics?.relatedLinks.length.toDouble() ?? 0,
                    width: 30,
                    color: Colors.lightBlueAccent,
                  ),
                ],
              ),
            ],
            barTouchData: BarTouchData(
              enabled: true,
              handleBuiltInTouches: true,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.white,
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
