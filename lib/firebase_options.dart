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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBv3tmspQ0H6adsJe762kOoe1OQV1PMJ_o',
    appId: '1:1067005055691:web:7857d21569ddc09b32c14e',
    messagingSenderId: '1067005055691',
    projectId: 'demoapp-85b44',
    authDomain: 'demoapp-85b44.firebaseapp.com',
    storageBucket: 'demoapp-85b44.appspot.com',
    measurementId: 'G-CVS927XGEK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXk6jhMpSyv8rpR8Nuxr-YxQrpAomE-U4',
    appId: '1:1067005055691:android:aabe157e3459abe832c14e',
    messagingSenderId: '1067005055691',
    projectId: 'demoapp-85b44',
    storageBucket: 'demoapp-85b44.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAbaMKNqWSnkcAf3C7-QVreVJ5mBKfq2sU',
    appId: '1:1067005055691:ios:b91d8e8f439de96c32c14e',
    messagingSenderId: '1067005055691',
    projectId: 'demoapp-85b44',
    storageBucket: 'demoapp-85b44.appspot.com',
    iosBundleId: 'com.example.newsApp',
  );
}