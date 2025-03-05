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

// Imports other custom actions

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future createPDFDoc(List<UsersRecord> userDoc) async {
  // download pdf file base on users documents in 1 page
// Define the function to download pdf file

  final pdf = pw.Document();
  // Add a title to the pdf file
  pdf.addPage(pw.MultiPage(
      build: (context) => [
            pw.Header(
                level: 0,
                child: pw.Text('Muscle Documents',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
            // ignore: deprecated_member_use
            pw.Table.fromTextArray(context: context, data: <List<String>>[
              <String>['Name', 'Email', 'Phone'],
              ...userDoc.map((muscle) => [muscle.email])
            ])
          ]));

  // Print the pdf file
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
