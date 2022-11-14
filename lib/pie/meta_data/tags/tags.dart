// ignore_for_file: prefer_const_constructors

import 'package:badges/badges.dart';
import 'package:core_openapi/api_client.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/pie/meta_data/tags/tags_logic.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';

class GlobalTags extends StatefulWidget {
  const GlobalTags({super.key});

  @override
  State<GlobalTags> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<GlobalTags> {
  String? dropdownValue;

  late Future<List<String>> future;

  @override
  void initState() {
    super.initState();
    AssetTags launch = AssetTags(
      api: ApiClient(basePath: 'http://localhost:1000'),
    );

    future = launch.run();
  }

  List list = [];

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     TextButton(
    //       onPressed: () async {
    //         setState(() async {
    //           AssetWebsite launch9 = AssetWebsite(
    //             api: ApiClient(basePath: 'http://localhost:1000'),
    //           );
    //
    //           list = await launch9.run();
    //         });
    //       },
    //       child: Text('Deez nuts'),
    //     ),
    //     if (list.isNotEmpty) ...list.map((e) => Text(e)).toList(),
    //   ],
    // );
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }

          if (!snapshot.hasData) {
            return Text('Failure...');
          }

          // print('MY DATA: ${snapshot.data}');

          dropdownValue ??= snapshot.data!.first;

          List<DropdownMenuItem<String>> items = snapshot.data!
              .map((String url) => DropdownMenuItem<String>(
                    value: url,
                    child: Text(
                      url,
                      style: ParticleFont.micro(
                        context,
                        customization: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ))
              .toList();

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(6.0),
              ),
              child: Container(
                color: Colors.white,
                width: 150,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: DropdownButton<String>(
                    onTap: () async {
                      var url = '$dropdownValue';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    enableFeedback: true,
                    value: dropdownValue,
                    style: ParticleFont.micro(
                      context,
                      customization: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    isExpanded: true,
                    menuMaxHeight: 250,
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Badge(
                                badgeColor: Colors.grey,
                                position: BadgePosition(bottom: 10, start: 10),
                                child: Icon(
                                  Icons.sell_outlined,
                                  size: 25,
                                ),
                                badgeContent: Text(
                                  '${snapshot.data?.length.toString()}',
                                  style: ParticleFont.micro(
                                    context,
                                    customization: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                                // Text(
                                //   '${snapshot.data?.length.toString()}',
                                //   style: ParticleFont.micro(
                                //     context,
                                //     customization: TextStyle(
                                //       color: Colors.red,
                                //       fontSize: 10,
                                //       fontWeight: FontWeight.bold,
                                //     ),
                                //   ),
                                ),
                          ),
                        ],
                      ),
                    ),
                    elevation: 16,

                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: items,
                    // items: Languages.map<DropdownMenuItem<String>>((String value) {
                    //   return DropdownMenuItem<String>(
                    //     value: value,
                    //     child: Text(value),
                    //   );
                    // }).toList(),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
