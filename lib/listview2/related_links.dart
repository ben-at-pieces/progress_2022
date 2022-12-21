import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';

import '../chart data/statistics_singleton.dart';
import '../checkbox.dart';

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
        home: RelatedLinksWidget());
  }
}

class RelatedLinksWidget extends StatelessWidget {
  RelatedLinksWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black12,
        width: 600,
        child: ListView.builder(
            itemCount: StatisticsSingleton().statistics?.relatedLinks.length,
            itemBuilder: (BuildContext context, int index) {
              String linkUrl = '${StatisticsSingleton().statistics?.relatedLinks[index]}';


              return ListTile(
                tileColor: Colors.white,
               leading: Icon(Icons.dataset_linked, color: Colors.black,),
                title: ParticleButton(
                  backgroundColor: Colors.transparent,
                  textColor: Colors.black,
                  text: linkUrl,
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
                trailing: MyCheckBoxWidgget(),


              );
              // title: Text('Person: $index'));
            }),
      ),
    );
  }
}
