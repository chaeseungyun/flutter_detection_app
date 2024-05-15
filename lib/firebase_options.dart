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
    apiKey: 'AIzaSyDdFKyGW1-l0kDL3zYe5Y2EJOhJgmVHwgY',
    appId: '1:897265388364:web:4350ab96746fcbd40edde9',
    messagingSenderId: '897265388364',
    projectId: 'detectionapp-9fad2',
    authDomain: 'detectionapp-9fad2.firebaseapp.com',
    storageBucket: 'detectionapp-9fad2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChvE3f_TCezEw1DwM9QAQlN2v61hwtAgk',
    appId: '1:897265388364:android:35bcd3d7c08ce00b0edde9',
    messagingSenderId: '897265388364',
    projectId: 'detectionapp-9fad2',
    storageBucket: 'detectionapp-9fad2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLpW-JT_hSJ_rG_w_p8dZP4ee13TXsuCs',
    appId: '1:897265388364:ios:b7c762d98b273df20edde9',
    messagingSenderId: '897265388364',
    projectId: 'detectionapp-9fad2',
    storageBucket: 'detectionapp-9fad2.appspot.com',
    iosBundleId: 'com.example.detectionApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCLpW-JT_hSJ_rG_w_p8dZP4ee13TXsuCs',
    appId: '1:897265388364:ios:b7c762d98b273df20edde9',
    messagingSenderId: '897265388364',
    projectId: 'detectionapp-9fad2',
    storageBucket: 'detectionapp-9fad2.appspot.com',
    iosBundleId: 'com.example.detectionApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDdFKyGW1-l0kDL3zYe5Y2EJOhJgmVHwgY',
    appId: '1:897265388364:web:1c2503c78dc95d8d0edde9',
    messagingSenderId: '897265388364',
    projectId: 'detectionapp-9fad2',
    authDomain: 'detectionapp-9fad2.firebaseapp.com',
    storageBucket: 'detectionapp-9fad2.appspot.com',
  );
}