import 'package:connector_openapi/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:runtime_client/particle.dart';
import '../../connections/statistics_singleton.dart';
import '../Dashboard/Empty States/batch_empty.dart';
import '../Dashboard/dNotEmpty/batch_images_row.dart';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      // home : new ListViewBuilder(), NO Need To Use Unnecessary New Keyword
      // home:  LanguageBuilder());
    );
  }
}

class ScratchImageBuilder extends StatelessWidget {


  // List<String> imageList = [
  //
  //
  //  'batchfile-black.jpg',
  //  'c-sharp.jpg',
  //  'c.jpg',
  //  'coffeescript-black.jpg',
  //  'cpp.ipg',
  //  'css.jpg',
  //  'dart.jpg',
  //  'erlang.jpg',
  //  'go.jpg',
  //  'haskell.jpg',
  //  'html.jpg',
  //  'icon_path_black.png',
  //  'java.jpg',
  //  'javascript.jpg',
  //  'json.jpg',
  //  'lua.jpg',
  //  'markdown-white.jpg',
  //  'matlab.jpg',
  //  'objective-c.jpg',
  //  'perl.jpg',
  //  'php.jpg',
  //  'powershell.jpg',
  //  'python.jpg',
  //  'r.png',
  //  'ruby.jpg',
  //  'rust-black.jpg',
  //  'scala.jpg',
  //  'shell Small.jpeg',
  //  'sql.jpg',
  //  'swift.jpg',
  //  'tex-black.jpg',
  //  'text.jpg',
  //  'toml-black.jpg',
  //  'typescript.jpg',
  //  'yaml-black.jpg',
  //
  //
  // ];







  // ScratchImageBuilder({
  //   required this.title,
  //   required this.subtitle,
  //   required this.leading,
  //
  // });

  @override
  Widget build(BuildContext context) {


    int index = StatisticsSingleton().statistics?.filteredLanguages.length.toInt() ?? 0;


    List<Iterable<Asset>>? _firstFilter = StatisticsSingleton().statistics?.filteredLanguages;

    List<Asset>? listedAsset = _firstFilter?.elementAt(index).toList();

    int count = listedAsset?.length.toInt() ?? 0;




    /// ============================



    // toList().elementAt(index).length.toInt();

    return Container(
      color: Colors.grey,
      child: ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {




          String? snipAsset = _firstFilter?.elementAt(index).toList().elementAt(index).original.reference?.fragment?.string?.raw;
          String? snipAssetDescription = _firstFilter?.elementAt(index).toList().elementAt(index).description;
          String? snipAssetName = _firstFilter?.elementAt(index).toList().elementAt(index).name;


          return SizedBox(
            // height: 200,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$snipAssetName ',
                    style: ParticleFont.button(context, customization: TextStyle(color: Colors.grey)),
                    maxLines: 1,
                  ),
                  ListTile(
                    leading: Image.asset('$count'),
                    title: Row(
                      children: [


                        SizedBox(
                          width: 200,
                          child: Text(
                            '$snipAssetName' ?? '',
                            style: ParticleFont.bodyText1(
                              context,
                              customization: TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          ),
                        ),
                        TextButton(
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              'pieces_small.jpeg',
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    title: Text(
                                        '$snipAssetName'),
                                    content: SizedBox(
                                      height: 150,
                                      child: SingleChildScrollView(
                                        child: Text(
                                            '$snipAsset'),
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Reference Chat GPT!',
                                                style: TextStyle(color: Colors.blueGrey),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                              child: Image.asset('chatgptSmall.jpeg'),
                                            ),
                                          ],
                                        ),
                                        onPressed: () async {
                                          String linkUrl = 'https://chat.openai.com/chat';

                                          linkUrl = linkUrl; //Twitter's URL
                                          if (await canLaunch(linkUrl)) {
                                            await launch(
                                              linkUrl,
                                            );
                                          } else {
                                            throw 'Could not launch $linkUrl';
                                          }
                                        },
                                      ),
                                      TextButton(
                                        child: Text('copy'),
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
                                                  microseconds: 20),
                                            ),
                                          );
                                          ClipboardData data = ClipboardData(
                                              text:
                                              '${snipAsset}');
                                          await Clipboard.setData(data);
                                        },
                                      ),

                                      ParticleButton(
                                        textColor: Colors.white,
                                        backgroundColor: Colors.black54,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        text: ('close'),
                                      ),
                                    ]);
                              },
                            );
                          },
                        ),  ],
                    ),
                    trailing: TextButton(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('black_GPT.png'),
                      ),
                      onPressed: () async {
                        String linkUrl = 'https://chat.openai.com/chat';

                        linkUrl = linkUrl; //Twitter's URL
                        if (await canLaunch(linkUrl)) {
                          await launch(
                            linkUrl,
                          );
                        } else {
                          throw 'Could not launch $linkUrl';
                        }
                      },
                    ),
                    subtitle: Text(snipAssetDescription!),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


