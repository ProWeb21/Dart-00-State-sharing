import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      ColorScheme scheme = ColorScheme.fromSeed(seedColor: Colors.deepOrange);
      return MaterialApp(
        title: 'My First Flutter App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: scheme,
        ),
        home: MainPage(),
      );
  }
}