// import 'package:connector_openapi/api_client.dart';
// ignore_for_file: omit_local_variable_types, prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:gsheets/tabBar_appbar.dart';

import 'chart data/statistics.dart';
import 'chart data/statistics_singleton.dart';

void main() async {
  StatisticsSingleton().statistics = await getStats();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pieces Pie Chart',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      home: HomePageAppBar(),
    );
  }
}
