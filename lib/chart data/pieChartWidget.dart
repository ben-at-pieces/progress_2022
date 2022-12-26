// ignore_for_file: omit_local_variable_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'dart:core';
import 'dart:math' as math;
import 'package:connector_openapi/api.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/chart%20data/statistics_singleton.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:runtime_client/particle.dart';
import 'package:flutter/services.dart';

import '../pieTable.dart';
import 'colors.dart';

// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const MyDataTable(),
//       ),
//     );
//   }
// }

class MyPieChart extends StatelessWidget {
  const MyPieChart({super.key});

  get index => imgList1.length;

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
      backgroundColor: Colors.black12,
      appBar: AppBar(
        toolbarHeight: 40,
        leadingWidth: 150,
        leading: Row(
          children: [
            FloatingActionButton(
              tooltip: 'copy your snippet classifications',
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
Snippet Counts by Origin: 
${StatisticsSingleton().statistics?.classifications}

''');
                const snackBar = SnackBar(
                  content: Text(
                    'Successfully copied Snippet Classifications!',
                    style: TextStyle(color: Colors.white),
                  ),
                );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                await Clipboard.setData(data);
              },
            ),
            FloatingActionButton(
              focusColor: Colors.green,
              tooltip: 'create a snippet',
              hoverColor: Colors.grey,
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.add_box_outlined,
                size: 16,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.grey,
                      title: Text(
                        'Create a Custom Snippet:',
                        style: ParticleFont.subtitle1(
                          context,
                          customization: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      content: Column(
                        children: [

                          Container(
                            color: Colors.white,
                            height: 250,
                            width: 450,
                            child: TextField(
                              autofocus: true,
                              style: ParticleFont.micro(context,
                                  customization: TextStyle(color: Colors.black,fontSize: 14)),
                              toolbarOptions: ToolbarOptions(
                                copy: true,
                                paste: true,
                                selectAll: true,
                              ),
                              cursorHeight: 12,
                              cursorColor: Colors.black,
                              minLines: 20,
                              maxLines: 20,
                              autocorrect: true,
                              controller: _textFieldController,
                              decoration: InputDecoration(
                                labelStyle: ParticleFont.micro(context, customization: TextStyle(color: Colors.black, fontSize: 16),),
                                floatingLabelBehavior: FloatingLabelBehavior.auto,
                                labelText: 'Type something...',

                                hintStyle: ParticleFont.micro(context, customization: TextStyle(color: Colors.black)),
                                suffixIcon: Column(
                                  children: [

                                    IconButton(
                                      iconSize: 15,
                                      icon: Icon(
                                        Icons.clear,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        _textFieldController.clear();
                                      },
                                    ),
                                  ],
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: Colors.black54,
                              child: TextButton(
                                child: Text(
                                  'save to pieces',
                                style:  ParticleFont.micro(context, customization: TextStyle(color: Colors.white, fontSize: 12),),                                ),
                                onPressed: () async {
                                  Context connection = await connect();

                                  String create = await connectorApi.create(
                                    connection.application.id,
                                    seededConnectorCreation: SeededConnectorCreation(
                                      asset: SeededConnectorAsset(
                                        metadata: SeededAssetMetadata(
                                          description: 'SNIPPET FROM EXPEDITION',
                                          name: 'PIECES EXPEDITION',
                                          mechanism: MechanismEnum.MANUAL,
                                        ),
                                        format: SeededFormat(
                                          websites: [
                                          ],
                                          fragment: SeededFragment(
                                            metadata: FragmentMetadata(
                                                ext: ClassificationSpecificEnum.dart),
                                            string: TransferableString(
                                              raw: _textFieldController.text,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );

                                  Navigator.of(context).pop();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.white,
                                      content: Text(
                                        'Saved',
                                        style: ParticleFont.micro(context,
                                            customization: TextStyle(
                                              color: Colors.green,
                                            )),
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
                                },
                              ),
                            ),
                          ),
                        ),
                    Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              color: Colors.black54,
                              child: TextButton(
                                child: Text(
                                  'close',
                                  style:  ParticleFont.micro(context, customization: TextStyle(color: Colors.white, fontSize: 12),),                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                        ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        backgroundColor: Colors.black87,
        title: Text(
          'Snippet Classifications',
          style: ParticleFont.button(
            context,
            customization: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 40),
            child: SizedBox(
              height: 200,
              width: 350,
              child: PieChart(
                centerText: 'TOTAL: ${StatisticsSingleton().statistics?.snippetsSaved}',
                ringStrokeWidth: 50,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValuesOutside: true,
                  showChartValueBackground: true,
                  decimalPlaces: 0,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                ),
                emptyColor: Colors.grey,
                baseChartColor: Colors.black45,
                centerTextStyle:
                    TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                key: ValueKey(key),
                dataMap: StatisticsSingleton().statistics!.classifications,
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 40,
                chartRadius: math.min(MediaQuery.of(context).size.width / 1.5, 180),
                colorList: colorList,
                chartType: ChartType.ring,
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.left,
                  showLegends: true,
                  legendShape: true ? BoxShape.circle : BoxShape.rectangle,
                  legendTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 30,
        child: BottomAppBar(
          notchMargin: 5,
          color: Colors.black54,
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              FloatingActionButton(
                tooltip: 'copy user data',
                elevation: 0,
                mini: true,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: 15,
                ),
                onPressed: () async {
                  ClipboardData data = ClipboardData(text: '''
User Name: ${StatisticsSingleton().statistics?.user}
Platform: ${StatisticsSingleton().statistics?.platform}
Version: ${StatisticsSingleton().statistics?.version}''');
                  const snackBar = SnackBar(
                    content: Text(
                      'Successfully saved User data to clipboard!',
                      style: TextStyle(color: Colors.white),
                    ),
                  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  await Clipboard.setData(data);
                },
              ),
              Text(
                '${StatisticsSingleton().statistics?.user}',
                style: ParticleFont.micro(
                  context,
                  customization: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            ],
          ),
        ),
      ),
    );
  }
}



final TextEditingController _textFieldController = TextEditingController();

class Language {
  List languages = [
    'batchfile',
    'c',
    'sharp',
    'coffees',
    'cpp',
    'css',
    'dart',
    'erlang',
    'go',
    'haskell',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'markdown',
    'matlab',
    'objective-c',
    'perl',
    'php',
    'powershell',
    'python',
    'r',
    'ruby',
    'rust',
    'scala',
    'sql',
    'swift',
    'typescript',
    'tex',
    'text',
    'toml',
    'yaml',
  ];
}

List imgList1 = [
  Image.asset('batchfile-black.jpg'),
  Image.asset('c.jpg'),
  Image.asset('c-sharp.jpg'),
  Image.asset('coffeescript-black.jpg'),
  Image.asset('cpp.jpg'),
  Image.asset('css.jpg'),
  Image.asset('dart.jpg'),
  Image.asset('erlang.jpg'),
  Image.asset('go.jpg'),
];

List imgList2 = [
  Image.asset('haskell.jpg'),
  Image.asset('html.jpg'),
  Image.asset('java.jpg'),
  Image.asset('javascript.jpg'),
  Image.asset('json.jpg'),
  Image.asset('lua.jpg'),
  Image.asset('markdown-black.jpg'),
  Image.asset('matlab.jpg'),
  Image.asset('objective-c.jpg'),
];

List imgList3 = [
  Image.asset('objective-c.jpg'),
  Image.asset('perl.jpg'),
  Image.asset('php.jpg'),
  Image.asset('powershell.jpg'),
  Image.asset('python.jpg'),
  Image.asset('r.jpg'),
  Image.asset('ruby.jpg'),
  Image.asset('rust-black.jpg'),
  Image.asset('scala.jpg'),
];
List imgList4 = [
  Image.asset('sql.jpg'),
  Image.asset('swift.jpg'),
  Image.asset('typescript.jpg'),
  Image.asset('tex-black.jpg'),
  Image.asset('text.jpg'),
  Image.asset('toml-black.jpg'),
  Image.asset('yaml-black.jpg'),
];
