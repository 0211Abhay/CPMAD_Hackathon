import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
            'DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
  apiKey: "AIzaSyDbg7zxSNbZpt1ISOzcRGmUKQYaLgV0nqk",
  authDomain: "chat-app-acbad.firebaseapp.com",
  projectId: "chat-app-acbad",
  storageBucket: "chat-app-acbad.firebasestorage.app",
  messagingSenderId: "82199167931",
  appId: "1:82199167931:web:7f41cc9fa4e16a30bbfa9e",
  measurementId: "G-1N0K9MM5NV"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'your-android-api-key',
    authDomain: 'your-project-id.firebaseapp.com',
    projectId: 'your-project-id',
    storageBucket: 'your-project-id.appspot.com',
    messagingSenderId: 'your-messaging-sender-id',
    appId: 'your-android-app-id',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'your-ios-api-key',
    authDomain: 'your-project-id.firebaseapp.com',
    projectId: 'your-project-id',
    storageBucket: 'your-project-id.appspot.com',
    messagingSenderId: 'your-messaging-sender-id',
    appId: 'your-ios-app-id',
    iosBundleId: 'your-ios-bundle-id',
  );
}
