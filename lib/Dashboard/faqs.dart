import 'package:flutter/material.dart';

import '../appbar_class.dart';
import '../bottom_appbar_class.dart';
import '../connections/suggestions.dart';

void main() => runApp(FloatingSettingsButton());

class FloatingSettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> settings = [
      'FAQ: How are my snippets filtered?',
      'FAQ: How do | refresh my Saved Snippets List?',
      'FAQ: How do | modify Pieces for JetBrains user settings',
      'FAQ: How are snippets suggested within the JetBrains Snippet Treeview? #34',
      'FAQ: What is Pieces for JetBrains? #35',
      'FAQ: What are the main features of Pieces for JetBrains? #36',
      'FAQ: Is Pieces for JetBrains free to use? #37',
      'FAQ: What JetBrains products does Pieces for JetBrains support?',
      'FAQ: How do | install Pieces for JetBrains on my computer?',
      'FAQ: How do | get support if | have problems with Pieces for JetBrains?',
    ];
    final List<String> explanations = [
      'submit feedback button',
      'its a thing',
      'command + shift + P',
      'give us your data',
      'Share Code with Shareable Links',
      'Automatic Smart Descriptions',
      'Shareable Links',
    ];



    Map<List<String>, List<String>> faqs = {settings: explanations};

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Frequently Asked Questions',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              FloatingActionButton(
                focusColor: Colors.green,
                tooltip: 'power tips',
                hoverColor: Colors.grey,
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  MyApp();
                },
              ),  SizedBox(
                height: 50,
                width: 50,
                child: Image.asset('faq.png'),
              ),
            ],
          ),

          Container(
            height: 300,
            width: 500,
            child: ListView.builder(
              itemCount: settings.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text('${index+1}'),
                  subtitle: Text('view'),
                  title: Text(settings.elementAt(index)),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(settings.toList().elementAt(index)),
                        content: Text(explanations.toList().elementAt(index)),
                        actions: [
                          ElevatedButton(
                            child: Text('OK'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
