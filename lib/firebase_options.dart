// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAJj_YxxGZq5xgbbhjSjpBtVsNSS_RL-bk',
    appId: '1:345235696421:web:9b44fe3e41fc2f65a888cc',
    messagingSenderId: '345235696421',
    projectId: 'aut-app-6221f',
    authDomain: 'aut-app-6221f.firebaseapp.com',
    storageBucket: 'aut-app-6221f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeaCxv52naHRcTr0THijYvJ3hkVvLtEls',
    appId: '1:345235696421:android:d4afbc0627f5a959a888cc',
    messagingSenderId: '345235696421',
    projectId: 'aut-app-6221f',
    storageBucket: 'aut-app-6221f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8DJYQl2kNn7ilUlIQJZqHXuviyMC6pRA',
    appId: '1:345235696421:ios:f6cfbd407b700772a888cc',
    messagingSenderId: '345235696421',
    projectId: 'aut-app-6221f',
    storageBucket: 'aut-app-6221f.appspot.com',
    iosBundleId: 'com.example.autApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8DJYQl2kNn7ilUlIQJZqHXuviyMC6pRA',
    appId: '1:345235696421:ios:f6cfbd407b700772a888cc',
    messagingSenderId: '345235696421',
    projectId: 'aut-app-6221f',
    storageBucket: 'aut-app-6221f.appspot.com',
    iosBundleId: 'com.example.autApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAJj_YxxGZq5xgbbhjSjpBtVsNSS_RL-bk',
    appId: '1:345235696421:web:6ffba6c06329686ca888cc',
    messagingSenderId: '345235696421',
    projectId: 'aut-app-6221f',
    authDomain: 'aut-app-6221f.firebaseapp.com',
    storageBucket: 'aut-app-6221f.appspot.com',
  );
}
