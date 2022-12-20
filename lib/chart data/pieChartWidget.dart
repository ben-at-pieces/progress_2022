// ignore_for_file: omit_local_variable_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'dart:core';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gsheets/chart%20data/statistics_singleton.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:runtime_client/particle.dart';

import 'colors.dart';

// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const MyDataTable(),
//       ),
//     );
//   }
// }

class MyPieChart extends StatelessWidget {
  const MyPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text('Snippet Languages Saved', style: ParticleFont.subtitle1(context, customization: TextStyle(color: Colors.black))),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: PieChart(
            centerText: 'TOTAL: ${StatisticsSingleton().statistics?.snippetsSaved}',
            ringStrokeWidth: 50,
            chartValuesOptions: const ChartValuesOptions(
              showChartValuesOutside: true,
              showChartValueBackground: true,
              decimalPlaces: 0,
              showChartValues: true,
              showChartValuesInPercentage: false,
            ),
            emptyColor: Colors.grey,
            baseChartColor: Colors.black45,
            centerTextStyle: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
            key: ValueKey(key),
            dataMap: StatisticsSingleton().statistics!.classifications,
            animationDuration: const Duration(milliseconds: 800),
            chartLegendSpacing: 30,
            chartRadius: math.min(MediaQuery.of(context).size.width / 1.5, 180),
            colorList: colorList,
            chartType: ChartType.ring,
            legendOptions: const LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.left,
              showLegends: true,
              legendShape: true ? BoxShape.circle : BoxShape.rectangle,
              legendTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
