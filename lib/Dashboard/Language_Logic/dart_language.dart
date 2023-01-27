import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../connections/statistics_singleton.dart';
import '../Buttons/snippet_view.dart';

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
      return Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
              title: Text('You have 0 saved snippets'),
              subtitle: Text(''),
              // trailing: Icon(Icons.copy),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: ListTile(
                // leading: Image.asset('chrome.jpg'),
                leading: TextButton(
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                        text: 'Browse this collection to get started! ----',
                        style: ParticleFont.micro(context,
                            customization: TextStyle(color: Colors.grey)),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Dart Collection',
                            style: ParticleFont.micro(
                              context,
                              customization: TextStyle(color: Colors.blueAccent, fontSize: 22),
                            ),
                          )
                        ]),
                  ),
                  onPressed: () async {
                    String linkUrl =
                        'https://code.pieces.app/collections/dart?os=C67CACB2-1171-48D6-88F4-3363FC54E34C%0A&user=db21f9b1-f7a4-45ba-82c4-5f029e9177d0';

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
                // Text('No worries, check out a Pieces Collection here!'),

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
    } else {
      return Container(
        color: Colors.grey,
        child: ListView.builder(
          itemCount: StatisticsSingleton().statistics?.dart.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: leading,
                    title: Text(title),
                    trailing: TextButton(
                          child: SizedBox(
                            height: 20,
                            child: Image.asset('chatgptSmall.jpeg'),
                          ),
                          onPressed: () async {
                            String linkUrl = 'https://chat.openai.com/chat';

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
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    // leading: Image.asset('batchfile-black.jpg'),
                    subtitle: Row(
                      children: [
                        TextButton(
                          child: SizedBox(
                              height: 40, width: 40, child: Image.asset('pieces_small.jpeg')),
                          onPressed: () async {

                          },
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            '${StatisticsSingleton().statistics?.dart.elementAt(index).name}' ?? '',
                            style: ParticleFont.bodyText1(context,
                                customization: TextStyle(color: Colors.black)),
                          ),
                        ),
                        FloatingActionButton(
                          focusColor: Colors.green,
                          tooltip: 'View Snippet Content',
                          hoverColor: Colors.grey,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.text_snippet_outlined,
                            size: 20,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialogWidget(
                                  // title: '${StatisticsSingleton().statistics?.dart.elementAt(index).name}',
                                  title:
                                      '${StatisticsSingleton().statistics?.dart.elementAt(index).name}',
                                  content:
                                      '${StatisticsSingleton().statistics?.dart.elementAt(index).original.reference?.fragment?.string}',
                                );
                              },
                            );
                          },
                        ),
                        FloatingActionButton(
                          focusColor: Colors.green,
                          tooltip: 'View Tags',
                          hoverColor: Colors.grey,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.local_offer_outlined,
                            size: 20,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialogWidget(
                                  // title: '${StatisticsSingleton().statistics?.dart.elementAt(index).name}',
                                  title:
                                      'Snippet: ${StatisticsSingleton().statistics?.dart.elementAt(index).name} Tags',
                                  content:
                                      '${StatisticsSingleton().statistics?.dart.elementAt(index).tags}',
                                );
                              },
                            );
                          },
                        ),
                        FloatingActionButton(
                          focusColor: Colors.green,
                          tooltip: 'Share Snippet Link',
                          hoverColor: Colors.grey,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.share,
                            size: 20,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialogWidget(
                                  // title: '${StatisticsSingleton().statistics?.dart.elementAt(index).name}',
                                  title:
                                      'Share: ${StatisticsSingleton().statistics?.dart.elementAt(index).name} with your team',
                                  content: '${StatisticsSingleton().statistics?.persons}',
                                );
                              },
                            );
                          },
                        ),
                        FloatingActionButton(
                          focusColor: Colors.green,
                          tooltip: 'View Related Links',
                          hoverColor: Colors.grey,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.link,
                            size: 20,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialogWidget(
                                  // title: '${StatisticsSingleton().statistics?.dart.elementAt(index).name}',
                                  title:
                                      'Snippet: ${StatisticsSingleton().statistics?.dart.elementAt(index).name} Tags',
                                  content:
                                      '${StatisticsSingleton().statistics?.dart.elementAt(index).original.reference?.fragment?.string}',
                                );
                              },
                            );
                          },
                        ),
                        FloatingActionButton(
                          focusColor: Colors.green,
                          tooltip: 'Delete Snippet',
                          hoverColor: Colors.grey,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.black54,
                          ),
                          onPressed: () {

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialogWidget(
                                  // title: '${StatisticsSingleton().statistics?.dart.elementAt(index).name}',
                                  title:
                                      '${StatisticsSingleton().statistics?.dart.elementAt(index).name}',
                                  content:
                                      '${StatisticsSingleton().statistics?.dart.elementAt(index).original.reference?.fragment?.string}',
                                );

                              },
                            );
                          },
                        ),
                      ],
                    ),
                    title: Row(
                      children: [
                        SizedBox(
                          width: 450,
                          child: Text(
                              '${StatisticsSingleton().statistics?.dart.elementAt(index).description}' ??
                                  ''),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      tooltip: 'copy',
                      splashRadius: 2,
                      icon: Icon(
                        Icons.copy,
                        color: Colors.black,
                        size: 20,
                      ),
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Copied to Clipboard',
                            ),
                            duration: Duration(
                                days: 0,
                                hours: 0,
                                minutes: 0,
                                seconds: 1,
                                milliseconds: 30,
                                microseconds: 20),
                          ),
                        );
                        ClipboardData data = ClipboardData(
                            text:
                                '${StatisticsSingleton().statistics?.batch.elementAt(index).original.reference?.fragment?.string?.raw}');
                        await Clipboard.setData(data);
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
}
