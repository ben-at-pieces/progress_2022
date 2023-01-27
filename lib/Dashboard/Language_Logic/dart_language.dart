import 'package:connector_openapi/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../connections/api.dart';
import '../../connections/statistics_singleton.dart';
import '../../tabBar_appbar.dart';
import '../Empty States/dart_empty.dart';
import '../dNotEmpty/dart_images_row.dart';

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

class DartLanguageBuilder extends StatelessWidget {
  final String title;
  final String subtitle;
  final Image leading;

  DartLanguageBuilder({
    required this.title,
    required this.subtitle,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    int? count = StatisticsSingleton().statistics?.dart.length;

    if (count == 0) {
      return DartEmptyBuilder();
    } else {
      return DartImageBuilder(title: title, subtitle: '', leading: leading);
    }
  }
}
