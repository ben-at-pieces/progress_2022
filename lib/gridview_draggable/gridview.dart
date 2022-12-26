import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Language_Pie_List/pieChartWidget.dart';
import '../connections/statistics_singleton.dart';
import 'grid_item.dart';
import 'images.dart';
import 'package:flutter/services.dart';

class GridWithScrollControllerExample extends StatefulWidget {
  GridWithScrollControllerExample({
    Key? key,
  }) : super(key: key);

  @override
  GridWithScrollControllerExampleState createState() => GridWithScrollControllerExampleState();
}

class GridWithScrollControllerExampleState extends State<GridWithScrollControllerExample> {
  final List<DraggableGridItem> _listOfDraggableGridItem = [];
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );

  @override
  void initState() {
    _generateImageData();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.jumpTo(_scrollController.position.minScrollExtent);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,


      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [



          SizedBox(
            height: 450,
            width: 50,
            child: ListView(
              // scrollDirection: Axis.vertical,
              children: [
                // showing list of images
                for (var item in imgList1)
                  SizedBox(
                      height: 40,
                      width: 50,
                      child:  IconButton(
                        icon: item,
                        // tooltip: 'named language',
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('TOTAL: ${Language().languages}'),
                            content: const Text('AlertDialog description'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                      )),
              ],
            ),
          ),
          SizedBox(
            height: 450,
            width: 50,
            child: ListView(
              // scrollDirection: Axis.vertical,
              children: [
                // showing list of images
                for (var item in imgList2)
                  SizedBox(
                      height: 40,
                      width: 50,
                      child:  IconButton(
                        icon: item,
                        // tooltip: 'named language',
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('TOTAL: ${Language().languages}'),
                            content: const Text('AlertDialog description'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                      )),
              ],
            ),
          ),
          SizedBox(
            height: 450,
            width: 50,
            child: ListView(
              // scrollDirection: Axis.vertical,
              children: [
                // showing list of images
                for (var item in imgList3)
                  SizedBox(
                      height: 40,
                      width: 50,
                      child:  IconButton(
                        icon: item,
                        // tooltip: 'named language',
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('TOTAL: ${Language().languages}'),
                            content: const Text('AlertDialog description'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                      )),
              ],
            ),
          ),
          SizedBox(
            height: 450,
            width: 50,
            child: ListView(
              // scrollDirection: Axis.vertical,
              children: [
                // showing list of images
                for (var item in imgList4)
                  SizedBox(
                      height: 40,
                      width: 50,
                      child:  IconButton(
                        icon: item,
                        // tooltip: 'named language',
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('TOTAL: ${Language().languages}'),
                            content: const Text('AlertDialog description'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                      )),
              ],
            ),
          ),


        ],
      ),

      bottomNavigationBar: SizedBox(
        height: 30,
        child: BottomAppBar(
          notchMargin: 5,
          color: Colors.black54,
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FloatingActionButton(
                    // tooltip: 'copy user data',
                    elevation: 0,
                    mini: true,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 15,
                    ),
                    onPressed: () async {
                      ClipboardData data = ClipboardData(text: '''
User Name: ${StatisticsSingleton().statistics?.user}
Platform: ${StatisticsSingleton().statistics?.platform}
Version: ${StatisticsSingleton().statistics?.version}''');
                      const snackBar = SnackBar(
                        content: Text(
                          'Successfully saved User data to clipboard!',
                          style: TextStyle(color: Colors.white),
                        ),
                      );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      await Clipboard.setData(data);
                    },
                  ),
                  Text(
                    '${StatisticsSingleton().statistics?.user}',
                    style: ParticleFont.micro(
                      context,
                      customization: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              ),
              Icon(
                Icons.bolt_sharp,
                color: Colors.white,
              ),
              TextButton(
                child: Text(
                  'Powered by Pieces Runtime',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ),
                onPressed: () async {
                  String linkUrl = 'https://www.runtime.dev/';

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
            ],
          ),
        ),
      ),


    );

  }

  Widget feedback(List<DraggableGridItem> list, int index) {
    return Container(
      color: Colors.greenAccent,
      // child: list[index].child,


      width: 200,
      height: 350,
    );
  }

  PlaceHolderWidget placeHolder(List<DraggableGridItem> list, int index) {
    return PlaceHolderWidget(
      child: Container(
        color: Colors.white,
      ),
    );
  }

  void onDragAccept(List<DraggableGridItem> list, int beforeIndex, int afterIndex) {
    log('onDragAccept: $beforeIndex -> $afterIndex');
  }

  void _generateImageData() {
    _listOfDraggableGridItem.addAll(
      [
        DraggableGridItem(
          child: GridItem(image: Images.asset_1),
          isDraggable: true,
          dragCallback: (context, isDragging) {
            log('isDragging: $isDragging');

          },
        ),
        // DraggableGridItem(child: GridItem(image: Images.asset_1), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_2),  isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_3),  isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_4),  isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_5),  isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_6),  isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_7),  isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_8),  isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_9),  isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_10), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_11), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_12), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_13), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_14), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_15), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_16), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_17), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_18), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_19), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_20), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_21), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_22), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_23), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_24), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_25), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_26), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_27), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_28), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_29), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_30), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_31), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_32), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_33), isDraggable: true),
      ],
    );
  }
}
class Language {
  List languages = [
    'batchfile',
    'c',
    'sharp',
    'coffees',
    'cpp',
    'css',
    'dart',
    'erlang',
    'go',
    'haskell',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'markdown',
    'matlab',
    'objective-c',
    'perl',
    'php',
    'powershell',
    'python',
    'r',
    'ruby',
    'rust',
    'scala',
    'sql',
    'swift',
    'typescript',
    'tex',
    'text',
    'toml',
    'yaml',
  ];
}

List imgList1 = [
  Image.asset('batchfile-black.jpg'),
  Image.asset('c.jpg'),
  Image.asset('c-sharp.jpg'),
  Image.asset('coffeescript-black.jpg'),
  Image.asset('cpp.jpg'),
  Image.asset('css.jpg'),
  Image.asset('dart.jpg'),
  Image.asset('erlang.jpg'),
  Image.asset('go.jpg'),
];

List imgList2 = [
  Image.asset('haskell.jpg'),
  Image.asset('html.jpg'),
  Image.asset('java.jpg'),
  Image.asset('javascript.jpg'),
  Image.asset('json.jpg'),
  Image.asset('lua.jpg'),
  Image.asset('markdown-black.jpg'),
  Image.asset('matlab.jpg'),
  Image.asset('objective-c.jpg'),

];

List imgList3 = [

  Image.asset('objective-c.jpg'),
  Image.asset('perl.jpg'),
  Image.asset('php.jpg'),
  Image.asset('powershell.jpg'),
  Image.asset('python.jpg'),
  Image.asset('r.jpg'),
  Image.asset('ruby.jpg'),
  Image.asset('rust-black.jpg'),
  Image.asset('scala.jpg'),

];
List imgList4 = [


  Image.asset('sql.jpg'),
  Image.asset('swift.jpg'),
  Image.asset('typescript.jpg'),
  Image.asset('tex-black.jpg'),
  Image.asset('text.jpg'),
  Image.asset('toml-black.jpg'),
  Image.asset('yaml-black.jpg'),
];
