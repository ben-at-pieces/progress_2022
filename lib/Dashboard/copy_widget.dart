import 'package:connector_openapi/api.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/Dashboard/settings_bar.dart';
import 'package:runtime_client/particle.dart';


import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../connections/statistics_singleton.dart';
import '../tabBar_appbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FloatingCopyButton(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FloatingCopyButton extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FloatingCopyButton> {
  int? index = StatisticsSingleton().statistics?.python.length;

  @override
  Widget build(BuildContext context) {
    return
              AlertDialog(
                titleTextStyle: ParticleFont.micro(context),
                backgroundColor: Colors.white,
                title: Row(
                  children: [SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset('icon_path_black.png'),
                  ),
                    Text(
                      'Pro Tips',
                      style: ParticleFont.subtitle2(
                        context,
                        customization: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                content: SearchableListView(),
                // content:



              );
  }
}
final TextEditingController _textFieldController = TextEditingController();
