// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:connector_openapi/api.dart';
import 'package:core_openapi/api_client.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/pie/meta_data/snippet_names/snippet_logic.dart';
import 'package:runtime_client/particle.dart';

import '../../pie chart/home_appbar.dart';
// import 'urls_logic.dart';

class DropdownSnippets extends StatefulWidget {
  const DropdownSnippets({super.key});

  @override
  State<DropdownSnippets> createState() => DropdownSnippetsState();
}

class DropdownSnippetsState extends State<DropdownSnippets> {
  String? dropdownValue;

  late Future<List<String>> future;

  @override
  void initState() {
    super.initState();
    SnippetNames launch9 = SnippetNames(
      api: ApiClient(basePath: 'http://localhost:1000'),
    );

    future = launch9.run1();
  }

  List list = [];

  @override
  Widget build(BuildContext context) {
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
                    child: Text(url),
                  ))
              .toList();

          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                ParticleIconButton(
                  icon: Icons.list_alt_outlined,
                  backgroundColor: Colors.black54,
                  color: Colors.white,
                  onPressed: () async {
                    ///popup
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        // title: const Text("snippet Names:"),
                        content: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: 400,
                            height: 400,
                            color: Colors.white30,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.black54,
                                elevation: 8,
                                child: ListView.builder(
                                  itemCount: assetsSnapshot.length,
                                  itemBuilder: (context, index) => ListTile(
                                    /// Classification Pill

                                    /// zoom button on homepage ====================================================
                                    horizontalTitleGap: .5,

                                    ///====================================================================================================
                                    title: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: 50,
                                            child: Text(
                                              '${assetsSnapshot[index]['formats']['iterable'][0]['classification']['specific']}'
                                                  .toUpperCase(),
                                              style: ParticleFont.micro(context,
                                                  customization: TextStyle(color: Colors.white)),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(left: 5.0),
                                            child: SizedBox(
                                              width: 60,
                                              child: Text(
                                                'snippet: $index',
                                                style: ParticleFont.micro(context,
                                                    customization: TextStyle(color: Colors.white)),
                                              ),
                                            ),
                                          ),

                                          /// snippet name
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: SizedBox(
                                              width: 70,
                                              child: Text(
                                                assetsSnapshot[index]['name'],
                                                style: ParticleFont.micro(context,
                                                    customization: TextStyle(color: Colors.white)),
                                              ),
                                            ),
                                          ),

                                          /// edit button
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5.0),
                                            child: Row(
                                              children: [
                                                ParticleIconButton(
                                                    tooltip:
                                                        '${assetsSnapshot[index]['description']}',
                                                    color: Colors.white,
                                                    micro: true,
                                                    icon: Icons.edit,
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (_) => AlertDialog(
                                                          actions: [
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment.center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                /// Rename Submit Button
                                                                ParticleButton(
                                                                    backgroundColor: Colors.black54,
                                                                    textColor: Colors.white,
                                                                    text: 'submit',
                                                                    onPressed: () async {
                                                                      Navigator.of(context).pop();

                                                                      String oldName =
                                                                          (assetsSnapshot[index]
                                                                              ['name']);
                                                                      String newNameText =
                                                                          newNameController.text;

                                                                      if (oldName != newNameText) {
                                                                        Assets assets =
                                                                            await assetsApi
                                                                                .assetsSnapshot();

                                                                        /// (2) Get the indexed Asset in the list.
                                                                        Asset assetIndex = assets
                                                                            .iterable
                                                                            .elementAt(index);

                                                                        /// (3) Update the name of the first Asset.
                                                                        String? oldName =
                                                                            assetIndex.name;

                                                                        assetIndex.name =
                                                                            newNameText;

                                                                        /// (5) If the description is empty, Return "Invalid Description. Please enter at least one character"
                                                                        Asset updatedAsset =
                                                                            await assetApi
                                                                                .assetUpdate(
                                                                                    asset:
                                                                                        assetIndex);
                                                                        print(updatedAsset);

                                                                        ScaffoldMessenger.of(
                                                                                context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            backgroundColor:
                                                                                Colors.white,
                                                                            content: Text.rich(
                                                                              TextSpan(
                                                                                text: 'new name: ',
                                                                                style: ParticleFont.micro(
                                                                                    context,
                                                                                    customization:
                                                                                        TextStyle(
                                                                                            color: Colors
                                                                                                .black)),
                                                                                children: <
                                                                                    InlineSpan>[
                                                                                  TextSpan(
                                                                                    text:
                                                                                        '$newNameText',
                                                                                    style: ParticleFont.micro(
                                                                                        context,
                                                                                        customization:
                                                                                            TextStyle(
                                                                                                color:
                                                                                                    Colors.green)),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            duration: Duration(
                                                                                days: 0,
                                                                                hours: 0,
                                                                                minutes: 0,
                                                                                seconds: 4,
                                                                                milliseconds: 30,
                                                                                microseconds: 10),
                                                                          ),
                                                                        );
                                                                      }

                                                                      //   print(
                                                                      //     ' Asset name was updated \nfrom: $oldName \nto:${newNameText}',
                                                                      //   );
                                                                      //   return;
                                                                      // }
                                                                      // print(
                                                                      //     'The name was unchanged.\nfrom:$oldName \nto:${newNameText}');
                                                                    }),

                                                                /// Rename Close Button
                                                                ParticleButton(
                                                                  textColor: Colors.white,
                                                                  text: 'close',
                                                                  backgroundColor: Colors.black54,
                                                                  onPressed: () async {
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                          title: Text(
                                                            'Edit',
                                                            style: ParticleFont.micro(context,
                                                                customization:
                                                                    TextStyle(color: Colors.black)),
                                                          ),
                                                          content: SizedBox(
                                                            height: 100,
                                                            width: 80,
                                                            child: Column(
                                                              children: [
                                                                ///
                                                                Container(
                                                                  color: Colors.white,
                                                                  width: 250,
                                                                  child: TextField(
                                                                      style: ParticleFont.micro(
                                                                        context,
                                                                        customization: TextStyle(
                                                                          fontSize: 12,
                                                                          color: Colors.black,
                                                                        ),
                                                                      ),
                                                                      autofocus: true,
                                                                      showCursor: true,
                                                                      cursorColor: Colors.black,
                                                                      cursorHeight: 15,
                                                                      enabled: true,
                                                                      decoration: InputDecoration(
                                                                        prefixIcon: Icon(
                                                                          Icons.edit,
                                                                          size: 12,
                                                                          color: Colors.black,
                                                                        ),
                                                                        labelText:
                                                                            'n e w _ n a m e',
                                                                        border:
                                                                            OutlineInputBorder(),
                                                                      ),
                                                                      controller:
                                                                          newNameController),
                                                                ),
                                                                Divider(
                                                                  thickness: 10,
                                                                  color: Colors.transparent,
                                                                ),

                                                                /// Zoom Alert Dialogue old name
                                                                Container(
                                                                  child: SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: SelectableText.rich(
                                                                      TextSpan(
                                                                        text:
                                                                            'old name:  ${assetsSnapshot[index]['name']}',
                                                                        style: ParticleFont.subtitle1(
                                                                            context,
                                                                            customization:
                                                                                TextStyle(
                                                                                    color: Colors
                                                                                        .black)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: ParticleIconButton(
                                                      tooltip: 'delete',
                                                      micro: true,
                                                      icon: Icons.delete,
                                                      color: Colors.white,
                                                      onPressed: () async {
                                                        Navigator.of(ctx).pop();

                                                        /// (1) call assetsSnapshot
                                                        Asset asset =
                                                            (await assetsApi.assetsSnapshot())
                                                                .iterable
                                                                .elementAt(index);

                                                        /// (2) define your first asset ID (string) from your assets snapshot
                                                        String deleted = await assetsApi
                                                            .assetsDeleteAsset(asset.id);
                                                      }),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    ///====================================================================================================
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        actions: [
                          // ParticleButton(
                          //     textColor: Colors.white,
                          //     backgroundColor: Colors.black54,
                          //     text: 'close',
                          //     onPressed: () {
                          //       Navigator.of(ctx).pop();
                          //     }),
                          ParticleButton(
                              textColor: Colors.white,
                              backgroundColor: Colors.black54,
                              text: 'close',
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              })
                        ],
                      ),
                    );
                  },

                  // child: Icon(
                  //   Icons.account_circle,
                  //   color: Colors.black54,
                  //   size: 30,
                  // ),
                ),
              ],
            ),
          );
        });
  }
}
