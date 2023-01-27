import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';

import '../../connections/statistics_singleton.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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

class EmptyLanguageBuilder extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Card(
        child: Column(
          children: [
            // ListTile(
            //   leading: leading,
            //   title: Text(title),
            // ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Image.asset('Sad.jpg'),
              title: Text('You have 0 saved snippets'),
              subtitle: Text(''),
              // trailing: Icon(Icons.copy),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: ListTile(
                // leading: Image.asset('chrome.jpg'),
                title: Text('No worries, check out a supported Plugins & Extensions'),

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
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(height: 25, child: Image.asset('chrome.jpeg')),
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

final TextEditingController _textFieldController = TextEditingController();
