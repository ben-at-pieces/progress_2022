import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';

import '../chart data/statistics_singleton.dart';
import '../checkbox.dart';
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
        home: RelatedLinksWidget());
  }
}

class RelatedLinksWidget extends StatelessWidget {
  RelatedLinksWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: FloatingActionButton(
          tooltip: 'copy your Pieces Repo Data',
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
Related Links: 
${StatisticsSingleton().statistics?.relatedLinks}
''');
            const snackBar = SnackBar(
              content: Text('Successfully copied Related Links!'),
            );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            await Clipboard.setData(data);
          },
        ),

        title: Text(
          'Related Links',
          style: ParticleFont.button(context,
              customization: TextStyle(
                color: Colors.white,
              )),
        ),
      ),
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
    );
  }
}
