import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';

import '../chart data/statistics_singleton.dart';

void main() => runApp( MyApp());

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
        home:  RelatedLinksWidget());
  }
}

class RelatedLinksWidget extends StatelessWidget {
  RelatedLinksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount:  StatisticsSingleton().statistics?.relatedLinks.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              tileColor: Colors.white,
              trailing:  Icon(Icons.mail_outlined, color: Colors.grey,),
              title:  Text(
                '${StatisticsSingleton().statistics?.relatedLinks[index]}',
                style: ParticleFont.bodyText1(context, customization: TextStyle(color: Colors.black)),
              ),
              leading: Text('🔗', style: ParticleFont.subtitle1(context),),);
            // title: Text('Person: $index'));
          }),
    );
  }
}
