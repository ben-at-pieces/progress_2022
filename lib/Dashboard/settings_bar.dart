import 'package:flutter/material.dart';

import '../appbar_class.dart';
import '../bottom_appbar_class.dart';

class SearchableListView extends StatefulWidget {
  @override
  _SearchableListViewState createState() => _SearchableListViewState();
}

class _SearchableListViewState extends State<SearchableListView> {
  // list of items to display in the ListView
  final List<String> _items = [
    'Connect to Pieces OS',
    'Automatic Smart Descriptions',
    'Shareable Links',
    'Renaming an Asset',
    'Reclassifying an Asset',
    'Workflow Activity View',
    'Snippet Discovery',
    'Getting Started with VS Code',
    'Insert a Snippet',
    'Custom Subdomains',
    'Working with Sensitives',
  ];

  // list of items filtered based on user's search
  List<String> _filteredItems = [];

  // controller for the search TextField
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // initialize filtered items to the full list of items
    _filteredItems = _items;

    // listen for changes to the search TextField
    _searchController.addListener(() {
      // get the current value of the TextField
      String searchText = _searchController.text;

      // filter the list of items based on the search text
      setState(() {
        _filteredItems = _items.where((item) => item.toLowerCase().contains(searchText.toLowerCase())).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CutomAppBar(title: 'Support Center',),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // search TextField
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(autofocus: true,
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for Power Tips...',
              ),
            ),
          ),
          Expanded(
            // list view of filtered items
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_filteredItems[index]),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CutomBottomAppBar(),
    );
  }
}
