// ignore_for_file: omit_local_variable_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations
import 'dart:core';

import 'package:connector_openapi/api/connector_api.dart';
import 'package:connector_openapi/api_client.dart' as connector;
import 'package:core_openapi/api.dart';
import 'package:core_openapi/api/asset_api.dart';
import 'package:core_openapi/api/assets_api.dart' hide Tags;
import 'package:core_openapi/api/persons_api.dart';
import 'package:core_openapi/api/sensitives_api.dart';
import 'package:core_openapi/api/user_api.dart';
import 'package:core_openapi/api/users_api.dart';
import 'package:core_openapi/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:runtime_client/particle.dart';
import 'chart data/boot.dart';
import 'chart data/expaded_widget.dart';
import 'chart data/originPieChart.dart';
import 'chart data/pieChartWidget.dart';
import 'chart data/statistics_singleton.dart';
import 'package:flutter/services.dart';

enum LegendShape { circle, rectangle }

String host = 'http://localhost:1000';
AssetsApi assetsApi = AssetsApi(ApiClient(basePath: host));
AssetApi assetApi = AssetApi(ApiClient(basePath: host));
PersonsApi personsApi = PersonsApi(ApiClient(basePath: host));
ConnectorApi connectorApi = ConnectorApi(connector.ApiClient(basePath: 'http://localhost:1000'));
UsersApi usersApi = UsersApi(ApiClient(basePath: host));
UserApi userApi = UserApi(ApiClient(basePath: host));
SensitivesApi sensitivesApi = SensitivesApi(ApiClient(basePath: host));
TagsApi tagsApi = TagsApi(ApiClient(basePath: host));
WebsitesApi websitesApi = WebsitesApi(ApiClient(basePath: host));

List assetsSnapshot = [];
late Future<List> assetsSnapshotFuture = Boot().getAssets();
ApiClient api = ApiClient(basePath: 'http://localhost:1000');
// var isClassification = StatisticsSingleton().statistics?.classifications.containsKey('') ? 0 : 1;

class HomePagePie extends StatelessWidget {
  HomePagePie({Key? key}) : super(key: key);

  get touchedIndex => -1;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          'Snippets by Language',
          style: ParticleFont.button(context,
              customization: TextStyle(
                color: Colors.white,
              )),
        ),
      ),
      body: Container(
        color: Colors.black12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            SingleChildScrollView(
              child: MyPieChart(),
            ),




            /// SPACER ====================

            // FirstPage(),


          ],
        ),
      ),
    );
  }
}

class GreyTheme {
  static const TextStyle small = TextStyle(
    fontSize: 12,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );
}

class TitleTheme {
  static const TextStyle title = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}

class CellTheme {
  static const SizedBox cellBox = SizedBox(
    // height: ,
    width: 120,
  );
}
