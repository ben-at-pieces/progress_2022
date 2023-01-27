import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../connections/statistics_singleton.dart';
import '../Empty States/python_empty.dart';
import '../dNotEmpty/python_images_row.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      // home : new ListViewBuilder(), NO Need To Use Unnecessary New Keyword
      // home:  LanguageBuilder());
    );
  }
}

class PythonLanguageBuilder extends StatelessWidget {
  final String title;
  final String subtitle;
  final Image leading;

  PythonLanguageBuilder({
    required this.title,
    required this.subtitle,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    int? count = StatisticsSingleton().statistics?.python.length;

    if (count == 0) {
      return PythonEmptyBuilder();
    } else {
    return PythonImageBuilder(title: title, subtitle: '', leading: leading);
  }
  }
}
