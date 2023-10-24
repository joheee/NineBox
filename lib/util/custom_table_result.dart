
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTableResult extends StatelessWidget {

  List<String> winningList;

  CustomTableResult({
    super.key,
    required this.winningList
  });

  @override
  Widget build(BuildContext context) {

    int index = 0;
    List<DataRow> rows = winningList.map((item) {
      
      return DataRow(cells: [
        DataCell(Text('${++index}')),
        DataCell(Text(item.toString())), 
      ]);
    }).toList();

    return Card(
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Ronde',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Hasil',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows: rows
      ),
    );
  }
}