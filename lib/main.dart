import 'package:flutter/material.dart';
import 'package:smart_home_page_design/smart_homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SmartHomepage(),
      theme: ThemeData(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
