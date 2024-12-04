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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future selectAll() async {
  //   // Upon clicking on the value section of the input field, the entire entered value should be selected by default.
  await Future.delayed(Duration
      .zero); // wait for the next frame to ensure the text field is fully loaded
  final textController = TextEditingController.fromValue(
    TextEditingValue(
      text: 'Your text here',
      selection:
          TextSelection(baseOffset: 0, extentOffset: 'Your text here'.length),
    ),
  );
  textController.selection =
      TextSelection(baseOffset: 0, extentOffset: textController.text.length);
}
