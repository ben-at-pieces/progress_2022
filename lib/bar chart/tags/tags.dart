// ignore_for_file: prefer_const_constructors

import 'package:badges/badges.dart';
import 'package:core_openapi/api_client.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/bar%20chart/tags/tags_logic.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';

class GlobalTags extends StatefulWidget {
  const GlobalTags({super.key});

  @override
  State<GlobalTags> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<GlobalTags> {
  String? dropdownValue;

  late Future<List<String>> futureTags;

  @override
  void initState() {
    super.initState();
    AssetTags launch9 = AssetTags(
      api: ApiClient(basePath: 'http://localhost:1000'),
    );

    futureTags = launch9.run();
  }

  List list = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureTags,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }

          if (!snapshot.hasData) {
            return Text('Failure...');
          }

          // print('gathered related links data!');

          dropdownValue ??= snapshot.data!.first;

          List<DropdownMenuItem<String>> items = snapshot.data!
              .map((String url) => DropdownMenuItem<String>(
                    value: url,
                    child: SizedBox(child: Text(url)),
                  ))
              .toList();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(6.0),
              ),
              child: Container(

                color: Colors.grey[500],
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.local_offer,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                    Container(
                      // color: Colors.grey,
                      width: 180,
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
                              fontSize: 12,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          isExpanded: true,
                          menuMaxHeight: 250,

                          icon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Badge(
                              badgeColor: Colors.black,
                              position: BadgePosition(isCenter: true),
                              badgeContent: Text(
                                items.length.toString(),
                                style: ParticleFont.micro(
                                  context,
                                  customization: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          elevation: 16,

                          underline: Container(
                            height: 0,
                            color: Colors.blueAccent,
                          ),
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
                  ],
                ),
              ),
            ),
          );
        });
  }
}