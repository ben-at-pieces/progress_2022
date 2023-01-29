import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';

import '../appbar_class.dart';
import '../bottom_appbar_class.dart';

class SearchableListView extends StatefulWidget {
  @override
  _SearchableListViewState createState() => _SearchableListViewState();
}

class _SearchableListViewState extends State<SearchableListView> {
  // list of items to display in the ListView
  final List<String> _items = [
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

  final List<String> _items2 = [
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
        _filteredItems =
            _items.where((item) => item.toLowerCase().contains(searchText.toLowerCase())).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: true,
        backgroundColor: Colors.grey,
        toolbarHeight: 40,
        // titleSpacing: 50,
        title: TextField(
          cursorHeight: 18,
          cursorColor: Colors.black,
          toolbarOptions: ToolbarOptions(
            copy: true,
            paste: true,
            selectAll: true,
          ),
          autofocus: true,
          controller: _searchController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
            filled: true,
              fillColor: Colors.white,

              hintText: 'Search...',
              hintStyle: TextStyle(fontSize: 12)
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            enableFeedback: true,
            subtitle: Text(_filteredItems[index],style: TextStyle(color: Colors.black),),
            title: Visibility(
              visible: true,
              child: Text(
                _filteredItems[index],
                style: ParticleFont.micro(
                  context,
                  customization: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),

            ),
          );
        },
      ),
      // bottomNavigationBar: CutomBottomAppBar(),
    );
  }
}
