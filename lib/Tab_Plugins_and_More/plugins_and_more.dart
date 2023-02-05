import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';
import 'package:runtime_client/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../appbar_class.dart';
import '../bottom_appbar_class.dart';
import '../connections/statistics_singleton.dart';
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
        home: Plugins());
  }
}

class Plugins extends StatelessWidget {
  Plugins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      bottomNavigationBar: CustomBottomAppBar(),
      appBar: CustomAppBar(
        title: 'Plugins & More',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),

            /// =========================================
            child: Row(
              children: [
                SizedBox(
                  height: 200,
                  width: 120,
                  child: ListView(
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.auto_awesome),

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
                                    color: Colors.grey,
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
                            SizedBox(
                                height: 25,
                                width: 25,
                                child: Image.asset('roundedpfd.png')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 165,
                  child: ListView(
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.devices_outlined),


                          Text(
                            'Develop',
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
                                    color: Colors.grey,
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
                            SizedBox(height: 25, width: 25, child: Image.asset('vscode.png')),
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
                                  color: Colors.grey,
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
                          SizedBox(height: 25, width: 25, child: Image.asset('jetbrains.png')),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 170,
                  child: ListView(
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [

                              Icon(Icons.auto_fix_high),

                              Text(
                                'Enhance',
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
                                    color: Colors.grey,
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
                                  color: Colors.grey,
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
                                  color: Colors.grey,
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
                  height: 200,
                  width: 150,
                  child: ListView(
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.travel_explore_outlined),

                              Text(
                                'Browse',
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
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            TextButton(
                              child: Text(
                                'Pieces for Chrome',
                                style: ParticleFont.micro(
                                  context,
                                  customization: TextStyle(
                                    color: Colors.grey,
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
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: Image.asset('Chrome.png'),
                            ),      ],
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
                                  color: Colors.grey,
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
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: Image.asset('Safari.png'),
                          ),     ],
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
                                  color: Colors.grey,
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
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: Image.asset('Firefox.png'),
                          ),     ],
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
                                  color: Colors.grey,
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
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: Image.asset('brave.jpg'),
                          ),     ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: TextButton(

                    child: Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset('pfd.png'),
                        ),
                        Text(
                          '',
                          style: ParticleFont.micro(
                            context,
                            customization: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
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
                ),
                /// linkedin

                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: TextButton(

                    child: Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset('linkedin.png'),
                        ),
                        Text(
                          '',
                          style: ParticleFont.micro(
                            context,
                            customization: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
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
                ),

                /// twitter
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: TextButton(

                    child: Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset('twitter.png'),
                        ),
                        Text(
                          '',
                          style: ParticleFont.micro(
                            context,
                            customization: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
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
                ),

                /// facebook
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: TextButton(

                    child: Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset('facebook.png'),
                        ),
                        Text(
                          '',
                          style: ParticleFont.micro(
                            context,
                            customization: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () async {
                      String linkUrl = 'https://www.facebook.com/524508470288885/posts/559057106234021';

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
                ),

                /// pfdgpt
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: TextButton(

                    child: Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('github.png'),
                        ),
                        Text(
                          '',
                          style: ParticleFont.micro(
                            context,
                            customization: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
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
                ),

                /// github
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: TextButton(

                    child: Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('black_GPT.png'),
                        ),
                        Text(
                          '',
                          style: ParticleFont.micro(
                            context,
                            customization: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
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
                ),

              ],
            ),
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     SizedBox(
          //       height: 120,
          //       width: 50,
          //       child: ListView(
          //         // scrollDirection: Axis.vertical,
          //         children: [
          //           // showing list of images
          //           for (var item in imgList1)
          //             SizedBox(
          //               height: 40,
          //               width: 50,
          //               child: IconButton(
          //                 icon: item,
          //                 // tooltip: 'named language',
          //                 onPressed: () => showDialog<String>(
          //                   context: context,
          //                   builder: (BuildContext context) => AlertDialog(
          //                     title: Text('Show Suggestions or other useful shit}'),
          //                     content: const Text('AlertDialog description'),
          //                     actions: <Widget>[
          //                       TextButton(
          //                         onPressed: () => Navigator.pop(context, 'Cancel'),
          //                         child: const Text('Cancel'),
          //                       ),
          //                       TextButton(
          //                         onPressed: () => Navigator.pop(context, 'OK'),
          //                         child: const Text('OK'),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 120,
          //       width: 50,
          //       child: ListView(
          //         // scrollDirection: Axis.vertical,
          //         children: [
          //           // showing list of images
          //           for (var item in imgList2)
          //             SizedBox(
          //                 height: 40,
          //                 width: 50,
          //                 child: IconButton(
          //                   icon: item,
          //                   // tooltip: 'named language',
          //                   onPressed: () => showDialog<String>(
          //                     context: context,
          //                     builder: (BuildContext context) => AlertDialog(
          //                       title: Text('TOTAL: ${Language().languages}'),
          //                       content: const Text('AlertDialog description'),
          //                       actions: <Widget>[
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'Cancel'),
          //                           child: const Text('Cancel'),
          //                         ),
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'OK'),
          //                           child: const Text('OK'),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 )),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 120,
          //       width: 50,
          //       child: ListView(
          //         // scrollDirection: Axis.vertical,
          //         children: [
          //           // showing list of images
          //           for (var item in imgList3)
          //             SizedBox(
          //                 height: 40,
          //                 width: 50,
          //                 child: IconButton(
          //                   icon: item,
          //                   // tooltip: 'named language',
          //                   onPressed: () => showDialog<String>(
          //                     context: context,
          //                     builder: (BuildContext context) => AlertDialog(
          //                       title: Text('TOTAL: ${Language().languages}'),
          //                       content: const Text('AlertDialog description'),
          //                       actions: <Widget>[
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'Cancel'),
          //                           child: const Text('Cancel'),
          //                         ),
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'OK'),
          //                           child: const Text('OK'),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 )),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 120,
          //       width: 50,
          //       child: ListView(
          //         // scrollDirection: Axis.vertical,
          //         children: [
          //           // showing list of images
          //           for (var item in imgList4)
          //             SizedBox(
          //                 height: 40,
          //                 width: 50,
          //                 child: IconButton(
          //                   icon: item,
          //                   // tooltip: 'named language',
          //                   onPressed: () => showDialog<String>(
          //                     context: context,
          //                     builder: (BuildContext context) => AlertDialog(
          //                       title: Text('TOTAL: ${Language().languages}'),
          //                       content: const Text('AlertDialog description'),
          //                       actions: <Widget>[
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'Cancel'),
          //                           child: const Text('Cancel'),
          //                         ),
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'OK'),
          //                           child: const Text('OK'),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 )),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 120,
          //       width: 50,
          //       child: ListView(
          //         // scrollDirection: Axis.vertical,
          //         children: [
          //           // showing list of images
          //           for (var item in imgList5)
          //             SizedBox(
          //                 height: 40,
          //                 width: 50,
          //                 child: IconButton(
          //                   icon: item,
          //                   // tooltip: 'named language',
          //                   onPressed: () => showDialog<String>(
          //                     context: context,
          //                     builder: (BuildContext context) => AlertDialog(
          //                       title: Text('TOTAL: ${Language().languages}'),
          //                       content: const Text('AlertDialog description'),
          //                       actions: <Widget>[
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'Cancel'),
          //                           child: const Text('Cancel'),
          //                         ),
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'OK'),
          //                           child: const Text('OK'),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 )),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 120,
          //       width: 50,
          //       child: ListView(
          //         // scrollDirection: Axis.vertical,
          //         children: [
          //           // showing list of images
          //           for (var item in imgList6)
          //             SizedBox(
          //                 height: 40,
          //                 width: 50,
          //                 child: IconButton(
          //                   icon: item,
          //                   // tooltip: 'named language',
          //                   onPressed: () => showDialog<String>(
          //                     context: context,
          //                     builder: (BuildContext context) => AlertDialog(
          //                       title: Text('TOTAL: ${Language().languages}'),
          //                       content: const Text('AlertDialog description'),
          //                       actions: <Widget>[
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'Cancel'),
          //                           child: const Text('Cancel'),
          //                         ),
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'OK'),
          //                           child: const Text('OK'),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 )),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 120,
          //       width: 50,
          //       child: ListView(
          //         // scrollDirection: Axis.vertical,
          //         children: [
          //           // showing list of images
          //           for (var item in imgList7)
          //             SizedBox(
          //                 height: 40,
          //                 width: 50,
          //                 child: IconButton(
          //                   icon: item,
          //                   // tooltip: 'named language',
          //                   onPressed: () => showDialog<String>(
          //                     context: context,
          //                     builder: (BuildContext context) => AlertDialog(
          //                       title: Text('TOTAL: ${Language().languages}'),
          //                       content: const Text('AlertDialog description'),
          //                       actions: <Widget>[
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'Cancel'),
          //                           child: const Text('Cancel'),
          //                         ),
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'OK'),
          //                           child: const Text('OK'),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 )),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 120,
          //       width: 50,
          //       child: ListView(
          //         // scrollDirection: Axis.vertical,
          //         children: [
          //           // showing list of images
          //           for (var item in imgList8)
          //             SizedBox(
          //                 height: 40,
          //                 width: 50,
          //                 child: IconButton(
          //                   icon: item,
          //                   // tooltip: 'named language',
          //                   onPressed: () => showDialog<String>(
          //                     context: context,
          //                     builder: (BuildContext context) => AlertDialog(
          //                       title: Text('TOTAL: ${Language().languages}'),
          //                       content: const Text('AlertDialog description'),
          //                       actions: <Widget>[
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'Cancel'),
          //                           child: const Text('Cancel'),
          //                         ),
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'OK'),
          //                           child: const Text('OK'),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 )),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 120,
          //       width: 50,
          //       child: ListView(
          //         // scrollDirection: Axis.vertical,
          //         children: [
          //           // showing list of images
          //           for (var item in imgList9)
          //             SizedBox(
          //                 height: 40,
          //                 width: 50,
          //                 child: IconButton(
          //                   icon: item,
          //                   // tooltip: 'named language',
          //                   onPressed: () => showDialog<String>(
          //                     context: context,
          //                     builder: (BuildContext context) => AlertDialog(
          //                       title: Text('TOTAL: ${Language().languages}'),
          //                       content: const Text('AlertDialog description'),
          //                       actions: <Widget>[
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'Cancel'),
          //                           child: const Text('Cancel'),
          //                         ),
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'OK'),
          //                           child: const Text('OK'),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 )),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 120,
          //       width: 50,
          //       child: ListView(
          //         // scrollDirection: Axis.vertical,
          //         children: [
          //           // showing list of images
          //           for (var item in imgList10)
          //             SizedBox(
          //                 height: 40,
          //                 width: 50,
          //                 child: IconButton(
          //                   icon: item,
          //                   // tooltip: 'named language',
          //                   onPressed: () => showDialog<String>(
          //                     context: context,
          //                     builder: (BuildContext context) => AlertDialog(
          //                       title: Text('TOTAL: ${Language().languages}'),
          //                       content: const Text('AlertDialog description'),
          //                       actions: <Widget>[
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'Cancel'),
          //                           child: const Text('Cancel'),
          //                         ),
          //                         TextButton(
          //                           onPressed: () => Navigator.pop(context, 'OK'),
          //                           child: const Text('OK'),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 )),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),

          // https://www.facebook.com/524508470288885/posts/559057106234021
        ],
      ),
    );
  }
}

// https://www.codeplusplus.app/
//https://www.facebook.com/getpieces?hc_ref=ARTty9yMKDnC6EOC_dukOB8gsP09WwI5IUY7joQePSgH_eL8mwtbaDQcRwGymY7PSgI&fref=nf&__xts__[0]=68.ARArJRvE3X4gZQbgIIJ4o3jEHlG8obp9EF2jC70I6Z9Jc_ol75UDquczKVgZGoc2Vmky-PzPlcPQD26uZUlAcXu48nDQl8gEO_Wd7V1Bhg8rHq0NxfvuuOul8XypYOy86m8gtisqe_3AF5bZLImHCtbtasfrtvxTXtPCoFClqP6TIxHJp0PUXROvHGV-1doBtEBlqJ9BxPWUpefeLXNO8KgafE7V3M_ohQi7ZEheRc1y4Zi02St-vdArwbzSkmsl6qDh-KFPJqLVDlztD4sk_OPsRlxFvukPVrGRFFA68UpjKJpPmaI
class Language {
  List languages = [
    'batchfile',
    'c',
    'sharp',
    'coffees',
    'cpp',
    'css',
    'dart',
    'erlang',
    'go',
    'haskell',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'markdown',
    'matlab',
    'objective-c',
    'perl',
    'php',
    'powershell',
    'python',
    'r',
    'ruby',
    'rust',
    'scala',
    'sql',
    'swift',
    'typescript',
    'tex',
    'text',
    'toml',
    'yaml',
  ];
}

List imgList1 = [
  Image.asset('batchfile-black.jpg'),
  Image.asset('c.jpg'),
  Image.asset('c-sharp.jpg'),
];
List imgList2 = [
  Image.asset('coffeescript-black.jpg'),
  Image.asset('cpp.jpg'),
  Image.asset('css.jpg'),
];

List imgList3 = [
  Image.asset('dart.jpg'),
  Image.asset('erlang.jpg'),
  Image.asset('go.jpg'),
];

List imgList4 = [
  Image.asset('haskell.jpg'),
  Image.asset('html.jpg'),
  Image.asset('java.jpg'),
];

List imgList5 = [
  Image.asset('javascript.jpg'),
  Image.asset('json.jpg'),
  Image.asset('lua.jpg'),
];

List imgList6 = [
  Image.asset('markdown-black.jpg'),
  Image.asset('matlab.jpg'),
  Image.asset('objective-c.jpg'),
];

List imgList7 = [
  Image.asset('r.jpg'),
  Image.asset('ruby.jpg'),
  Image.asset('rust-black.jpg'),
];

List imgList8 = [
  Image.asset('scala.jpg'),
  Image.asset('sql.jpg'),
  Image.asset('swift.jpg'),
];

List imgList9 = [
  Image.asset('typescript.jpg'),
  Image.asset('tex-black.jpg'),
  Image.asset('text.jpg'),
];

List imgList10 = [
  Image.asset('toml-black.jpg'),
  Image.asset('yaml-black.jpg'),
];
