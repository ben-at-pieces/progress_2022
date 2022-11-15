// ignore_for_file: prefer_const_constructors

import 'package:connector_openapi/api.dart';

/// api connections
import 'package:connector_openapi/api_client.dart' as connector;
import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';

/// connections

/// homepage utilities

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pieces Pie!"),
        backgroundColor: Colors.green,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Add a Piece"),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                color: Colors.black54,
                                height: 300,
                                width: 300,
                                child: TextField(
                                  autofocus: false,
                                  style: ParticleFont.micro(context),
                                  // ignore: prefer_const_constructors
                                  toolbarOptions: ToolbarOptions(
                                    copy: true,
                                    paste: true,
                                    selectAll: true,
                                  ),
                                  cursorHeight: 20,
                                  cursorColor: Colors.white,
                                  minLines: 20,
                                  maxLines: 20,
                                  autocorrect: true,
                                  controller: _textFieldController,
                                  decoration: InputDecoration(
                                    labelStyle: ParticleFont.micro(
                                      context,
                                      customization: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    labelText: 'save to Pieces...',
                                    floatingLabelStyle: ParticleFont.micro(context,
                                        customization: TextStyle(
                                          color: Colors.grey,
                                        )),
                                    // border: OutlineInputBorder(),
                                    hintStyle: ParticleFont.micro(context),

                                    /// delete button
                                    prefixIcon: Column(
                                      children: [
                                        IconButton(
                                          iconSize: 12,
                                          icon: Icon(
                                            Icons.clear,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            _textFieldController.clear();
                                          },
                                        ),
                                      ],
                                    ),

                                    /// send button
                                    suffixIcon: Column(
                                      children: [
                                        IconButton(
                                          iconSize: 15,
                                          icon: Icon(
                                            Icons.send_outlined,
                                            color: Colors.white,
                                          ),
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
                                                      SeededWebsite(
                                                        asset: '',
                                                        url: 'www.pieces.app',
                                                        name: '',
                                                      ),
                                                    ],
                                                    fragment: SeededFragment(
                                                      metadata: FragmentMetadata(
                                                          ext: ClassificationSpecificEnum.text),
                                                      string: TransferableString(
                                                        raw: _textFieldController.text,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );

                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                backgroundColor: Colors.white,
                                                content: Text(
                                                  'Saved to Pieces!',
                                                  style: ParticleFont.subtitle1(
                                                    context,
                                                    customization: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 15,
                                                    ),
                                                  ),
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
                                            _textFieldController.clear();
                                          },
                                        ),
                                      ],
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Colors.green,
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay"),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: const Text("Show alert Dialog box"),
          ),
        ),
      ),
    );
  }
}

ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: 'http://localhost:1000'));

Future<Context> connect() async {
  try {
    return connectorApi.connect(
      seededConnectorConnection: SeededConnectorConnection(
        application: SeededTrackedApplication(
          name: ApplicationNameEnum.PIECES_FOR_DEVELOPERS,
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

final TextEditingController _textFieldController = TextEditingController();
