import 'dart:async';

import 'package:admin/constants.dart';
import 'package:admin/data/table_data.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';

class TableDataScreen extends StatefulWidget {
  final String title;

  TableDataScreen({Key? key, required this.title}) : super(key: key);
  @override
  _TableDataScreenState createState() => _TableDataScreenState();
}

class _TableDataScreenState extends State<TableDataScreen> {
  List<String> _selectedRowKeys = [];
  List<String>? _filterTexts;
  bool _willSearch = true;
  int? _latestTick;
  late String _sortColumnName;
  late bool _sortAscending;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _sortColumnName = 'browser';
    _sortAscending = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!_willSearch) {
        if (_latestTick != null && timer.tick > _latestTick!) {
          _willSearch = true;
        }
      }
      if (_willSearch) {
        _willSearch = false;
        _latestTick = null;
        setState(() {
          if (_filterTexts != null && _filterTexts!.isNotEmpty) {
            _filterTexts = _filterTexts;
            print('filterTexts = $_filterTexts');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(title: widget.title),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Container(
                  color: Colors.grey,
                  margin: EdgeInsets.all(4),
                  child: WebDataTable(
                    header: Text('Data'),
                    actions: [
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'increment search...',
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFCCCCCC),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFCCCCCC),
                              ),
                            ),
                          ),
                          onChanged: (text) {
                            _filterTexts = text.trim().split(' ');
                            _willSearch = false;
                            _latestTick = _timer?.tick;
                          },
                        ),
                      ),
                    ],
                    source: WebDataTableSource(
                      filterTexts: _filterTexts,
                      sortAscending: true,
                      columns: [
                        WebDataColumn(
                          name: 'id',
                          label: const Text('ID'),
                          dataCell: (value) => DataCell(Text('$value')),
                        ),
                        WebDataColumn(
                          name: 'renderingEngine',
                          label: const Text('Rendering engine'),
                          dataCell: (value) => DataCell(Text('$value')),
                        ),
                        WebDataColumn(
                          name: 'browser',
                          label: const Text('Browser'),
                          dataCell: (value) => DataCell(Text('$value')),
                        ),
                        WebDataColumn(
                          name: 'platform',
                          label: const Text('Platform(s)'),
                          dataCell: (value) => DataCell(Text('$value')),
                        ),
                        WebDataColumn(
                          name: 'engineVersion',
                          label: const Text('Engine version'),
                          dataCell: (value) => DataCell(Text('$value')),
                        ),
                        WebDataColumn(
                          name: 'cssGrade',
                          label: const Text('CSS grade'),
                          dataCell: (value) => DataCell(Text('$value')),
                          sortable: false,
                        ),
                        WebDataColumn(
                            name: 'dateTime',
                            label: const Text('DateTime'),
                            dataCell: (value) {
                              if (value is DateTime) {
                                final text =
                                    '${value.year}/${value.month}/${value.day} ${value.hour}:${value.minute}:${value.second}';
                                return DataCell(Text(text));
                              }
                              return DataCell(Text(value.toString()));
                            },
                            filterText: (value) {
                              if (value is DateTime) {
                                return '${value.year}/${value.month}/${value.day} ${value.hour}:${value.minute}:${value.second}';
                              }
                              return value.toString();
                            }),
                      ],
                      rows: SampleData().data,
                      selectedRowKeys: _selectedRowKeys,
                      onTapRow: (rows, index) {
                        print(
                            'onTapRow(): index = $index, row = ${rows[index]}');

                      },
                      onSelectRows: (keys) {
                        print(
                            'onSelectRows(): count = ${keys.length} keys = $keys');
                        setState(() {
                          _selectedRowKeys = keys;
                        });
                      },
                      primaryKeyName: 'id',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
