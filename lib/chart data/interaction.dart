// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/chart%20data/statistics_singleton.dart';
import 'package:runtime_client/particle.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /// Saved ==============================================
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Indicator(
                      color: touchedIndex == 0 ? Colors.white : Colors.white,
                      text:
                          '1: ${StatisticsSingleton().statistics?.tags.elementAt(0).toLowerCase()}',
                      isSquare: true,
                      size: touchedIndex == 0 ? 8 : 8,
                      textColor: touchedIndex == 0 ? Colors.grey : Colors.white,
                    ),
                  ),

                  /// updated ==============================================
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 4),
                    child: Indicator(
                      color: touchedIndex == 0 ? Colors.white : Colors.white,
                      text:
                          '2: ${StatisticsSingleton().statistics?.tags.elementAt(1).toLowerCase()}',
                      isSquare: true,
                      size: touchedIndex == 0 ? 8 : 8,
                      textColor: touchedIndex == 0 ? Colors.grey : Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 4),
                    child: Indicator(
                      color: touchedIndex == 0 ? Colors.white : Colors.white,
                      text:
                          '3: ${StatisticsSingleton().statistics?.tags.elementAt(2).toLowerCase()}',
                      isSquare: true,
                      size: touchedIndex == 0 ? 8 : 8,
                      textColor: touchedIndex == 0 ? Colors.grey : Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 4),
                    child: Indicator(
                      color: touchedIndex == 0 ? Colors.white : Colors.white,
                      text:
                          '4: ${StatisticsSingleton().statistics?.tags.elementAt(3).toLowerCase()}',
                      isSquare: true,
                      size: touchedIndex == 0 ? 8 : 8,
                      textColor: touchedIndex == 0 ? Colors.grey : Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 4),
                    child: Indicator(
                      color: touchedIndex == 0 ? Colors.white : Colors.white,
                      text:
                          '5: ${StatisticsSingleton().statistics?.tags.elementAt(4).toLowerCase()}',
                      isSquare: true,
                      size: touchedIndex == 0 ? 8 : 8,
                      textColor: touchedIndex == 0 ? Colors.grey : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.38,
                child: PieChart(
                  swapAnimationDuration: const Duration(milliseconds: 800),
                  PieChartData(
                    sectionsSpace: 1,
                    centerSpaceRadius: 0,
                    sections: showingSections(),
                    borderData: FlBorderData(show: false),
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
      1,
      (i) {
        final isTouched = i == touchedIndex;
        final opacity = isTouched ? 1.0 : 0.6;

        const color0 = Color(0xffb4b4b4);
        const color1 = Color(0xfff8b250);
        const color2 = Color(0xff845bef);
        const color3 = Color(0xff13d38e);
        const color4 = Color(0xff1700ff);

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0.withOpacity(opacity),
              value: 25,
              title: 'hover to view Tags',
              titleStyle: ParticleFont.micro(context),
              radius: 65,

              // titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: color0, width: 6)
                  : BorderSide(color: color0.withOpacity(0)),
            );
          case 1:
            return PieChartSectionData(
              color: color0.withOpacity(opacity),
              value: 25,
              title: '#2',
              radius: 65,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              // titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: color0, width: 6)
                  : BorderSide(color: color0.withOpacity(0)),
            );
          case 2:
            return PieChartSectionData(
              color: color0.withOpacity(opacity),
              value: 25,
              title: '#3',
              radius: 65,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              // titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: color0, width: 6)
                  : BorderSide(
                      color: color0.withOpacity(0),
                    ),
            );
          case 3:
            return PieChartSectionData(
              color: color0.withOpacity(opacity),
              value: 25,
              title: '#4',
              radius: 65,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              // titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: color0, width: 6)
                  : BorderSide(color: color0.withOpacity(0)),
            );
          case 4:
            return PieChartSectionData(
              color: color0.withOpacity(opacity),
              value: 25,
              title: '#5',
              radius: 65,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              // titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: color0, width: 6)
                  : BorderSide(color: color0.withOpacity(0)),
            );
          default:
            throw Error();
        }
      },
    );
  }
}
