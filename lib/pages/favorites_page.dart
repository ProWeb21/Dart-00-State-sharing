import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget
{

  @override
  Widget build(BuildContext context) 
  {
    var appTheme = Theme.of(context);
    var appState = context.watch<AppState>();
    var favorites = appState.favorites;
    return Material(child:
      ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(            
            title: wordPairCard(appTheme, favorites.elementAt(index))
          );
        }, 
        itemCount: favorites.length
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

