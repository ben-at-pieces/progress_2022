// ignore_for_file: omit_local_variable_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, use_key_in_widget_constructors

import 'dart:core';

import 'package:connector_openapi/api/connector_api.dart';
import 'package:connector_openapi/api_client.dart' as connector;
import 'package:core_openapi/api/asset_api.dart';
import 'package:core_openapi/api/assets_api.dart' hide Tags;
import 'package:core_openapi/api/user_api.dart';
import 'package:core_openapi/api/users_api.dart';
import 'package:core_openapi/api_client.dart';
import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';

import '../pie/languages/batch_file.dart';
import '../pie/meta_data/boot.dart';
import 'Saved.dart';
import 'bar chart shared/bar chart shared/bar_chart_sample7.dart';
import 'pie chart home/home_page_pie.dart';

enum LegendShape { circle, rectangle }

String host = 'http://localhost:1000';
AssetsApi assetsApi = AssetsApi(ApiClient(basePath: host));
AssetApi assetApi = AssetApi(ApiClient(basePath: host));
ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: 'http://localhost:1000'));
UsersApi usersApi = UsersApi(ApiClient(basePath: host));
UserApi userApi = UserApi(ApiClient(basePath: host));
List assetsSnapshot = [];
late Future<List> assetsSnapshotFuture = Boot().getAssets();
ApiClient api = ApiClient(basePath: 'http://localhost:1000');
BatchFileSnips launch = BatchFileSnips(api: api);
// Coffee__Snips launch3 = Coffee__Snips(api: api);
// void main() async {
//   // double bats = await launch.run();
//   // double coffee = await launch.run();
// }

class HomePageAppBar extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePageAppBar> {
  ApiClient api = ApiClient(basePath: 'http://localhost:1000');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assetsSnapshotFuture.then((value) {
      assetsSnapshot = value;
      setState(() {});
    });
  }

  int key = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Text('Classifications',
                    style: ParticleFont.micro(context,
                        customization:
                            TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
                Text('Saved',
                    style: ParticleFont.micro(context,
                        customization:
                            TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
                Text('Shared',
                    style: ParticleFont.micro(context,
                        customization:
                            TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
                // Text('Modified',
                //     style: ParticleFont.micro(context,
                //         customization:
                //             TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
              ],
            ), // TabBar
            backgroundColor: Colors.white30,
          ), // AppBar
          body: TabBarView(
            children: [
              BarGraph(),
              HomePagePie(),
              SavedPie(),

              // Icon(Icons.grade),
            ],
          ), // TabBarView
        ), // Scaffold
      ), // DefaultTabController
    ); // MaterialApp
  }
}

final TextEditingController newNameController = TextEditingController();
