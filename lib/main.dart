import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/favorites_page.dart';
import 'package:flutter_application_1/pages/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppScreenState();    
  }
}

class MyAppScreenState extends State
{
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      ColorScheme scheme = ColorScheme.fromSeed(seedColor: Colors.deepOrange);
      return ChangeNotifierProvider(
        create: (context) => AppState(),
        child: MaterialApp(
          title: 'My First Flutter App',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: scheme,
          ),
          home: Row(
            children: [
              NavigationRail(
                destinations: [
                  NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
                  NavigationRailDestination(icon: Icon(Icons.star), label: Text('Favorites')),
                ], 
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
              Expanded(
                child: (selectedIndex == 1) ? FavoritesPage() : MainPage()
              )
            ],
          ),
        )
      );
  }
}

class AppState extends ChangeNotifier
{
  WordPair currentWordPair = WordPair('Word', 'pair');
  List<WordPair> _favorites = <WordPair>[];

  List<WordPair> get favorites {
    return _favorites.toList(growable: false);
  }

  void genNewWordPair()
  {
    currentWordPair = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite(WordPair favorite)
  {
    if (!_favorites.contains(favorite))
    {
      addFavorite(favorite);
    } else {
      removeFavorite(favorite);
    }
  }

  @protected
  void addFavorite(WordPair favorite)
  {
    if (!_favorites.contains(favorite))
    {
      _favorites.add(favorite);
      notifyListeners();
    }
  }

  @protected
  void removeFavorite(WordPair favorite)
  {
    if (_favorites.contains(favorite))
    {
      _favorites.remove(favorite);
      notifyListeners();
    }
  }  
}