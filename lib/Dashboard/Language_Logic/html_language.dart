import 'package:flutter/material.dart';

import '../../connections/statistics_singleton.dart';

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

class HTMLLanguageBuilder extends StatelessWidget {
  final String title;
  final String subtitle;
  final Image leading;

  HTMLLanguageBuilder({
    required this.title,
    required this.subtitle,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: ListView.builder(
        itemCount: StatisticsSingleton().statistics?.html.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  leading: leading,
                   title: Text(title),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  // leading: Image.asset('batchfile-black.jpg'),
                  title: Text('${StatisticsSingleton().statistics?.html.elementAt(index).name}' ?? ''),
                  subtitle: Text('${StatisticsSingleton().statistics?.html.elementAt(index).description}' ?? ''),
                  trailing: Icon(Icons.copy),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
