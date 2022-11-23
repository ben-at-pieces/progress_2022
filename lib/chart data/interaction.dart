import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/chart%20data/statistics_singleton.dart';

import 'indicator.dart';

class PieChartSample1 extends StatefulWidget {
  const PieChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => PieChartSample1State();
}

class PieChartSample1State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Indicator(
                  color: Color(0xfffa9d2c),
                  text: 'JetBrains',
                  isSquare: false,
                  size: touchedIndex == 0 ? 18 : 16,
                  textColor: touchedIndex == 0 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: Colors.lightBlueAccent,
                  text: 'VS Code',
                  isSquare: false,
                  size: touchedIndex == 1 ? 18 : 16,
                  textColor: touchedIndex == 1 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: Colors.grey,
                  text: 'Pieces for Developers',
                  isSquare: false,
                  size: touchedIndex == 2 ? 18 : 16,
                  textColor: touchedIndex == 2 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: Colors.red,
                  text: 'Chrome Ext',
                  isSquare: false,
                  size: touchedIndex == 3 ? 18 : 16,
                  textColor: touchedIndex == 3 ? Colors.black : Colors.grey,
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    startDegreeOffset: 180,
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 1,
                    centerSpaceRadius: 0,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      4,
      (i) {
        final isTouched = i == touchedIndex;

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: Colors.orangeAccent,
              title: '${StatisticsSingleton().statistics?.jetBrains ?? 0}',
              radius: 70,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              titlePositionPercentageOffset: 0.55,
            );
          case 1:
            return PieChartSectionData(
              showTitle: true,
              color: Colors.lightBlueAccent,
              value: StatisticsSingleton().statistics?.vsCode.length.toDouble() ?? 0,
              radius: 70,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              titlePositionPercentageOffset: 0.55,
            );
          case 2:
            return PieChartSectionData(
              color: Colors.grey,
              value: StatisticsSingleton().statistics?.pfd.length.toDouble() ?? 0,
              radius: 70,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              titlePositionPercentageOffset: 0.6,
            );
          case 3:
            return PieChartSectionData(
              color: Colors.red,
              value: StatisticsSingleton().statistics?.chrome.length.toDouble() ?? 1.9,
              radius: 70,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              titlePositionPercentageOffset: 0.6,
            );
          default:
            throw Error();
        }
      },
    );
  }
}
