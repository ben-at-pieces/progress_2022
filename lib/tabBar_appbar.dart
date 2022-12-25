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
import 'package:gsheets/chart%20data/originPieChart.dart';
import 'package:gsheets/listview2/related_links.dart';
import 'package:gsheets/pieTable.dart';
import 'package:gsheets/snippet_specifics.dart';
import 'package:runtime_client/particle.dart';

import 'bar chart/bar_chart.dart';
import 'bar chart/roll_wheel.dart';
import 'chart data/boot.dart';
import 'chart data/pieChartWidget.dart';
import 'gridview_draggable/gridview.dart';
import 'listview1/list_widget.dart';
import 'listview3/tags.dart';
import 'listview4/testing.dart';

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
        length: 8,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: TabBar(
              indicatorColor: Colors.white,

              tabs: [
                Text(
                  'Snippets',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(color: Colors.white, ),
                  ),
                ),          Text(
                  'Origins',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(color: Colors.white, ),
                  ),
                ),

                Text(
                  'Activity',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(color: Colors.white, ),
                  ),
                ),

                /// TODO implement 3rd tab ======================================================

                Text(
                  'Tags',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(color: Colors.white, ),
                  ),
                ),
                Text(
                  'Links',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(color: Colors.white, ),
                  ),
                ),

                Text(
                  'People',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(color: Colors.white, ),
                  ),
                ),
                Text(
                  'Plugins',
                  textWidthBasis: TextWidthBasis.parent,
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(color: Colors.white, ),
                  ),
                ),
                Text(
                  'Viewer',
                  textWidthBasis: TextWidthBasis.parent,
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(color: Colors.white, ),
                  ),
                ),
              ],
            ), // TabBar
          ), // AppBar
          body: TabBarView(
            children: [
              /// Circular Pie Chart ==========================================================
                   // HomePagePie(),
              MyPieChart(),
              /// origin classification ==========================================================
              OriginChart(),



              /// Vertical bar graph ==========================================================
              BarGraph(),

              /// Related TAGS ==========================================================
              TagsListWidget(),

              /// 1 click testing
              RelatedLinksWidget(),

              /// RELATED PEOPLE
              PeoplesListWidget(),

              /// languages 2.0
              Menu(),


              KindaCodeDemo(),
              // ExampleStaggeredAnimations(),

              GridWithScrollControllerExample(),
              // Center(child: ExampleParallax()),
            ],
          ), // TabBarView
        ), // Scaffold
      ), // DefaultTabController
    );
  }
}
