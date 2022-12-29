import 'package:flutter/material.dart';

import '../appbar_class.dart';
import '../bottom_appbar_class.dart';
import '../card_class.dart';

void main() {
  runApp(const CardExamplesApp());
}

class CardExamplesApp extends StatelessWidget {
  const CardExamplesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        appBar: CutomAppBar(title: 'Plugins & More',),
        bottomNavigationBar: CutomBottomAppBar(),

        body: Column(
          children: const <Widget>[
            Spacer(),
            // ElevatedCardExample(),
            // FilledCardExample(),
            OutlinedCardExample(title: 'hello',),
            // OUgufyug(),
            // OutlinedCardExample(),
            // OutlinedCardExample(),
            // OutlinedCardExample(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}




