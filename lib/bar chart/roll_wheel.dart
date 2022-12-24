import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';
import 'package:runtime_client/utils.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${StatisticsSingleton().statistics?.user}',
                    style: ParticleFont.micro(
                      context,
                      customization: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              ),
              Icon(
                Icons.bolt_sharp,
                color: Colors.white,
              ),
              TextButton(
                child: Text(
                  'Powered by Pieces Runtime',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(
                      color: Colors.grey,
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
        backgroundColor: Colors.black87,
        leading: FloatingActionButton(
          tooltip: 'copy these links',
          elevation: 0,
          mini: true,
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.copy,
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

Pieces for Developers Desktop App: 
https://code.pieces.app/install

Pieces for Visual Studio Code: MarketPlace
https://marketplace.visualstudio.com/items?itemName=MeshIntelligentTechnologiesInc.pieces-vscode

Pieces for JetBrains: MarketPlace
https://plugins.jetbrains.com/plugin/17328-pieces--save-search-share--reuse-code-snippets

Pieces Code From ScreenShot Link
https://www.codefromscreenshot.com/

Pieces Text From ScreenShot Link
https://www.textfromscreenshot.com/

Pieces Better Code for Slack
https://www.codeplusplus.app/

Pieces from Chrome Web Extension
https://code.pieces.app/save-code-snippets

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                SizedBox(
                  height: 250,
                  width: 120,
                  child: ListView(
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pieces',
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
                                'Desktop App',
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
                  height: 250,
                  width: 165,
                  child: ListView(
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'IDE',
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
                  height: 250,
                  width: 170,
                  child: ListView(
                    padding: const EdgeInsets.all(10),
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
                          Icon(Icons.screenshot_monitor_outlined),
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
                  height: 250,
                  width: 150,
                  child: ListView(
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Browsers',
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
                                String linkUrl =
                                    'https://chrome.google.com/webstore/detail/pieces-save-code-snippets/igbgibhbfonhmjlechmeefimncpekepm';

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
                              String linkUrl = '';

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
                              String linkUrl = '';

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
                              String linkUrl = '';

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
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.black87,
                          ),
                        ),
                        child: Text(
                          'Pieces.app',
                          style: ParticleFont.micro(
                            context,
                            customization: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.black87,
                          ),
                        ),
                        child: Text(
                          'LinkedIn',
                          style: ParticleFont.micro(
                            context,
                            customization: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          String linkUrl = 'https://www.linkedin.com/company/getpieces/mycompany/';

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
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.black87,
                          ),
                        ),
                        child: Text(
                          'Twitter',
                          style: ParticleFont.micro(
                            context,
                            customization: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          String linkUrl = 'https://twitter.com/getpieces';

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
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.black87,
                          ),
                        ),
                        child: Text(
                          'Facebook',
                          style: ParticleFont.micro(
                            context,
                            customization: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          String linkUrl =
                              'https://www.facebook.com/518508470288885/posts/559057106234021';

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
              ],
            ),
          ),
          // https://www.facebook.com/518508470288885/posts/559057106234021
        ],
      ),
    );
  }
}
// https://www.codeplusplus.app/
//https://www.facebook.com/getpieces?hc_ref=ARTty9yMKDnC6EOC_dukOB8gsP09WwI5IUY7joQePSgH_eL8mwtbaDQcRwGymY7PSgI&fref=nf&__xts__[0]=68.ARArJRvE3X4gZQbgIIJ4o3jEHlG8obp9EF2jC70I6Z9Jc_ol75UDquczKVgZGoc2Vmky-PzPlcPQD26uZUlAcXu48nDQl8gEO_Wd7V1Bhg8rHq0NxfvuuOul8XypYOy86m8gtisqe_3AF5bZLImHCtbtasfrtvxTXtPCoFClqP6TIxHJp0PUXROvHGV-1doBtEBlqJ9BxPWUpefeLXNO8KgafE7V3M_ohQi7ZEheRc1y4Zi02St-vdArwbzSkmsl6qDh-KFPJqLVDlztD4sk_OPsRlxFvukPVrGRFFA68UpjKJpPmaI
