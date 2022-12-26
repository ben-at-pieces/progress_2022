import 'package:connector_openapi/api.dart';
import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';
import '../chart data/statistics_singleton.dart';
import '../checkbox.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pieTable.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leadingWidth: 150,
        leading: Row(
          children: [

            FloatingActionButton(
              tooltip: 'copy Tags',
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
Related Tags: 
${StatisticsSingleton().statistics?.tags}
''');
                const snackBar = SnackBar(
                  content: Text('Tags copied to clipboard'),
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

        title: Text(
          'User Tags',
          style: ParticleFont.button(context,
              customization: TextStyle(
                color: Colors.white,
              )),
        ),
      ),
      body: Container(
        color: Colors.black12,
        child: ListView.builder(
            itemCount: StatisticsSingleton().statistics?.tags.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                tileColor: Colors.white,
                leading: Icon(
                  Icons.local_offer,
                  color: Colors.black,
                ),
                title: Text(
                  '${StatisticsSingleton().statistics?.tags[index]}  ',
                  style: ParticleFont.bodyText1(context,
                      customization: TextStyle(color: Colors.black)),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
final TextEditingController _textFieldController = TextEditingController();
