import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unglakproj/states/authen.dart';
import 'package:unglakproj/states/my_service.dart';

Map<String, WidgetBuilder> map = {
  '/authen': (context) => const Authen(),
  '/myService': (context) => const MyService(),
};

String? firstState;

Future<void> main() async {
  HttpOverrides.global = MyHttpOverride();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        firstState = '/authen';
        runApp(MyApp());
      } else {
        firstState = '/myService';
        runApp(MyApp());
      }
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: map,
      initialRoute: firstState,
    );
  }
}

class MyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
