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

Future otpInputValidation() async {
  // need input format in the pincode field where only numbers are allowed from 0-9
  TextEditingController pincodeController = TextEditingController();

// Define a regular expression pattern to match only numbers from 0-9
  RegExp regex = RegExp(r'^[0-9]+$');

// Create a listener for the pincode field to check for input validity
  pincodeController.addListener(() {
    String text = pincodeController.text;
    if (!regex.hasMatch(text)) {
      // If the input does not match the pattern, remove the invalid characters
      pincodeController.text = text.replaceAll(RegExp(r'[^\d]'), '');
      pincodeController.selection = TextSelection.fromPosition(
          TextPosition(offset: pincodeController.text.length));
    }
  });
}
