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

Future<double> convertFeetToCM(String feet, String inch) async {
  // Convert feet and inch to numerical types
  double feetValue = double.tryParse(feet) ?? 0.0;
  double inchValue = double.tryParse(inch) ?? 0.0;

  // Calculate total inches and convert to centimeters
  double totalInches = (feetValue * 12 + inchValue);
  double cm = totalInches * 2.54;

  return cm;
}
