// ignore_for_file: prefer__ructors, prefer__literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:runtime_client/particle.dart';

import '../chart data/statistics_singleton.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class BarGraph extends StatefulWidget {
  @override
  State<BarGraph> createState() => _BarChartState();
}

class _BarChartState extends State<BarGraph> {
  bool _isVisible = false;

  int touchedGroupIndex = -1;
  double highestCount = [
    StatisticsSingleton().statistics?.snippetsSaved ?? 0.0,
    StatisticsSingleton().statistics?.shareableLinks ?? 0.0,
    StatisticsSingleton().statistics?.updatedSnippets ?? 0.0,
    StatisticsSingleton().statistics?.tags.length.toDouble() ?? 0.0,
    StatisticsSingleton().statistics?.persons.length.toDouble() ?? 0.0,
    StatisticsSingleton().statistics?.relatedLinks.length.toDouble() ?? 0.0
  ].max;

  late FToast fToast;

  @override
  Widget build(BuildContext context) {
    /// connection to tags pop up ====================================================================

    return Scaffold(
      appBar: AppBar(
        leading: FloatingActionButton(
          tooltip: 'copy your Pieces Repo Data',
          elevation: 0,
          mini: true,
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.info_outline,
            color: Colors.white,
            size: 15,
          ),
          onPressed: () async {
            ClipboardData data = ClipboardData(text: '''
User Name: ${StatisticsSingleton().statistics?.user}
Platform: ${StatisticsSingleton().statistics?.platform}
Version: ${StatisticsSingleton().statistics?.version}
  .--.      .-'.      .--.      .--.      .--.      .--.      .`-.      .--.
:::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
'      `--'      `.-'      `--'      `--'      `--'      `-.'      `--'      `

Shareable Link count: 
${StatisticsSingleton().statistics?.shareableLinks}
  .--.      .-'.      .--.      .--.      .--.      .--.      .`-.      .--.
:::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
'      `--'      `.-'      `--'      `--'      `--'      `-.'      `--'      `

Related Tags: 
${StatisticsSingleton().statistics?.tags}
  .--.      .-'.      .--.      .--.      .--.      .--.      .`-.      .--.
:::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
'      `--'      `.-'      `--'      `--'      `--'      `-.'      `--'      `

Related Links: 
${StatisticsSingleton().statistics?.relatedLinks}
  .--.      .-'.      .--.      .--.      .--.      .--.      .`-.      .--.
:::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
'      `--'      `.-'      `--'      `--'      `--'      `-.'      `--'      `

Related People: 
${StatisticsSingleton().statistics?.persons}
  .--.      .-'.      .--.      .--.      .--.      .--.      .`-.      .--.
:::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
'      `--'      `.-'      `--'      `--'      `--'      `-.'      `--'      `

Snippet Counts by Origin: 
${StatisticsSingleton().statistics?.origins}

  .--.      .-'.      .--.      .--.      .--.      .--.      .`-.      .--.
:::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
'      `--'      `.-'      `--'      `--'      `--'      `-.'      `--'      `
''');
            const snackBar = SnackBar(
              content: Text('Copied your repo information!'),
            );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            await Clipboard.setData(data);
          },
        ),

        backgroundColor: Colors.black54,
        title: Text(
          'User: ${StatisticsSingleton().statistics?.user} Repository Statistics',
          style: ParticleFont.button(context,
              customization: TextStyle(
                color: Colors.white,
              )),
        ),
      ),
      body: Container(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: BarChart(
            BarChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                drawHorizontalLine: false,
              ),
              maxY: highestCount + 10,
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
                    'Time Saved: ${StatisticsSingleton().statistics?.timeTaken.round()} seconds',
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
                          text =
                              'Tags: ${StatisticsSingleton().statistics?.tags.length.toDouble()}';
                          break;

                        case '5':
                          text =
                              'Links: ${StatisticsSingleton().statistics?.relatedLinks.length.toDouble()}';
                          break;
                      }

                      ///
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        child: Text(
                          text,
                          style: ParticleFont.micro(context,
                              customization: TextStyle(color: Colors.black)),
                        ),
                      );
                    },
                  ),
                ),

                /// No titles to the right ================================================================
                rightTitles: AxisTitles(),

                /// TOP Titles ================================================================
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) {
                      String text = '';

                      switch (value.toString()) {
                        case '0':
                          text = 'Top 5 Tags';
                          break;
                      }

                      ///
                      return SideTitleWidget(
                        // angle: 18,
                        axisSide: meta.axisSide,
                        child: Row(
                          children: [
                            // OriginChart(),
                            Text(
                              text,
                              style: ParticleFont.micro(context,
                                  customization: TextStyle(color: Colors.black, fontSize: 10)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              /// Saved Snippets Count =========================================================
              barGroups: [
                /// Total Saved Snippets ================================================================
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      borderRadius: BorderRadius.zero,
                      toY: StatisticsSingleton().statistics?.snippetsSaved ?? 0,
                      width: 50,
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
                      width: 50,
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
                      width: 50,
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
                      width: 50,
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
                      width: 50,
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
                      width: 50,
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
                        fontSize: 12,
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
      ),
      bottomNavigationBar: SizedBox(
        height: 30,
        child: BottomAppBar(
          notchMargin: 5,
          color: Colors.black54,
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Icon(
                Icons.bolt_sharp,
                color: Colors.white,
              ),
              TextButton(
                child: Text(
                  'Powered by Pieces Runtime',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
                onPressed: () async {
                  String linkUrl = 'https://www.runtime.dev/';

                  linkUrl = linkUrl; //Twitter's URL
                  if (await canLaunch(linkUrl)) {
                    await launch(
                      linkUrl,
                    );
                  } else {
                    throw 'Could not launch $linkUrl';
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

// showCustomToast() {
//   Widget toast = Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(25.0),
//       color: Colors.grey,
//     ),
//     child: Row(
//       children: [
//         Text('1: ${StatisticsSingleton().statistics?.tags.elementAt(0) ?? '0'}'),
//         Text('2: ${StatisticsSingleton().statistics?.tags.elementAt(1) ?? '0'}'),
//         Text('3: ${StatisticsSingleton().statistics?.tags.elementAt(2) ?? '0'}'),
//         Text('4: ${StatisticsSingleton().statistics?.tags.elementAt(3) ?? '0'}'),
//       ],
//     ),
//   );
//
//   fToast.showToast(
//     gravity: ToastGravity.TOP,
//     child: toast,
//     toastDuration: Duration(seconds: 3),
//   );
// }
//
// @override
// void initState() {
//   super.initState();
//   fToast = FToast();
//   fToast.init(context);
// }

  /// ructor for Bar Graph data

// class _BarData {
//   _BarData(this.value, this.language);
//
//   final String language;
//   final double value;
// }
}

String? firstTag = StatisticsSingleton().statistics?.tags.elementAt(0);
String? secondTag = StatisticsSingleton().statistics?.tags.elementAt(1);
String? thirdTag = StatisticsSingleton().statistics?.tags.elementAt(2);
String? fourthTag = StatisticsSingleton().statistics?.tags.elementAt(3);
String? fifthTag = StatisticsSingleton().statistics?.tags.elementAt(4);
