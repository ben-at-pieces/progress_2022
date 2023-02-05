import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';
import '../appbar_class.dart';
import '../bottom_appbar_class.dart';
import '../checkbox_class.dart';
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
        // title: "ListView.builder",
        theme: ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        // home : new ListViewBuilder(), NO Need To Use Unnecessary New Keyword
        home: TagsListWidget());
  }
}

class TagsListWidget extends StatelessWidget {
  TagsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomAppBar(),
      appBar: CustomAppBar(
        title: 'User Tags',
      ),
      body: Scaffold(
        backgroundColor: Colors.black12,
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
                      'View Related Tags',
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
        body: ListView.builder(
            itemCount: StatisticsSingleton().statistics?.tags.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                tileColor: Colors.white,
                trailing: Icon(
                  Icons.local_offer,
                  color: Colors.black,
                ),
                title: Text(
                  '${StatisticsSingleton().statistics?.tags[index]}  ',
                  style: ParticleFont.bodyText1(
                    context,
                    customization: TextStyle(color: Colors.black),
                  ),
                ),
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
                        ClipboardData data =
                            ClipboardData(text: '${StatisticsSingleton().statistics?.tags[index]}');

                        await Clipboard.setData(data);
                      },
                    ),

                    /// share =====================================================================
                    IconButton(
                      tooltip: 'view suggested snippets',
                      splashRadius: 2,
                      icon: Icon(
                        Icons.launch,
                        color: Colors.black,
                        size: 18,
                      ),
                      onPressed: () async {},
                    ),
                  ],
                ),
                leading: MyCheckBoxWidgget(),
              );
              // title: Text('Person: $index'));
            }),
      ),
    );
  }
}
