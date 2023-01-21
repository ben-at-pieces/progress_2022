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

import 'Card_Tab/card_list.dart';
import 'Dashboard/textSpan.dart';
import 'Tab_Activity_Bar_Chart/bar_chart.dart';
import 'Tab_Origin_Pie_Chart/originPieChart.dart';
import 'Tab_Peoples_List/peoples_list.dart';
import 'Tab_Plugins_and_More/plugins_and_more.dart';
import 'Tab_Related_Links_List/related_links_List.dart';
import 'Tab_Tags_List/tags_list.dart';
import 'connections/boot.dart';
import 'Language_Pie_List/pieChartWidget.dart';
import 'jscon_converter/main.dart';
import 'jscon_converter/tree_from_json.dart';

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

class HomePageAppBar extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePageAppBar> {
  ApiClient api = ApiClient(basePath: 'http://localhost:1000');

  int key = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 9,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Text(
                  'Home',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Snippets',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Origins',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Activity',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Tags',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Links',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'People',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Plugins',
                  textWidthBasis: TextWidthBasis.parent,
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'JSON',
                  textWidthBasis: TextWidthBasis.parent,
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ), // TabBar
          ), // AppBar
          body: TabBarView(
            children: [

              /// Home Dash
              MyDashBoard(),
              /// Language Pie Chart ==========================================================
              MyPieChart(),

              /// origin classification ==========================================================
              OriginChart(),

              /// Vertical bar graph ==========================================================
              BarGraph(),

              /// Related TAGS ==========================================================
              TagsListWidget(),

              /// Related Links ==========================================================
              RelatedLinksWidget(),

              /// Related Links ==========================================================
              PeoplesListWidget(),

              /// Plugins & More ==========================================================
              Plugins(),

              /// json ===================================================================
              TreeFromJson(),
            ],
          ), // TabBarView
        ), // Scaffold
      ), // DefaultTabController
    );
  }
}
