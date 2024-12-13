import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget
{
  final List<WordPair> _favorites = [];

  @override
  FavoritesPage({super.key})
  {
    _favorites.addAll(<WordPair>[
      WordPair.random(), WordPair.random(),
      WordPair.random(), WordPair.random(),
      WordPair.random(), WordPair.random(),
      WordPair.random(), WordPair.random(),
      WordPair.random(), WordPair.random(),
    ]);
  }

  @override
  Widget build(BuildContext context) 
  {
    var appTheme = Theme.of(context);
    
    return Material(child:
      ListView.builder(
        itemBuilder: (context, index) {
          WordPair element = _favorites.elementAt(index);
          return ListTile(            
            title: wordPairCard(appTheme, element)
          );
        }, 
        itemCount: _favorites.length
      )
    );
  }

  Card wordPairCard(ThemeData appTheme, WordPair element) {
    return Card(
      color: appTheme.colorScheme.onSecondary,
      elevation: 1.9,
      child: Padding(
        padding: EdgeInsets.all(8),               
        child: Text(element.asString, 
          style: (appTheme.textTheme.headlineMedium ?? appTheme.textTheme.displayMedium)!.copyWith(color: appTheme.colorScheme.error)
        )
      )
    );
  }
}

