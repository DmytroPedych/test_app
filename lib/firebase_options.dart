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
    apiKey: 'AIzaSyBJElSsBfqgAMjZ-ZZSBT6KuG5takzS2kY',
    appId: '1:1004515165561:web:97847f7525ff9c74f8dba8',
    messagingSenderId: '1004515165561',
    projectId: 'shoesapp-8991e',
    authDomain: 'shoesapp-8991e.firebaseapp.com',
    storageBucket: 'shoesapp-8991e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDV74FoKNyawtdBt6Cw4YqOTHBMWV3S8tM',
    appId: '1:1004515165561:android:0732f7265f02e672f8dba8',
    messagingSenderId: '1004515165561',
    projectId: 'shoesapp-8991e',
    storageBucket: 'shoesapp-8991e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCz5PXTtNY9Yd8HwGaeT8Zz65wrEWN0rNY',
    appId: '1:1004515165561:ios:30f0e1995bdf6952f8dba8',
    messagingSenderId: '1004515165561',
    projectId: 'shoesapp-8991e',
    storageBucket: 'shoesapp-8991e.appspot.com',
    iosClientId: '1004515165561-hpvfo3l99ht7u5fnbrafc6ocmiv00mei.apps.googleusercontent.com',
    iosBundleId: 'dmytroPedych.shoesTestApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCz5PXTtNY9Yd8HwGaeT8Zz65wrEWN0rNY',
    appId: '1:1004515165561:ios:350a6debac6e7a17f8dba8',
    messagingSenderId: '1004515165561',
    projectId: 'shoesapp-8991e',
    storageBucket: 'shoesapp-8991e.appspot.com',
    iosClientId: '1004515165561-3fmkt90koav10flggtclmceaid7f8jec.apps.googleusercontent.com',
    iosBundleId: 'dmytroPedych.shoesTestApp.RunnerTests',
  );
}