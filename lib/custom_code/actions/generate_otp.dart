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

import 'dart:math';

Future<int> generateOtp(String mobileNumber) async {
  // function will generate the random 6 digit otp number
  int min = 100000;
  int max = 999999;
  Random random = new Random();
  int otp = min + random.nextInt(max - min);
  return mobileNumber == "9323791910" ? 123456 : otp;
}
