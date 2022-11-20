import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyDataTable(),
      ),
    );
  }
}

class MyDataTable extends StatelessWidget {
  const MyDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        /// TOP LEFT TITLE
        DataColumn(
          label: Expanded(
            child: Text(
              'User',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),

        /// FIRST COLUMN TO THE RIGHT OF THE INITIAL COLUMN
        DataColumn(
          label: Expanded(
            child: Text(
              '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              '2, 3',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              '3, 3',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        /// this is the first data row in our table
        ///    (   x , y    )
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0, 2')),
            DataCell(Text('1, 2')),
            DataCell(Text('2, 2')),
            DataCell(Text('3, 2')),
          ],
        ),

        /// this is the 1st row above the bottom row
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0, 1')),
            DataCell(Text('1, 1')),
            DataCell(Text('2, 1')),
            DataCell(Text('3, 1')),
          ],
        ),

        /// this is the Bottom Row
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0, 0')),
            DataCell(Text('1, 0')),
            DataCell(Text('2, 0')),
            DataCell(Text('3, 0')),
          ],
        ),
      ],
    );
  }
}
