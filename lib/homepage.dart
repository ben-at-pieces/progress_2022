// ignore_for_file: omit_local_variable_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

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

import 'chart data/boot.dart';
import 'chart data/pieChartWidget.dart';
import 'chart data/statistics_singleton.dart';

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
// var isClassification = StatisticsSingleton().statistics?.classifications.containsKey('') ? 0 : 1;

class HomePagePie extends StatelessWidget {
  const HomePagePie({Key? key}) : super(key: key);

  get touchedIndex => -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// add a piece row
        Container(
          color: Colors.transparent,
          height: 70,

          // child: ,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                'User: ${StatisticsSingleton().statistics?.user}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            MyPieChart(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: DataTable(
            columns: <DataColumn>[
              /// TOP LEFT TITLE
              DataColumn(
                label: Expanded(
                  child: Text(
                    '',
                  ),
                ),
              ),

              /// FIRST COLUMN TO THE RIGHT OF THE INITIAL COLUMN
              DataColumn(
                label: Expanded(
                  child: Text(
                    '#1',
                    style: ParticleFont.micro(context,
                        customization: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    '#2',
                    style: ParticleFont.micro(context,
                        customization: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    '#3',
                    style: ParticleFont.micro(context,
                        customization: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    '#4',
                    style: ParticleFont.micro(context,
                        customization: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
            rows: <DataRow>[
              /// TOP 5 TAGS
              /// this is the first data row in our table
              ///    (   x , y    )
              DataRow(
                cells: <DataCell>[
                  DataCell(Text(
                    'TAGS:',
                    style: ParticleFont.button(context,
                        customization: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  )),
                  DataCell(Text(
                    '${StatisticsSingleton().statistics?.tags.elementAt(0)}',
                    style: ParticleFont.micro(context,
                        customization: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                  )),
                  DataCell(Text(
                    '${StatisticsSingleton().statistics?.tags.elementAt(1)}',
                    style: ParticleFont.micro(context,
                        customization: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                  )),
                  DataCell(Text(
                    '${StatisticsSingleton().statistics?.tags.elementAt(2)}',
                    style: ParticleFont.micro(context,
                        customization: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                  )),
                  DataCell(Text(
                    '${StatisticsSingleton().statistics?.tags.elementAt(3)}',
                    style: ParticleFont.micro(context,
                        customization: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                  )),
                ],
              ),

              /// this is the 1st row above the bottom row

              /// TOP 4 links
              /// this is the first data row in our table
              ///    (   x , y    )
              DataRow(
                cells: <DataCell>[
                  DataCell(Text(
                    'LINKS:',
                    style: ParticleFont.button(context,
                        customization: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  )),
                  DataCell(SizedBox(
                      width: 120,
                      height: 50,
                      child: Text(
                        '${StatisticsSingleton().statistics?.relatedLinks.elementAt(0)}',
                        style: ParticleFont.micro(context,
                            customization:
                                TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                      ))),
                  DataCell(SizedBox(
                      width: 120,
                      height: 30,
                      child: Text(
                        '${StatisticsSingleton().statistics?.relatedLinks.elementAt(1)}',
                        style: ParticleFont.micro(context,
                            customization:
                                TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                      ))),
                  DataCell(SizedBox(
                      width: 120,
                      height: 30,
                      child: Text(
                        '${StatisticsSingleton().statistics?.relatedLinks.elementAt(2)}',
                        style: ParticleFont.micro(context,
                            customization:
                                TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                      ))),
                  DataCell(SizedBox(
                      width: 120,
                      height: 30,
                      child: Text(
                        '${StatisticsSingleton().statistics?.relatedLinks.elementAt(3)}',
                        style: ParticleFont.micro(context,
                            customization:
                                TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                      ))),
                ],
              ),

              /// this is the Bottom Row
              DataRow(
                cells: <DataCell>[
                  DataCell(Text(
                    'PEOPLE:',
                    style: ParticleFont.button(context,
                        customization: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  )),
                  DataCell(
                    Text(
                      '${StatisticsSingleton().statistics?.persons.elementAt(0) ?? '0'}',
                      style: ParticleFont.micro(context,
                          customization:
                              TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  DataCell(
                    Text(
                      '${StatisticsSingleton().statistics?.persons.elementAt(1) ?? '0'}',
                      style: ParticleFont.micro(context,
                          customization:
                              TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  DataCell(
                    Text(
                      '${StatisticsSingleton().statistics?.persons.elementAt(2) ?? '0'}',
                      style: ParticleFont.micro(context,
                          customization:
                              TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  DataCell(
                    Text(
                      '${StatisticsSingleton().statistics?.persons.elementAt(3) ?? '0'}',
                      style: ParticleFont.micro(context,
                          customization:
                              TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        /// SPACER ====================
        Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: SizedBox(
              height: 40.0,
              child: Stack(
                textDirection: TextDirection.ltr,
                children: [
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    left: 0.0,
                    bottom: 0.0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                      // child: Image.asset(
                      //   'images/piecesLogo.png',
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

final TextEditingController newNameController = TextEditingController();

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
