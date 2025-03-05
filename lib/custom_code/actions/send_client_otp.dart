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

import 'package:firebase_auth/firebase_auth.dart';

Future<bool> sendClientOtp(String mobileNumber) async {
  // Add your function code here!
  try {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: mobileNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        print('in am in verification completed.');

        try {
          // Auto verification
          await FirebaseAuth.instance.signInWithCredential(credential);
        } catch (e) {
          print(e);
          print("Invalid Phone no");
          throw Exception("Invalid Mobile No.");
        }
      },
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
      verificationFailed: (FirebaseAuthException e) {
        print('in am in verification failed.');
        print(e.code);
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
          throw Exception("Error during send otp functionality.");
        }
        if (e.code == 'captcha-check-failed') {
          throw Exception("Invalid Mobile Number.");
        }
      },
      timeout: Duration(seconds: 60),
    );

    return true;
  } on Exception catch (e) {
    print("Exception Error: ");
    print(e);
    return false;
  }
}
