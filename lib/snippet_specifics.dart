// KindaCode.com
// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';

import 'chart data/statistics_singleton.dart';
import 'checkbox.dart';
import 'gridview_draggable/gridview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'KindaCode.com',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const KindaCodeDemo(),
    );
  }
}

// this class defines the full-screen search modal
// by extending the ModalRoute class
class FullScreenSearchModal extends ModalRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.6);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: TextButton(
          child: Text(
            'View Snippets',
            style: ParticleFont.micro(
              context,
              customization: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ),
          onPressed: () async {
            Navigator.of(context).pop;
          },
        ),

        title: Text(
          'User Tags',
          style: ParticleFont.button(context,
              customization: TextStyle(
                color: Colors.white,
              )),
        ),
      ),
      body: Container(
        color: Colors.black12,
        child: ListView.builder(
            itemCount: StatisticsSingleton().statistics?.tags.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                tileColor: Colors.white,
                leading: Icon(
                  Icons.local_offer,
                  color: Colors.black,
                ),
                title: Text(
                  '${StatisticsSingleton().statistics?.tags[index]}  ',
                  style: ParticleFont.bodyText1(context,
                      customization: TextStyle(color: Colors.black)),
                ),
                trailing: MyCheckBoxWidgget(),
              );
              // title: Text('Person: $index'));
            }),
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
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         // implement the search field
      //         // Row(
      //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         //   children: [
      //         //     Expanded(
      //         //       child: TextField(
      //         //         autofocus: true,
      //         //         decoration: InputDecoration(
      //         //           contentPadding: const EdgeInsets.symmetric(
      //         //               vertical: 0, horizontal: 20),
      //         //           filled: true,
      //         //           fillColor: Colors.grey.shade300,
      //         //           suffixIcon: const Icon(Icons.close),
      //         //           hintText: 'Search KindaCode.com',
      //         //           border: OutlineInputBorder(
      //         //               borderSide: BorderSide.none,
      //         //               borderRadius: BorderRadius.circular(30)),
      //         //         ),
      //         //       ),
      //         //     ),
      //         //     const SizedBox(
      //         //       width: 10,
      //         //     ),
      //         //     // This button is used to close the search modal
      //         //     TextButton(
      //         //         onPressed: () => Navigator.of(context).pop(),
      //         //         child: const Text('Cancel'))
      //         //   ],
      //         // ),
      //
      //
      //
      //
      //
      //         // display other things like search history, suggestions, search results, etc.
      //          SizedBox(
      //           height: 20,
      //         ),
      //
      //
      //
      //         //  Padding(
      //         //   padding: EdgeInsets.only(left: 5),
      //         //   child: Text('Saved Dart',
      //         //       style:
      //         //       TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      //         // ),
      //         // SizedBox(
      //         //   height: 20,
      //         // ),
      //         //  ListTile(
      //         //   title: Text('${StatisticsSingleton().statistics?.user}'),
      //         //   leading: Icon(Icons.search),
      //         //   trailing: Icon(Icons.close),
      //         // ),
      //         //  ListTile(
      //         //   title: Text('How to fry a chicken'),
      //         //   leading: Icon(Icons.search),
      //         //   trailing: Icon(Icons.close),
      //         // ),
      //         //  ListTile(
      //         //   title: Text('KindaCode.com'),
      //         //   leading: Icon(Icons.search),
      //         //   trailing: Icon(Icons.close),
      //         // ),
      //         //  ListTile(
      //         //   title: Text('Goodbye World'),
      //         //   leading: Icon(Icons.search),
      //         //   trailing: Icon(Icons.close),
      //         // ),
      //         //  ListTile(
      //         //   title: Text('Cute Puppies'),
      //         //   leading: Icon(Icons.search),
      //         //   trailing: Icon(Icons.close),
      //         // )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  // animations for the search modal
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // add fade animation
    return FadeTransition(
      opacity: animation,
      // add slide animation
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }
}

// This is the main screen of the application
class KindaCodeDemo extends StatelessWidget {
  const KindaCodeDemo({Key? key}) : super(key: key);

  void _showModal(BuildContext context) {
    Navigator.of(context).push(FullScreenSearchModal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black87,

        leadingWidth: 300,
        leading: Row(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text(
                  'View Snippets',
                  style: ParticleFont.micro(
                    context,
                    customization: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
                onPressed: () async {
                  _showModal(context);
                },
              ),
            ),




          ],
        ),
        title: Text(
          '',
          style: ParticleFont.button(context,
              customization: TextStyle(
                color: Colors.white,
              )),
        ),
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

      body: Scaffold(body: GridWithScrollControllerExample(),)
    );

  }
}