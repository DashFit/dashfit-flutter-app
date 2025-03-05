// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future exportPDF(
  String name,
  String mobileNumber,
  String email,
  List<MusclesStruct> muscleScore,
  double totalScore,
) async {
  final pdf = pw.Document();

  // Get current date and format it
  String currentDate = DateFormat('d MMMM yyyy').format(DateTime.now());

  // Create a list of TableRow widgets to hold the table data
  List<pw.TableRow> tableRows = [];

  // Add headers for the table
  tableRows.add(pw.TableRow(children: [
    pw.Container(
      padding: pw.EdgeInsets.all(8.0), // Add padding to header cell
      alignment: pw.Alignment.centerLeft,
      child: pw.Text('Muscle Name',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
    ),
    pw.Container(
      padding: pw.EdgeInsets.all(8.0), // Add padding to header cell
      alignment: pw.Alignment.centerRight,
      child: pw.Text('Muscle Value',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
    ),
  ]));

  // Add data rows to the table
  for (var score in muscleScore) {
    tableRows.add(pw.TableRow(children: [
      pw.Container(
        padding: pw.EdgeInsets.all(8.0), // Add padding to table cell
        alignment: pw.Alignment.centerLeft,
        child: pw.Text(score.name),
      ),
      pw.Container(
        padding: pw.EdgeInsets.all(8.0), // Add padding to table cell
        alignment: pw.Alignment.centerRight,
        child: pw.Text(score.value.toString()),
      ),
    ]));
  }

  // Add basic information and table to the PDF
  pdf.addPage(pw.Page(
      build: (pw.Context context) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Align(
                alignment: pw.Alignment.topRight,
                child: pw.Text(
                  'Report date: $currentDate',
                  style: pw.TextStyle(fontSize: 12.0),
                ),
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Daily Report',
                    style: pw.TextStyle(
                        fontSize: 20.0, fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),
              pw.Divider(thickness: 2),
              pw.Padding(
                padding: pw.EdgeInsets.only(
                    top: 16.0,
                    bottom:
                        4.0), // Add more padding above and same padding below
                child: pw.Text('Name : ' + name,
                    style: pw.TextStyle(fontSize: 16.0)),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.symmetric(
                    vertical: 4.0), // Add vertical padding
                child: pw.Text('Email : ' + email,
                    style: pw.TextStyle(fontSize: 16.0)),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.symmetric(
                    vertical: 4.0), // Add vertical padding
                child: pw.Text('Mobile Number : ' + mobileNumber,
                    style: pw.TextStyle(fontSize: 16.0)),
              ),
              pw.SizedBox(height: 20),
              pw.Container(
                width: 300, // Set table width
                child: pw.Table(
                  columnWidths: {
                    0: pw.FixedColumnWidth(150), // Set width for column 0
                  },
                  border: pw.TableBorder.all(),
                  children: tableRows,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text('Total : ' + totalScore.toString(),
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 16.0,
                          fontStyle: pw.FontStyle.italic)),
                ],
              ),
            ],
          )));

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
