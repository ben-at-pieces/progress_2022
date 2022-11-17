import 'package:flutter/material.dart';

import '../chart data/statistics_singleton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShowHideDemo(),
    );
  }
}

class ShowHideDemo extends StatefulWidget {
  @override
  _ShowHideDemoState createState() {
    return _ShowHideDemoState();
  }
}

class _ShowHideDemoState extends State {
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        title: Text('Flutter Show/Hide Widget Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Visibility(
              visible: _isVisible,
              child: Text('${StatisticsSingleton().statistics?.tags ?? 0}'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20),
                minimumSize: Size.fromHeight(50),
              ),
              onPressed: showToast,
              child: Text('Show Top 5 Tags'),
            ),
          ],
        ),
      ),
    );
  }
}

///
