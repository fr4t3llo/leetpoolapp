import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leetpoolapp/api/auth.dart';
import 'package:leetpoolapp/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,

      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(debugShowCheckedModeBanner: false, home: AuthPage());
  }
}
