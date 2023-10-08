import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBD3Ykzh4o86Ol-oJMfsbwdirZPEWmEp7Y",
            authDomain: "butique-2c0c6.firebaseapp.com",
            projectId: "butique-2c0c6",
            storageBucket: "butique-2c0c6.appspot.com",
            messagingSenderId: "298461574252",
            appId: "1:298461574252:web:ae63496e18e02877f15449",
            measurementId: "G-S1S12C8N6J"));
  } else {
    await Firebase.initializeApp();
  }
}
