import 'package:flutter/material.dart';

class MainPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var appTheme = Theme.of(context);

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
            Card(
              color: appTheme.colorScheme.onSecondary,
              child: Padding(
                padding: EdgeInsets.all(15), 
                child: Text("Wordpair", 
                  style: (appTheme.textTheme.headlineMedium ?? appTheme.textTheme.displayMedium)!.copyWith(color: appTheme.colorScheme.error)
                )
              )  
            ),
            ElevatedButton(onPressed: (){}, child: Text("Press me")),
          ]
        ),
      )
    );
  }
}