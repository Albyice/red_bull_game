import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBTN7EXOSjB_GQ3lVRXJwei3l248Qm1-2U",
            authDomain: "red-bull-game-hmebvj.firebaseapp.com",
            projectId: "red-bull-game-hmebvj",
            storageBucket: "red-bull-game-hmebvj.appspot.com",
            messagingSenderId: "746804757510",
            appId: "1:746804757510:web:3d45c07439ab92b20a6f87"));
  } else {
    await Firebase.initializeApp();
  }
}
