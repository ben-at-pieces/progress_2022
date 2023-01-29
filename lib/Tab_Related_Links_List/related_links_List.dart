import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

import '../appbar_class.dart';
import '../bottom_appbar_class.dart';
import '../checkbox_class.dart';
import '../connections/statistics_singleton.dart';

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
        home: RelatedLinksWidget());
  }
}

class RelatedLinksWidget extends StatelessWidget {
  RelatedLinksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Related Links',
      ),
      body: Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.black54,
          leadingWidth: 400,
          leading: TextButton(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.save,
                    color: Colors.white,
                    size: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      'Save Selected Links',
                      style: ParticleFont.button(context,
                          customization: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            onPressed: () {
             /// TODO select all
              // ClipboardData data = ClipboardData(text: linkUrl);
              // await Clipboard.setData(data);
            },
          ),
        ),
        backgroundColor: Colors.black12,
        body: ListView.builder(
            itemCount: StatisticsSingleton().statistics?.relatedLinks.length,
            itemBuilder: (BuildContext context, int index) {
              String linkUrl = '${StatisticsSingleton().statistics?.relatedLinks[index]}';

              return ListTile(
                subtitle: Row(
                  children: [
                    /// copy =====================================================================
                    IconButton(
                      tooltip: 'copy',
                      splashRadius: 2,
                      icon: Icon(
                        Icons.copy,
                        color: Colors.black,
                        size: 18,
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
                                microseconds: 10),
                          ),
                        );
                        ClipboardData data = ClipboardData(text: linkUrl);
                        await Clipboard.setData(data);
                      },
                    ),

                    /// share =====================================================================
                    IconButton(
                      tooltip: 'go to',
                      splashRadius: 2,
                      icon: Icon(
                        Icons.launch,
                        color: Colors.black,
                        size: 18,
                      ),
                      onPressed: () async {
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
                tileColor: Colors.white,
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SelectableText(
                          linkUrl,
                          style: ParticleFont.micro(context,
                              customization: TextStyle(
                                color: Colors.blueAccent,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                leading: MyCheckBoxWidgget(),
                trailing: Icon(
                  Icons.link,
                  color: Colors.black,
                ),
              );
              // title: Text('Person: $index'));
            }),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
