import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAmMY5xqfFdvoWCYvVsZ2W21YsBkEOdcH4",
            authDomain: "dashfit-uat.firebaseapp.com",
            projectId: "dashfit-uat",
            storageBucket: "dashfit-uat.appspot.com",
            messagingSenderId: "781284647189",
            appId: "1:781284647189:web:48ad7713cdc2745380091c",
            measurementId: "G-PJW0Q02XWY"));
  } else {
    await Firebase.initializeApp();
  }
}
