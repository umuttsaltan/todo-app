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
    apiKey: 'AIzaSyBKlOHTDeEbILW1Oan827bTGFHH3BuPg0E',
    appId: '1:514467248990:web:9d5384d43f1ef558dcedcf',
    messagingSenderId: '514467248990',
    projectId: 'todo-app-4e65f',
    authDomain: 'todo-app-4e65f.firebaseapp.com',
    storageBucket: 'todo-app-4e65f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCf2oHtjSrASUEovi5VDiMqsSzi3lqbuY',
    appId: '1:514467248990:android:7bedd6599c3b44d0dcedcf',
    messagingSenderId: '514467248990',
    projectId: 'todo-app-4e65f',
    storageBucket: 'todo-app-4e65f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASUTV61FBr-cjgKEXVMdU0wbSsOEDull0',
    appId: '1:514467248990:ios:6f4364ba4f5ed1e4dcedcf',
    messagingSenderId: '514467248990',
    projectId: 'todo-app-4e65f',
    storageBucket: 'todo-app-4e65f.appspot.com',
    iosBundleId: 'com.example.todoapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASUTV61FBr-cjgKEXVMdU0wbSsOEDull0',
    appId: '1:514467248990:ios:457fe853ca9c030fdcedcf',
    messagingSenderId: '514467248990',
    projectId: 'todo-app-4e65f',
    storageBucket: 'todo-app-4e65f.appspot.com',
    iosBundleId: 'com.example.todoapp.RunnerTests',
  );
}