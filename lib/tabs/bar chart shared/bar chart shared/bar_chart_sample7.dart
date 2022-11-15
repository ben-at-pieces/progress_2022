// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatefulWidget {
  static const shadowColor = Color(0xFFCCCCCC);
  static const dataList = [
    /// TODO

    _BarData(Color(0xff545454), 10, 0),
    _BarData(Color(0xff691ec7), 8, 0),
    _BarData(Color(0xff408d7d), 6, 0),
    _BarData(Color(0xffefbd52), 4, 0),
    _BarData(Color(0xFF295ab5), 3, 0),
    _BarData(Color(0xFFea0107), 2, 0),
  ];

  @override
  State<BarGraph> createState() => _BarChartState();
}

class _BarChartState extends State<BarGraph> {
  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
    double shadowValue,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 30,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: BarGraph.shadowColor,
          width: 6,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.38,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceBetween,
                  borderData: FlBorderData(
                    show: true,
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Color(0xFFececec),
                      ),
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                      drawBehindEverything: true,
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 10,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: TextStyle(
                              color: Color(0xFF606060),
                            ),
                            textAlign: TextAlign.left,
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 36,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: _IconWidget(
                              color: BarGraph.dataList[index].color,
                              isSelected: touchedGroupIndex == index,
                            ),
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
                  barGroups: BarGraph.dataList.asMap().entries.map((e) {
                    final index = e.key;
                    final data = e.value;
                    return generateBarGroup(
                      index,
                      data.color,
                      data.value,
                      data.shadowValue,
                    );
                  }).toList(),
                  maxY: 20,
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
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 12,
                              )
                            ],
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
          ],
        ),
      ),
    );
  }
}

/// constructor for Bar Graph data
class _BarData {
  const _BarData(this.color, this.value, this.shadowValue);

  final Color color;
  final double value;
  final double shadowValue;
}

class _IconWidget extends ImplicitlyAnimatedWidget {
  const _IconWidget({
    required this.color,
    required this.isSelected,
  }) : super(duration: const Duration(milliseconds: 300));
  final Color color;
  final bool isSelected;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
  Tween<double>? _rotationTween;

  @override
  Widget build(BuildContext context) {
    final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
    final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
    return Transform(
      transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
      origin: Offset(14, 14),
      child: Icon(
        widget.isSelected ? Icons.accessibility_new_sharp : Icons.accessibility_new,
        color: widget.color,
        semanticLabel: 'shared',
        size: 28,
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _rotationTween = visitor(
      _rotationTween,
      widget.isSelected ? 1.0 : 0.0,
      (dynamic value) => Tween<double>(
        begin: value as double,
        end: widget.isSelected ? 1.0 : 0.0,
      ),
    ) as Tween<double>?;
  }
}
