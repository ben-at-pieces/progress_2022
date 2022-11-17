// ignore_for_file: prefer__ructors, prefer__literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';

import '../chart data/statistics_singleton.dart';

double highestCount = [
  StatisticsSingleton().statistics?.snippetsSaved ?? 0.0,
  StatisticsSingleton().statistics?.shareableLinks ?? 0.0,
  StatisticsSingleton().statistics?.updatedSnippets ?? 0.0,
  StatisticsSingleton().statistics?.tags.length.toDouble() ?? 0.0,
  StatisticsSingleton().statistics?.persons.length.toDouble() ?? 0.0,
  StatisticsSingleton().statistics?.relatedLinks.length.toDouble() ?? 0.0
].max;

class BarGraph extends StatefulWidget {
  @override
  State<BarGraph> createState() => _BarChartState();
}

class _BarChartState extends State<BarGraph> {
  int touchedGroupIndex = -1;
  late int showingTooltip;

  @override
  void initState() {
    showingTooltip = -1;
    super.initState();
  }

  BarChartGroupData generateGroupData(int x, int y) {
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: showingTooltip == x ? [0] : [],
      barRods: [
        BarChartRodData(toY: 19),
      ],
    );
  }

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
              border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Colors.black,
                  ),
                  vertical: BorderSide(
                    color: Colors.black,
                  )),
            ),

            ///TODO IMPLEMENT INTERACTION
            barTouchData: BarTouchData(
              enabled: true,
              handleBuiltInTouches: true,
              touchTooltipData: BarTouchTooltipData(
                fitInsideVertically: true,
                tooltipBgColor: Colors.white,
              ),
              touchCallback: (FlTouchEvent event, response) {
                if (response != null && response.spot != null && event is FlTapUpEvent) {
                  setState(() {
                    final x = response.spot!.touchedBarGroup.barsSpace;
                    final isShowing = showingTooltip == x;
                    if (isShowing) {
                      showingTooltip = -1;
                    } else {
                      showingTooltip = 2;
                    }
                  });
                }
              },
              mouseCursorResolver: (event, response) {
                return response == null || response.spot == null
                    ? MouseCursor.defer
                    : SystemMouseCursors.click;
              },
            ),

            /// TITLES DATA
            titlesData: FlTitlesData(
              show: true,
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),

                drawBehindEverything: false,

                /// TODO this is where we will decide to either show/not show the Y Axis
                /// TODO plan to use a stateful pop over to show data cleaner than the Y Axis
              ),
              rightTitles: AxisTitles(),
              bottomTitles: AxisTitles(
                // axisNameWidget: Text(
                //   'P I E C E S _ U S E R _ S T A T S',
                //   style: ParticleFont.button(context,
                //       customization: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                // ),

                /// TODO
                /// Currently this shows the meta data count
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

                      /// this is where I want to show Top 5 Tags on hover
                      case '2':
                        text = 'Tags: ${StatisticsSingleton().statistics?.tags.length.toDouble()}';
                        break;

                      /// ======================================================================
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

                    /// BOTTOM LABELS
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text(
                        text,
                        style: ParticleFont.micro(
                          context,
                          customization: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              topTitles: AxisTitles(
                  axisNameWidget: Text(
                    'P I E C E S _ U S E R _ S T A T S',
                    style: ParticleFont.button(context,
                        customization: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        )),
                  ),

                  /// TODO
                  /// Currently this shows the meta data count
                  sideTitles: SideTitles()),
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
                    color: Colors.blueGrey,
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
                    color: Colors.lightBlueAccent,
                  ),
                ],
              ),
            ],

            /// AXIS LINES FOR BAR GRAPH
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (value) => FlLine(
                color: Color(0xFFececec),
                strokeWidth: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// constructor for Bar Graph data

class _BarData {
  _BarData(this.value, this.language);

  final String language;
  final double value;
}
