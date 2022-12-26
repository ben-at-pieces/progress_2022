import 'package:connector_openapi/api.dart';
import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';

import '../appbar_class.dart';
import '../bottom_appbar_class.dart';
import '../connections/statistics_singleton.dart';
import '../checkbox.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../tabBar_appbar.dart';
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

  Future<Context> connect() async {
    try {
      return connectorApi.connect(
        seededConnectorConnection: SeededConnectorConnection(
          application: SeededTrackedApplication(
            name: ApplicationNameEnum.ULTRA_EDIT,
            platform: PlatformEnum.MACOS,
            version: '1.5.8',
          ),
        ),
      );
      // print('======== $connect');
    } catch (err) {
      throw Exception('Error occurred when establishing connection. error:$err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CutomAppBar(title: 'Related Links',),
      body: Container(
        color: Colors.black12,
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
      bottomNavigationBar: CutomBottomAppBar(),
    );
  }
}
final TextEditingController _textFieldController = TextEditingController();
