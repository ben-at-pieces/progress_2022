import 'package:connector_openapi/api.dart';
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
                        padding: const EdgeInsets.only(top: 14.0, bottom: 50),
                        child: Text(
                            'People: ${StatisticsSingleton().statistics?.persons.length}' ?? ''),
                      ),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 12.0,
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
                        color: Colors.black54,
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
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text(
                              'Support Center',
                              style: ParticleFont.subtitle1(
                                context,
                                customization: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            content: SizedBox(
                              height: 140,
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.white,
                                    width: 350,
                                    child: TextField(
                                      autofocus: true,
                                      style: ParticleFont.micro(context,
                                          customization:
                                              TextStyle(color: Colors.black, fontSize: 14)),
                                      toolbarOptions: ToolbarOptions(
                                        copy: true,
                                        paste: true,
                                        selectAll: true,
                                      ),
                                      cursorHeight: 12,
                                      cursorColor: Colors.black,
                                      minLines: 1,
                                      maxLines: 2,
                                      autocorrect: true,
                                      controller: _textFieldController,
                                      decoration: InputDecoration(
                                        labelStyle: ParticleFont.micro(
                                          context,
                                          customization:
                                              TextStyle(color: Colors.black, fontSize: 16),
                                        ),
                                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                                        labelText: 'Search Settings...',
                                        hintStyle: ParticleFont.micro(context,
                                            customization: TextStyle(color: Colors.black)),
                                        suffixIcon: Column(
                                          children: [
                                            IconButton(
                                              iconSize: 15,
                                              icon: Icon(
                                                Icons.clear,
                                                color: Colors.grey,
                                              ),
                                              onPressed: () {
                                                _textFieldController.clear();
                                              },
                                            ),
                                          ],
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'FAQs',
                                            style: ParticleFont.subtitle1(
                                              context,
                                              customization: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 30.0),
                                          child: TextButton(
                                            child: Text(
                                              'User Guide',
                                              style: ParticleFont.subtitle1(
                                                context,
                                                customization: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 30.0),
                                          child: TextButton(
                                            child: Text(
                                              'Power Tips',
                                              style: ParticleFont.subtitle1(
                                                context,
                                                customization: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    color: Colors.black54,
                                    child: TextButton(
                                      child: Text(
                                        'close',
                                        style: ParticleFont.micro(
                                          context,
                                          customization:
                                              TextStyle(color: Colors.white, fontSize: 12),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
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
