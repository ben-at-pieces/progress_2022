import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';

import '../chart data/statistics_singleton.dart';
import '../listview2/related_links.dart';

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
    return Scaffold(
      body: ListView(children: [

        RelatedTagsWidget(),

        /// 1 click testing
        RelatedLinksWidget(),


      ],),
    );
  }
}
