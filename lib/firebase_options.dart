// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBIqCiybIWUSNFUFkjPY90d1_jbH8E_8aY',
    appId: '1:224463170773:web:0a79bfec6fd91589b7065c',
    messagingSenderId: '224463170773',
    projectId: 'imagetotext-22fe6',
    authDomain: 'imagetotext-22fe6.firebaseapp.com',
    storageBucket: 'imagetotext-22fe6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiw_k2b7Nq93JDn4IFWBd9XTtSgCplM8k',
    appId: '1:224463170773:android:a6aa2d594a8575b7b7065c',
    messagingSenderId: '224463170773',
    projectId: 'imagetotext-22fe6',
    storageBucket: 'imagetotext-22fe6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJooafg8-N4neh9gtw_2V6_UlDWUEbCEU',
    appId: '1:224463170773:ios:8182cada47409679b7065c',
    messagingSenderId: '224463170773',
    projectId: 'imagetotext-22fe6',
    storageBucket: 'imagetotext-22fe6.appspot.com',
    iosBundleId: 'com.example.firstml',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDJooafg8-N4neh9gtw_2V6_UlDWUEbCEU',
    appId: '1:224463170773:ios:8182cada47409679b7065c',
    messagingSenderId: '224463170773',
    projectId: 'imagetotext-22fe6',
    storageBucket: 'imagetotext-22fe6.appspot.com',
    iosBundleId: 'com.example.firstml',
  );
}