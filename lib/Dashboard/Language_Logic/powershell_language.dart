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

class PowershellLanguageBuilder extends StatelessWidget {
  final String title;
  final String subtitle;
  final Image leading;

  PowershellLanguageBuilder({
    required this.title,
    required this.subtitle,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    int? count = StatisticsSingleton().statistics?.powershell.length;

    if (count == 0) {
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
              leading: Image.asset('Sad.jpg'),
              title: Text('You have no 0 saved snippets'),
              subtitle: Text(''),
              // trailing: Icon(Icons.copy),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: ListTile(
                // leading: Image.asset('chrome.jpg'),
                title:
                Text(''),

                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Divider(
                        color: Colors.grey,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 4.0),
                        child: SizedBox(height: 25, child: Image.asset('vs_code.jpeg')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(height: 25, child: Image.asset('intellij.jpeg')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(height: 25, child: Image.asset('CLI.jpg')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(height: 25, child: Image.asset('bettercode.jpg')),
                      ), Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(height: 25, child: Image.asset('chrome.jpeg')),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      );
    } else {
    return Container(
      color: Colors.grey,
      child: ListView.builder(
        itemCount: StatisticsSingleton().statistics?.powershell.length,
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
                  title: Text('${StatisticsSingleton().statistics?.powershell.elementAt(index).name}'),
                  subtitle: Text('${StatisticsSingleton().statistics?.powershell.elementAt(index).description}'),
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
}
