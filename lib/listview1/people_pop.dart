import 'package:flutter/material.dart';
import 'package:gsheets/chart%20data/statistics_singleton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('AlertDialog Sample')),
        body: Center(
          child: DialogExample(),
        ),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: ListView(
            children: [
            ],
          ),
          // Text('${StatisticsSingleton().statistics?.persons}'),

        ),
      ),
      child: Text('Show Dialog'),
    );
  }
}
