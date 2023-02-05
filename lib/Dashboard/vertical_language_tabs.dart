import 'package:flutter/material.dart';
import 'package:gsheets/Dashboard/sidebar.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:gsheets/connections/statistics_singleton.dart';

import '../appbar_class.dart';
import '../bottom_appbar_class.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is
//the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextSpan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyDashBoard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyDashBoard extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyDashBoard> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomAppBar(),
      appBar: CustomAppBar(title: 'List View',),
      body: VerticalTabBar(),
      backgroundColor: Colors.lightBlue[50],
    );
  }
}
