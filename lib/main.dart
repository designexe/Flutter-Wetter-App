import 'package:flutter/material.dart';
import 'package:wetter_app/pages/input_page.dart';
import 'package:wetter_app/pages/result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      routes: {
        '/': (context) => InputPage(),
        '/result-page': (context) => ResultPage(),
      },
      initialRoute: '/',
    );
  }
}
