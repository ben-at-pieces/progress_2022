import 'package:flutter/material.dart';

import '../appbar_class.dart';
import '../bottom_appbar_class.dart';

void main() => runApp(FloatingSettingsButton());

class FloatingSettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> settings = [
      'what process for handling bug fixes and patches post-launch?', 'What is Pieces OS?',
      'How do I save to Pieces?',
      'Policy on intellectual property and confidentiality?',

      'Share Code with Shareable Links',
      'Automatic Smart Descriptions',
      'Shareable Links',
      // 'Renaming an Asset',
      // 'Reclassify Snippet',
      // 'Workflow Activity View',
      // 'Snippet Discovery',
      // 'Getting Started with VS Code',
      // 'Insert a Snippet',
      // 'Custom Subdomains',
      // 'Working with Sensitives',
      // 'Information View',
      // 'AutoComplete',
      // 'AutoExpansion',
      // 'Save to Pieces As',
      // 'Collections',
      // 'Pieces OS',
      // 'bracket Control',
    ];
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Frequently Asked Questions',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(


            leading: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('faq.png'),
            ),
          ),
          Container(
            height: 300,
            width: 430,
            child: ListView.builder(
              itemCount: settings.length,
              itemBuilder: (context, index) {
                return ListTile(
                  subtitle: Text('view'),
                  title: Text('${settings.elementAt(index)}'),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('$index'),
                        content: Text('This is the setting $index dialog.'),
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
