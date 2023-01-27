import 'package:connector_openapi/api.dart';
import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';

import 'Dashboard/settings_bar.dart';
import 'connections/statistics_singleton.dart';
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

class HomeLanguageBuilder extends StatelessWidget {
  final String title;
  final String subtitle;
  final Image leading;

  HomeLanguageBuilder({
    required this.title,
    required this.subtitle,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Image.asset('user.jpg'),
                  title: Text(
                    '${StatisticsSingleton().statistics?.user}' ?? '',
                    style: ParticleFont.bodyText1(
                      context,
                      customization: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  subtitle: Text(
                    '${StatisticsSingleton().statistics?.platform.toLowerCase()}' ?? '',
                    style: ParticleFont.bodyText1(
                      context,
                      customization: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                  ),
                  trailing: Text(
                    'os: ${StatisticsSingleton().statistics?.version}' ?? '',
                    style: ParticleFont.bodyText1(
                      context,
                      customization: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  // leading: Image.asset('APFD.jpeg'),
                  title: Text('Snippets: ${StatisticsSingleton().statistics?.snippetsSaved}' ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text('Tags: ${StatisticsSingleton().statistics?.tags.length}' ?? ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(
                            'Links: ${StatisticsSingleton().statistics?.relatedLinks.length}' ??
                                ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(
                            'Shares: ${StatisticsSingleton().statistics?.shareableLinks}' ?? ''),
                      ),

                      ///
                      Padding(
                        padding: const EdgeInsets.only(top: 14.0, bottom: 8),
                        child: Text(
                            'People: ${StatisticsSingleton().statistics?.persons.length}' ?? ''),
                      ),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 5.0,
                  ),
                  child: Text(
                    'Products in use: ${StatisticsSingleton().statistics?.origins.length} /5 ',
                    style: ParticleFont.subtitle1(
                      context,
                      customization: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 12.0,
                  ),
                  child: Text(
                    'Time Saved Using Pieces ${StatisticsSingleton().statistics?.timeTaken.round()} seconds',
                    style: ParticleFont.subtitle1(
                      context,
                      customization: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  // leading: Image.asset('APFD.jpeg'),
                  leading: TextButton(
                    child: Image.asset('APFD.jpeg'),
                    onPressed: () async {
                      String linkUrl = 'https://code.pieces.app/install';

                      linkUrl = linkUrl; //Twitter's URL
                      if (await canLaunch(linkUrl)) {
                        await launch(
                          linkUrl,
                        );
                      } else {
                        throw 'Could not launch $linkUrl';
                      }
                    },
                  ),
                  trailing: FloatingActionButton(
                    focusColor: Colors.green,
                    tooltip: 'preferences',
                    hoverColor: Colors.grey,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.settings,
                      size: 25,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return
                            SearchableListView();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

final TextEditingController _textFieldController = TextEditingController();
