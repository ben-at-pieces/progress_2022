// import 'package:connector_openapi/api_client.dart';
// ignore_for_file: omit_local_variable_types, prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:gsheets/tabBar_appbar.dart';
import 'package:runtime_client/particle.dart';

import 'connections/statistics.dart';
import 'connections/statistics_singleton.dart';

void main() async {
  StatisticsSingleton().statistics = await getStats();
  
  // print('${StatisticsSingleton().statistics?.classifications.keys}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Pieces Pie Chart',
      theme: ParticleTheme.lightPalette(context),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      home: HomePageAppBar(),
    );
  }
}
