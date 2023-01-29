import 'package:flutter/material.dart';

import '../appbar_class.dart';
import '../bottom_appbar_class.dart';

void main() => runApp(FloatingSettingsButton());

class FloatingSettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> settings = [
      'Single-Click Save',
      'VS Code list view and Overview',
      'Save to Pieces'
          'Proactive Save -VS Code',
      'Share Code with Shareable Links',
      'Automatic Smart Descriptions',
      'Shareable Links',
      'Renaming an Asset',
      'Reclassify Snippet',
      'Workflow Activity View',
      'Snippet Discovery',
      'Getting Started with VS Code',
      'Insert a Snippet',
      'Custom Subdomains',
      'Working with Sensitives',
      'Information View',
      'AutoComplete',
      'AutoExpansion',
      'Save to Pieces As',
      'Collections',
      'Pieces OS',
      'bracket Control',
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(title: 'Settings',),
        body: ListView.builder(
          itemCount: settings.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('Setting ${settings.elementAt(index)}'),
                onTap: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Setting $index'),
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
              ),
            );
          },
        ),
        bottomNavigationBar: CustomBottomAppBar(),
      ),
    );
  }
}
