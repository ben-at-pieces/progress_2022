// ignore_for_file: prefer__ructors, prefer__literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../statistics_singleton.dart';

// Future<void> getStuff() async {
//   Statistics stats = await getStats();
//   stats.shareableLinks;
// }

class BarGraph extends StatefulWidget {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   stats.then((value) {
  //     stats = value;
  //     setState(() {});
  //   });
  // }

  // Future<Statistics> data = BarMap().getStats();
  //
  // BarGraph() {
  //   data.then((value) => {
  //         print(value),
  //       });
  // }

  // static List dataList = [
  //   // /// TODO
  //   // /// color & value (double)
  //   _BarData(StatisticsSingleton().statistics!.snippetsSaved, 'Saved Snippets'),
  //   _BarData(StatisticsSingleton().statistics!.shareableLinks, 'Shared Snippets'),
  //
  //   // _BarData(Color(0xff691ec7), 8, 'shared'),
  //   // _BarData(Color(0xff408d7d), 6, 'modified'),
  //   // _BarData(Color(0xffefbd52), 4, 'updated'),
  // ];

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
            alignment: BarChartAlignment.spaceAround,
            borderData: FlBorderData(
              show: false,
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
                axisNameWidget: Text('Data'),
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 36,
                  getTitlesWidget: (value, meta) {
                    String text = 'default';

                    switch (value.toString()) {
                      case '0':
                        text = 'Snippets Saved';
                        break;
                      case '1':
                        text = 'Shared Snippets';
                        break;
                      case '2':
                        text = 'Total Lines';
                        break;
                      case '3':
                        text = 'Total Updates';
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
              BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(
                    toY: StatisticsSingleton().statistics?.snippetsSaved ?? 0,
                    width: 30,
                    color: Colors.red,
                  ),
                ],
              ),
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                    toY: StatisticsSingleton().statistics?.shareableLinks ?? 0,
                    width: 30,
                    color: Colors.blue,
                  ),
                ],
              ),
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(
                    toY: StatisticsSingleton().statistics?.totalLinesSaved ?? 0,
                    width: 30,
                    color: Colors.green,
                  ),
                ],
              ),
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(
                    toY: StatisticsSingleton().statistics?.updatedSnippets ?? 0,
                    width: 30,
                    color: Colors.yellow,
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

// class _IconWidget extends ImplicitlyAnimatedWidget {
//   _IconWidget({
//     required this.color,
//     required this.isSelected,
//   }) : super(duration: Duration(milliseconds: 300));
//   final Color color;
//   final bool isSelected;
//
//   @override
//   ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() => _IconWidgetState();
// }

// class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
//   Tween<double>? _rotationTween;
//
//   @override
//   Widget build(BuildContext context) {
//     final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
//     final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
//     return Transform(
//       transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
//       origin: Offset(14, 14),
//       child: Icon(
//         widget.isSelected ? Icons.accessibility_new_sharp : Icons.accessibility_new,
//         color: widget.color,
//         semanticLabel: 'shared',
//         size: 28,
//       ),
//     );
//   }
//
//   @override
//   void forEachTween(TweenVisitor<dynamic> visitor) {
//     _rotationTween = visitor(
//       _rotationTween,
//       widget.isSelected ? 1.0 : 0.0,
//       (dynamic value) => Tween<double>(
//         begin: value as double,
//         end: widget.isSelected ? 1.0 : 0.0,
//       ),
//     ) as Tween<double>?;
//   }
// }
//
// class Statistics {
//   final Map<String, double> classifications;
//   final double snippetsSaved;
//   final double shareableLinks;
//   final double updatedSnippets;
//
//   final double totalLinesSaved;
//   Statistics({
//     required this.classifications,
//     required this.snippetsSaved,
//     required this.shareableLinks,
//     required this.updatedSnippets,
//     required this.totalLinesSaved,
//   });
// }
