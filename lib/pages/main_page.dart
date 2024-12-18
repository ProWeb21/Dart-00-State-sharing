import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var appTheme = Theme.of(context);
    var appState = context.watch<AppState>();

    return Scaffold(
      extendBody: true,      
      body: Container(
        // Fills out the container area
        decoration: BoxDecoration(color: appTheme.colorScheme.secondaryContainer),
        // Forces the container to fill all available window space (horizontally)
        width: double.infinity,
        // Disposes its children vertically (as a column)
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,        
          children: [
            wordPairCard(appTheme, appState),
            wordPairActionButtons(appTheme, appState)
          ]
        ),
      )
    );
  }

  Row wordPairActionButtons(ThemeData appTheme, AppState appState) {
    var icon = appState.favorites.contains(appState.currentWordPair) 
      ? Icons.star
      : Icons.star_border_outlined;    
    return Row(              
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){appState.toggleFavorite(appState.currentWordPair);}, icon: Icon(icon), style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(appTheme.colorScheme.tertiaryContainer))),
              SizedBox(width: 14),
              ElevatedButton(onPressed: (){appState.genNewWordPair();}, child: Text("Press me"))
            ]
          );
  }

  Card wordPairCard(ThemeData appTheme, AppState appState) {
    return Card(
            color: appTheme.colorScheme.onSecondary,
            child: Padding(
              padding: EdgeInsets.all(15), 
              child: Text(appState.currentWordPair.asString, 
                style: (appTheme.textTheme.headlineMedium ?? appTheme.textTheme.displayMedium)!.copyWith(color: appTheme.colorScheme.error)
              )
            )  
          );
  }
}