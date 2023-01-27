import 'package:flutter/material.dart';

import '../appbar_class.dart';

class SearchableListView extends StatefulWidget {
  @override
  _SearchableListViewState createState() => _SearchableListViewState();
}

class _SearchableListViewState extends State<SearchableListView> {
  // list of items to display in the ListView
  final List<String> _items = [
    'Power Tip 1',
    'Power Tip 2',
    'Power Tip 3',
    'Power Tip 4',
    'Power Tip 5',
    'Power Tip 6',
    'Power Tip 7',
    'Power Tip 8',
    'Power Tip 9',
    'Power Tip 10',
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
        children: [
          // search TextField
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(autofocus: true,
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
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
    );
  }
}
