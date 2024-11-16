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
  apiKey: "AIzaSyA725ECsOg0p_pn9k4oGIpludbpTy31SqI",
  authDomain: "skill-connect-7f2bb.firebaseapp.com",
  projectId: "skill-connect-7f2bb",
  storageBucket: "skill-connect-7f2bb.firebasestorage.app",
  messagingSenderId: "363998759689",
  appId: "1:363998759689:web:2fc24b4bfd787de34621d8"
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
