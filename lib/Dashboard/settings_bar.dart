import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';

import '../appbar_class.dart';
import '../bottom_appbar_class.dart';
import 'copy_widget.dart';

class SearchableListView extends StatefulWidget {
  @override
  _SearchableListViewState createState() => _SearchableListViewState();
}

class _SearchableListViewState extends State<SearchableListView> {
  // list of items to display in the ListView
  final List<String> _items = [
    'Single-Click Save',
    'IDE ListView & MetaData OverView',
    'Proactive Save -VS Code',
    'Share Code with Shareable Links',
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
    'Information View',
    'AutoComplete',
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
      // appBar: CutomAppBar(
      //   title: 'Support Center',
      // ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // search TextField
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              cursorHeight: 18,
              toolbarOptions: ToolbarOptions(
                copy: true,
                paste: true,
                selectAll: true,
              ),
              autofocus: true,
              controller: _searchController,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: Colors.lightBlue,
                  size: 25,
                ),
                hintText: 'Search...',
              ),
            ),
          ),
          Column(
            children: [
              Container(
                color: Colors.white38,
                height: 230,

                // list view of filtered items
                child: ListView.builder(
                  itemCount: _filteredItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      // subtitle: Text('Tip Link'),
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ParticleButton(
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      text: 'close',
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      // bottomNavigationBar: CutomBottomAppBar(),
    );
  }
}
