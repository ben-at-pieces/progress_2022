// main.dart
// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

import '../pie/pie chart/dataMap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      theme: ThemeData(
        // enable Material 3
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool _running = true;
  final controller = StreamController<int>(onListen: () async {
    await Future<void>.delayed(const Duration(seconds: 1));

    await Future<void>.delayed(const Duration(seconds: 1));
  });

  Stream<double> _batchFileCount() async* {
    while (_running) {
      await Future<void>.delayed(const Duration(seconds: 1));
      var snippets = dataMap.values.toList();

      yield batchFile.first.toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          // title: const Text('Kindacode.com'),
          ),
      body: Center(
        child: StreamBuilder<double>(
          stream: _batchFileCount(),
          builder: (context, AsyncSnapshot<double> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return Column(
              children: [
                Text(
                  'real time clock',
                  style: const TextStyle(fontSize: 50, color: Colors.blue),
                ),
                Text(
                  ' batchfile: ${snapshot.data}',
                  style: const TextStyle(fontSize: 15, color: Colors.blue),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
