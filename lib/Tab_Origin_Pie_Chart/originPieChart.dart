// ignore_for_file: omit_local_variable_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'dart:core';
import 'dart:math' as math;
import 'package:connector_openapi/api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/connections/statistics_singleton.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:runtime_client/particle.dart';
import 'package:flutter/services.dart';
import '../Tab_Activity_Bar_Chart/colors.dart';
import '../appbar_class.dart';
import '../bottom_appbar_class.dart';
import '../tabBar_appbar.dart';

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

class OriginChart extends StatelessWidget {
  const OriginChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: CustomAppBar(title: 'Snippet Origins',),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 40),
        child: SizedBox(
          height: 200,
          width: 550,
          child: PieChart(
            ringStrokeWidth: 100,
            centerText: 'ORIGINS',
            chartValuesOptions: const ChartValuesOptions(
              showChartValuesOutside: true,
              showChartValueBackground: true,
              decimalPlaces: 0,
              showChartValues: true,
              showChartValuesInPercentage: false,
            ),
            emptyColor: Colors.grey,
            baseChartColor: Colors.black45,
            centerTextStyle:
                TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
            key: ValueKey(key),
            dataMap: StatisticsSingleton().statistics!.origins,
            animationDuration: const Duration(milliseconds: 800),
            chartLegendSpacing: 50,
            chartRadius: math.min(MediaQuery.of(context).size.width / 1.5, 150),
            colorList: originColorList,
            chartType: ChartType.ring,
            legendOptions: const LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.left,
              showLegends: true,
              legendShape: true ? BoxShape.circle : BoxShape.rectangle,
              legendTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
final TextEditingController _textFieldController = TextEditingController();

