import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      ColorScheme scheme = ColorScheme.fromSeed(seedColor: Colors.deepOrange);
      return ChangeNotifierProvider(
        create: (context) => _AppState(),
        child: MaterialApp(
          title: 'My First Flutter App',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: scheme,
          ),
          home: MainPage(),
        )
      );
  }
}

class _AppState extends ChangeNotifier
{
  WordPair currentWordPair = WordPair('Word', 'pair');
}