import 'package:flutter/material.dart';

class SearchableListView extends StatefulWidget {
  @override
  _SearchableListViewState createState() => _SearchableListViewState();
}

class _SearchableListViewState extends State<SearchableListView> {
  // list of items to display in the ListView
  final List<String> _items = [
    "Apple",
    "Banana",
    "Cherry",
    "Date",
    "Grape",
    "Kiwi",
    "Mango",
    "Orange",
    "Pineapple",
    "Strawberry",
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
      appBar: AppBar(
        title: Text("Searchable List"),
      ),
      body: Column(
        children: [
          // search TextField
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Search...",
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
