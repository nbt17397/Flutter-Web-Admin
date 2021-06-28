import 'dart:convert';
import 'dart:developer';
import 'dart:html' as html;
import 'dart:io';
import 'dart:typed_data';

import 'package:admin/constants.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Alignment;

class ExportExcel extends StatefulWidget {
  final String title;

  const ExportExcel({Key? key, required this.title}) : super(key: key);
  @override
  _ExportExcelState createState() => _ExportExcelState();
}

class _ExportExcelState extends State<ExportExcel> {
  Uint8List _uint8list = Uint8List(0);
  String name = "";
  Future<void> _createExcel(Uint8List uint8list) async {
    //Create a Excel document.
    //Creating a workbook.
    final Workbook workbook = Workbook();
    //Accessing via index.
    final Worksheet sheet = workbook.worksheets[0];
    //Save and launch the excel.
    final List<int> bytes = workbook.saveAsStream();
    final List<int> byte = uint8list;
    //Dispose the document.
    workbook.dispose();
    //Download the output file
    html.AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(byte)}")
      ..setAttribute("download", "output.xlsx")
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(title: widget.title),
              SizedBox(height: 3),
              Divider(height: 1, color: Colors.white10),
              SizedBox(height: defaultPadding),
              MaterialButton(
                height: 40,
                minWidth: 200,
                child: Text('Import FILE'),
                color: Colors.blue,
                onPressed: () async {
                  var picked = await FilePicker.platform.pickFiles();

                  if (picked != null) {
                    print(picked.files.first.name);
                    print(picked.files.first.path);
                    print(picked.files.first.bytes);
                  }
                  setState(() {
                    _uint8list = picked!.files.single.bytes!;
                    name = picked.files.single.name;
                  });
                },
              ),
              SizedBox(height: 20),
              name != "" ? Text(name,style: TextStyle(color: Colors.white),): SizedBox(),
              SizedBox(height: 20),
              MaterialButton(
                height: 40,
                minWidth: 200,
                onPressed: () {
                  _createExcel(_uint8list);
                },
                color: Colors.blue,
                child: Text('Export excel'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
