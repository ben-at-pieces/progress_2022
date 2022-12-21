import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';

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
        home: RelatedTagsWidget());
  }
}

class RelatedTagsWidget extends StatelessWidget {
  RelatedTagsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: 600,
        color: Colors.black12,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                  itemCount: StatisticsSingleton().statistics?.tags.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      tileColor: Colors.white,

                      trailing: MyCheckBoxWidgget(),
                      title: Text(
                        '${StatisticsSingleton().statistics?.tags[index]}',
                        style: ParticleFont.bodyText1(context, customization: TextStyle(color: Colors.black)),
                      ),
                      leading: Icon(Icons.local_offer, color: Colors.black,)
                    );
                    // title: Text('Person: $index'));
                  },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
