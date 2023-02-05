// import 'package:connector_openapi/api_client.dart';
// ignore_for_file: omit_local_variable_types, prefer_const_constructors, use_key_in_widget_constructors
import 'package:connector_openapi/api_client.dart' as connector;
import 'package:core_openapi/api/applications_api.dart';
import 'package:core_openapi/api/assets_api.dart';
import 'package:core_openapi/api_client.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/connections/statistics.dart';
import 'package:gsheets/connections/statistics_singleton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Dashboard/faqs.dart';
import '../Dashboard/pro_tips.dart';
import '../appbar_class.dart';
import '../bottom_appbar_class.dart';
import '../checkbox_class.dart';
// import '../lists/jetbrain.dart';
import 'jetbrain.dart';

void main() async {
  StatisticsSingleton().statistics = await getStats();

  // print('${StatisticsSingleton().statistics?.classifications.keys}');
  // print('${StatisticsSingleton().statistics?.filteredLanguages.elementAt(index).}');
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RelatedItems(),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}

class RelatedItems extends StatefulWidget {
  @override
  _RelatedItemsState createState() => _RelatedItemsState();
}

class _RelatedItemsState extends State<RelatedItems> {
  String input = '';
  List<String> related = [];

  @override
  Widget build(BuildContext context) {
    // appBar: CustomAppBar(
    //   title: 'User Tags',
    // ),
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dashboard',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              controller: _textEditController,
              enableInteractiveSelection: true,
              cursorHeight: 18,
              autofocus: false,
              showCursor: true,
              cursorColor: Colors.black,
              toolbarOptions: ToolbarOptions(
                copy: true,
                paste: true,
                selectAll: true,
                cut: true,
              ),
              style: ParticleFont.micro(context, customization: TextStyle(color: Colors.black)),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.grey,
                    size: 12,
                  ),
                  onPressed: () {
                    _textEditController.clear();
                  },
                ),
                fillColor: Colors.black87,
                labelText: 'Search...',
                labelStyle:
                ParticleFont.micro(context, customization: TextStyle(color: Colors.grey)),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
              onChanged: (value) {
                setState(() {
                  input = value;
                  related = getRelatedItems(input);
                });
              },
            ),
          ),
          Row(
            children: [

              /// Save to Pieces Button ------------------------------------------------------------
              FloatingActionButton(
                focusColor: Colors.green,
                tooltip: 'create',
                hoverColor: Colors.grey,
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.add_box_outlined,
                  size: 20,
                  color: Colors.black,
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
                                      customization: TextStyle(color: Colors.black, fontSize: 14)),
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

                          /// Save to Pieces ------------------------------------------------------------
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
                                    String port = '1000';
                                    String host = 'http://localhost:$port';
                                    final AssetsApi assetsApi =
                                    AssetsApi(ApiClient(basePath: host));

                                    final ApplicationsApi applicationsApi =
                                    await ApplicationsApi(ApiClient(basePath: host));

                                    Applications applicationsSnapshot =
                                    await applicationsApi.applicationsSnapshot();

                                    var first = applicationsSnapshot.iterable.first;

                                    final Asset response = await assetsApi.assetsCreateNewAsset(
                                      seed: Seed(
                                        asset: SeededAsset(
                                          application: Application(
                                            privacy: first.privacy,
                                            name: first.name,
                                            onboarded: first.onboarded,
                                            platform: first.platform,
                                            version: first.version,
                                            id: first.id,
                                          ),
                                          format: SeededFormat(

                                            ///=======
                                            fragment: SeededFragment(
                                              string: TransferableString(
                                                raw: _textFieldController.text,
                                              ),
                                            ),
                                          ),
                                        ),
                                        type: SeedTypeEnum.ASSET,
                                      ),
                                    );
                                    _textFieldController.clear();

                                    Navigator
                                        .of(context)
                                        .pop;

                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return RelatedItems();
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),

                          /// Close Button --------------------------------------------------------------
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
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextButton(
                  child: Text(
                    'profile',
                    style: ParticleFont.micro(
                      context,
                      customization: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      input = 'profile';
                      related = getRelatedItems(input);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextButton(
                  child: Text(
                    'Snippets: ${StatisticsSingleton().statistics?.snippetsSaved ?? 0}',
                    style: ParticleFont.micro(
                      context,
                      customization: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      input = 'snippets';
                      related = getRelatedItems(input);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextButton(
                  child: Text(
                    'tags: ${StatisticsSingleton().statistics?.tags.length}' ?? '',
                    style: ParticleFont.micro(
                      context,
                      customization: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      input = 'tags';
                      related = getRelatedItems(input);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextButton(
                  child: Text(
                    'links: ${StatisticsSingleton().statistics?.relatedLinks.length}' ?? '',
                    style: ParticleFont.micro(
                      context,
                      customization: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      input = 'links';
                      related = getRelatedItems(input);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextButton(
                  child: Text(
                    'shares: ${StatisticsSingleton().statistics?.shareableLinks}' ?? '',
                    style: ParticleFont.micro(
                      context,
                      customization: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      input = 'shares';
                      related = getRelatedItems(input);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextButton(
                  child: Text(
                    'People: ${StatisticsSingleton().statistics?.persons.length}' ?? '',
                    style: ParticleFont.micro(
                      context,
                      customization: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      input = 'people';
                      related = getRelatedItems(input);
                    });
                  },
                ),
              ),
            ],
          ),
          Divider(),

          /// GridView Builder ----------------------------------------------------------------------
          Expanded(
            flex: 1,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: related.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // SizedBox(height: 30, width: 30, child: Image.asset('img_3.png')),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        color: Colors.black54,
                        width: 115,
                        height: 300,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              related[index],
                              style: ParticleFont.micro(
                                context,
                                customization: TextStyle(
                                    color: Colors.white, fontSize: 10, fontWeight: FontWeight.w200),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: 'copy',
                      splashRadius: 2,
                      icon: Icon(
                        Icons.copy,
                        color: Colors.black,
                        size: 10,
                      ),
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Copied to Clipboard',
                            ),
                            duration: Duration(
                                days: 0,
                                hours: 0,
                                minutes: 0,
                                seconds: 1,
                                milliseconds: 30,
                                microseconds: 10),
                          ),
                        );
                        ClipboardData data = ClipboardData(text: related[index]);
                        await Clipboard.setData(data);
                      },
                    ),
                  ],
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3,
                crossAxisCount: 4,
              ),
            ),
          ),
          Column(
            children: [

              /// Collections Row - TODO make more snippets readily available ----------------------------------------------------------------------

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () async {
                        setState(() {
                          input = 'javascript';
                          related = getRelatedItems(input);
                        });
                      },
                      child: Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: Image.asset('javascript.jpg'),
                              ),
                              Text(''),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () async {
                        setState(() {
                          input = 'typescript';
                          related = getRelatedItems(input);
                        });
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset('typescript.jpg'),
                          ),
                          Text(''),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () async {
                        setState(() {
                          input = 'dart';
                          related = getRelatedItems(input);
                        });
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset('dart.jpg'),
                          ),
                          Text(''),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () async {
                        setState(() {
                          input = 'sql';
                          related = getRelatedItems(input);
                        });
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset('sql.jpg'),
                          ),
                          Text(''),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () async {
                        setState(() {
                          input = 'python';
                          related = getRelatedItems(input);
                        });
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset('python.jpg'),
                          ),
                          Text(''),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }


  final TextEditingController _textFieldController = TextEditingController();

  final TextEditingController _textEditController = TextEditingController();
}
