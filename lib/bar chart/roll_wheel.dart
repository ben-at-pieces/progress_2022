import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';
import '../chart data/statistics_singleton.dart';
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
        title: "ListView.builder",
        theme: ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        // home : new ListViewBuilder(), NO Need To Use Unnecessary New Keyword
        home: Menu());
  }
}

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      bottomNavigationBar: SizedBox(
        height: 30,
        child: BottomAppBar(
          notchMargin: 5,
          color: Colors.black54,
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.bolt_sharp, color: Colors.white,),
              TextButton(
                child: Text(
                  'Powered by Pieces Runtime',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
                onPressed: () async {
                  String linkUrl = 'https://www.runtime.dev/';

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
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        leading: FloatingActionButton(
          tooltip: 'copy your Pieces Repo Data',
          elevation: 0,
          mini: true,
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.info_outline,
            color: Colors.white,
            size: 15,
          ),
          onPressed: () async {
            ClipboardData data = ClipboardData(text: '''
User Name: ${StatisticsSingleton().statistics?.user}
Platform: ${StatisticsSingleton().statistics?.platform}
Version: ${StatisticsSingleton().statistics?.version}
  .--.      .-'.      .--.      .--.      .--.      .--.      .`-.      .--.
:::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
'      `--'      `.-'      `--'      `--'      `--'      `-.'      `--'      `

Shareable Link count: 
${StatisticsSingleton().statistics?.shareableLinks}
  .--.      .-'.      .--.      .--.      .--.      .--.      .`-.      .--.
:::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
'      `--'      `.-'      `--'      `--'      `--'      `-.'      `--'      `

Related Tags: 
${StatisticsSingleton().statistics?.tags}
  .--.      .-'.      .--.      .--.      .--.      .--.      .`-.      .--.
:::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
'      `--'      `.-'      `--'      `--'      `--'      `-.'      `--'      `

Related Links: 
${StatisticsSingleton().statistics?.relatedLinks}
  .--.      .-'.      .--.      .--.      .--.      .--.      .`-.      .--.
:::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
'      `--'      `.-'      `--'      `--'      `--'      `-.'      `--'      `

Related People: 
${StatisticsSingleton().statistics?.persons}
  .--.      .-'.      .--.      .--.      .--.      .--.      .`-.      .--.
:::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
'      `--'      `.-'      `--'      `--'      `--'      `-.'      `--'      `

Snippet Counts by Origin: 
${StatisticsSingleton().statistics?.origins}

  .--.      .-'.      .--.      .--.      .--.      .--.      .`-.      .--.
:::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
'      `--'      `.-'      `--'      `--'      `--'      `-.'      `--'      `
''');
            const snackBar = SnackBar(
              content: Text('Copied your repo information!'),
            );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            await Clipboard.setData(data);
          },
        ),
        title: Text(
          'Plugins & More!',
          style: ParticleFont.button(context,
              customization: TextStyle(
                color: Colors.white,
              )),
        ),
      ),
      body: Row(
        children: [
          SizedBox(
            height: 380,
            width: 170,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get Started',
                      style: ParticleFont.micro(
                        context,
                        customization: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text(
                          'Pieces Desktop App',
                          style: ParticleFont.micro(
                            context,
                            customization: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                      Icon(Icons.install_desktop),
                    ],
                  ),
                ),


              ],
            ),
          ),
          SizedBox(
            height: 400,
            width: 170,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Master your IDE',
                      style: ParticleFont.micro(
                        context,
                        customization: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text(
                          'Pieces for VS Code',
                          style: ParticleFont.micro(
                            context,
                            customization: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          String linkUrl =
                              'https://marketplace.visualstudio.com/items?itemName=MeshIntelligentTechnologiesInc.pieces-vscode';

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
                      Icon(Icons.laptop_chromebook),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        'Pieces for JetBrains',
                        style: ParticleFont.micro(
                          context,
                          customization: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        String linkUrl =
                            'https://plugins.jetbrains.com/plugin/17328-pieces--save-search-share--reuse-code-snippets';

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
                    Icon(Icons.laptop_chromebook),
                  ],
                ),


              ],
            ),
          ),
          SizedBox(
            height: 400,
            width: 195,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Enhancements',
                      style: ParticleFont.micro(
                        context,
                        customization: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text(
                          'Code From Screenshot',
                          style: ParticleFont.micro(
                            context,
                            customization: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          String linkUrl = 'https://www.codefromscreenshot.com/';

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
                      Icon(Icons.screenshot_monitor_outlined),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        'Text From Screenshot',
                        style: ParticleFont.micro(
                          context,
                          customization: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        String linkUrl = 'https://www.textfromscreenshot.com/';

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
                    Icon(Icons.fit_screen_sharp),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        'Better Code for Slack',
                        style: ParticleFont.micro(
                          context,
                          customization: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        String linkUrl = 'https://www.codeplusplus.app/';

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
                    Icon(Icons.developer_mode_sharp),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 400,
            width: 170,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Browser Support',
                      style: ParticleFont.micro(
                        context,
                        customization: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text(
                          ' Pieces for Chrome',
                          style: ParticleFont.micro(
                            context,
                            customization: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          String linkUrl = 'https://code.pieces.app/save-code-snippets';

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
                      Icon(Icons.language),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        'Pieces for Safari',
                        style: ParticleFont.micro(
                          context,
                          customization: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        String linkUrl = 'https://code.pieces.app/save-code-snippets';

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
                    Icon(Icons.language),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        'Pieces for FireFox',
                        style: ParticleFont.micro(
                          context,
                          customization: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        String linkUrl = 'https://code.pieces.app/save-code-snippets';

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
                    Icon(Icons.language),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        'Pieces for Brave',
                        style: ParticleFont.micro(
                          context,
                          customization: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        String linkUrl = 'https://code.pieces.app/save-code-snippets';

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
                    Icon(Icons.language),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// https://www.codeplusplus.app/