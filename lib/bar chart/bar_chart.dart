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
            maxY: highestCount + 3 ?? 0,
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
              bottomTitles: AxisTitles(
                axisNameWidget: Text(
                  'P I E C E S _ U S E R _ S T A T S',
                  style: ParticleFont.button(context,
                      customization: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                ),

                /// TODO here there is some cleaning that can be done to make this code more readable
                /// Currently this shows the meta data count (Below you will find the to titles data names)
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 36,
                  getTitlesWidget: (value, meta) {
                    String text = 'default';

                    switch (value.toString()) {
                      case '0':
                        text = 'Saved: ${StatisticsSingleton().statistics?.snippetsSaved}';
                        break;
                      case '1':
                        text = 'Updates: ${StatisticsSingleton().statistics?.updatedSnippets}';
                        break;

                      case '2':
                        text = 'Tags: ${StatisticsSingleton().statistics?.tags.length.toDouble()}';
                        break;
                      case '3':
                        text = 'Shared: ${StatisticsSingleton().statistics?.shareableLinks}';
                        break;
                      case '4':
                        text =
                            'People: ${StatisticsSingleton().statistics?.persons.length.toDouble()}';
                        break;
                      case '5':
                        text =
                            'Related Links: ${StatisticsSingleton().statistics?.relatedLinks.length.toDouble()}';
                        break;
                    }

                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text(
                        text,
                        style: ParticleFont.micro(context,
                            customization:
                                TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                      ),
                    );
                  },
                ),
              ),
              rightTitles: AxisTitles(),
              topTitles: AxisTitles(sideTitles: SideTitles()),
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

              /// Total Updated Snippets in your repo ================================================================
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                    borderRadius: BorderRadius.zero,
                    toY: StatisticsSingleton().statistics?.updatedSnippets ?? 0,
                    width: 45,
                    color: Colors.deepPurple,
                  ),
                ],
              ),

              /// Total Number of Tags
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(
                    borderRadius: BorderRadius.zero,
                    toY: StatisticsSingleton().statistics?.tags.length.toDouble() ?? 0,
                    width: 45,
                    color: Colors.indigoAccent,
                  ),
                ],
              ),

              /// Total user shares ================================================================
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(
                    borderRadius: BorderRadius.zero,
                    toY: StatisticsSingleton().statistics?.shareableLinks ?? 0,
                    width: 45,
                    color: Colors.grey,
                  ),
                ],
              ),

              /// Total user peoples ================================================================
              BarChartGroupData(
                x: 4,
                barRods: [
                  BarChartRodData(
                    borderRadius: BorderRadius.zero,
                    toY: StatisticsSingleton().statistics?.persons.length.toDouble() ?? 0,
                    width: 45,
                    color: Colors.pinkAccent,
                  ),
                ],
              ),

              /// Total user related links ================================================================
              BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(
                    borderRadius: BorderRadius.zero,
                    toY: StatisticsSingleton().statistics?.relatedLinks.length.toDouble() ?? 0,
                    width: 45,
                    color: Colors.deepPurpleAccent,
                  ),
                ],
              ),
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
