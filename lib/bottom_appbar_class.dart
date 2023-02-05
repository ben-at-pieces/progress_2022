import 'package:connector_openapi/api.dart';
import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';
import 'tabBar_appbar.dart';

class CustomBottomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: BottomAppBar(
        notchMargin: 5,
        color: Colors.black45,
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              focusColor: Colors.green,
              tooltip: 'create a snippet',
              hoverColor: Colors.grey,
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.add_box_outlined,
                size: 20,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
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
                      content: SizedBox(
                        height: 260,
                        child: Column(
                          children: [
                            Container(
                              color: Colors.white,
                              height: 250,
                              width: 350,
                              child: TextField(
                                autofocus: true,
                                style: ParticleFont.micro(context,
                                    customization:
                                        TextStyle(color: Colors.black, fontSize: 14)),
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
                                  labelStyle: ParticleFont.micro(
                                    context,
                                    customization: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                                  labelText: 'Type something...',
                                  hintStyle: ParticleFont.micro(context,
                                      customization: TextStyle(color: Colors.black)),
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
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: Colors.black54,
                              child: TextButton(
                                child: Text(
                                  'save to pieces',
                                  style: ParticleFont.micro(
                                    context,
                                    customization: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                onPressed: () async {






                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   SnackBar(
                                  //     backgroundColor: Colors.white,
                                  //     content: Text(
                                  //       'Saved',
                                  //       style: ParticleFont.micro(context,
                                  //           customization: TextStyle(
                                  //             color: Colors.green,
                                  //           )),
                                  //     ),
                                  //     duration: Duration(
                                  //         days: 0,
                                  //         hours: 0,
                                  //         minutes: 0,
                                  //         seconds: 1,
                                  //         milliseconds: 30,
                                  //         microseconds: 10),
                                  //   ),
                                  // );
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: Colors.black54,
                              child: TextButton(
                                child: Text(
                                  'close',
                                  style: ParticleFont.micro(
                                    context,
                                    customization: TextStyle(color: Colors.white, fontSize: 12),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
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
            ),  ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}

final TextEditingController _textFieldController = TextEditingController();

const String port = '1000';
const String host = 'http://localhost:$port';

/// Future instance of Connect to be used in connectorApi Tests ->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->
Future<Context> connect() async {
  try {
    return connectorApi.connect(
      seededConnectorConnection: SeededConnectorConnection(
        application: SeededTrackedApplication(
          name: ApplicationNameEnum.gOOGLECHROMEEXTENSIONMV3,
          platform: PlatformEnum.MACOS,
          version: '3.2.0',
        ),
      ),
    );
    // print('======== $connect');
  } catch (err) {
    throw Exception('Error occurred when establishing connection. error:$err');
  }
}
