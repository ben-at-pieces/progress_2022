// ignore_for_file: prefer__ructors, use_key_in_widget_ructors, prefer_const_constructors, use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';

import '../pie/pie chart/languages_list.dart';
import 'A2_dataMap.dart';

void main() async {
  StreamController.broadcast();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ParticleTheme.lightPalette(context),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<MyStatefulWidget> createState() => MyStream();
}

class MyStream extends State<MyStatefulWidget> {
  /// ===============================================================================
  late final Stream<int> assetCounts = (() {
    late final StreamController<int> controller;
    controller = StreamController<int>(
      sync: true,
      onListen: () async {
        /// ===============================================================================

        await batch_File();
        controller.add(batchFile.first);
        Timer.periodic(Duration(seconds: 1), (timer) {
          controller.sink.add(batchFile.first);
        });

        // print('BatchFile: ${batchFile.first}');
        // await Future<void>.delayed(Duration(seconds: 1));

        /// ===============================================================================

        await c_();
        controller.add(c.first);
        // print('C: ${c.first}');
        // await Future<void>.delayed(Duration(seconds: 1));

        /// ===============================================================================

        await cSharp_();
        controller.add(cSharp.first);
        // print('c#: ${cSharp.first}');
        // await Future<void>.delayed(Duration(seconds: 1));

        /// ===============================================================================

        await yaml_();
        // print('YAML: ${yaml.first}');
        controller.add(yaml.first);
        // await Future<void>.delayed(Duration(seconds: 1));
      },
    );

    return controller.stream.asBroadcastStream();
  })();

  /// ===============================================================================

  @override
  Widget build(BuildContext context) {
    late final StreamController<int> controller;
    return Container(
      alignment: FractionalOffset.center,
      color: Colors.grey,
      child: SizedBox(
        height: 250,
        child: StreamBuilder<int>(
          initialData: 33,
          stream: assetCounts.asBroadcastStream(

              ///Todo =================================================================
              ///ADD REMAINING CLASSIFICATIONS
              ),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            List<Widget> children;
            if (snapshot.data != null) {
              Column(
                children: [
                  Text(
                    '${Languages.elementAt(0)} ${(batchFile.first)}',
                    style: ParticleFont.micro(context),
                  ),
                  Text(
                    '${Languages.elementAt(1)} ${c.first}',
                    style: ParticleFont.micro(context),
                  ),
                  Text(
                    '${Languages.elementAt(2)} ${cSharp.first}',
                    style: ParticleFont.micro(context),
                  ),
                  Text(
                    '${Languages.elementAt(34)} ${yaml.first}',
                    style: ParticleFont.micro(context),
                  ),
                ],
              );
            }
            if (snapshot.hasError) {
              children = <Widget>[
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
              ];
            } else {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  children = <Widget>[
                    Icon(
                      Icons.info,
                      color: Colors.blue,
                      size: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Select a lot'),
                    ),
                  ];
                  break;
                case ConnectionState.waiting:
                  children = <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child:
                          Text('Gathering your Snippets', style: ParticleFont.bodyText1(context)),
                    ),
                  ];
                  break;

                /// ===============================================================
                case ConnectionState.active:
                  children = <Widget>[
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                          Text(
                            '${Languages.elementAt(0)} ${(batchFile.first)}',
                            style: ParticleFont.micro(context),
                          ),
                          Text(
                            '${Languages.elementAt(1)} ${c.first}',
                            style: ParticleFont.micro(context),
                          ),
                          Text(
                            '${Languages.elementAt(2)} ${cSharp.first}',
                            style: ParticleFont.micro(context),
                          ),
                          Text(
                            '${Languages.elementAt(34)} ${yaml.first}',
                            style: ParticleFont.micro(context),
                          ),
                        ],
                      ),
                    ),
                  ];
                  break;
                case ConnectionState.done:
                  children = <Widget>[
                    Icon(
                      Icons.info,
                      color: Colors.blue,
                      size: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('\$${snapshot.data} (closed)'),
                    ),
                  ];
                  break;
              }
            }

            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            );
          },
        ),
      ),
    );
  }
}
