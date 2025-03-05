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

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<String> generateDocument(
  String? apiKey,
  String? documentId,
  String? format,
  dynamic data,
) async {
  // Add your function code here!
  final requestData = {
    'apiKey': apiKey,
    'document': documentId != null ? documentId : 'sample',
    'data': data != null ? data : {},
    'format': format != null ? format : ''
    // you can add 'email', 'emailSubject', 'emailMessage' to requestData to send the document as an email attachment
  };

  final headers = {'Content-Type': 'application/json'};

  final response = await http.post(
    Uri.parse('https://app.documentero.com/api'),
    headers: headers,
    body: jsonEncode(requestData),
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final documentUrl = jsonResponse['data'];
    return documentUrl;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    print('Error message: ${response.body}');
    throw Exception('Failed to generate document - ${response.body}');
  }
}
