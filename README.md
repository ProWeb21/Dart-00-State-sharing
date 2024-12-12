# flutter_application_1

A new Flutter project inteded for State sharing techniques exploration

## Motivation

When designing stateful components applications, it is sometimes needed to have a common shared state among components whose can be unrelated or whose can fall in different tree levels.  
It makes necessary to look for ways to handle sharing a state in common between them in a way that it doesn't get lost due repainting (or rebuilding).  

## Inspiration

Initial idea of using a shared state is taken from this official Flutter tutorial:  
https://www.youtube.com/watch?v=8sAyPDLorek  
  
which follows the instructions from this codelab  
https://codelabs.developers.google.com/codelabs/flutter-codelab-first#0

### The matter
In the official flutter tutorial, the `main.dart` file contains an _App_, which consist in a `MaterialApp` that has a _State_ (`MyAppState`) which is _Notifiable_ to _watchers_, such the page _widget_ called `MyHomePage`.

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}
```

In this tutorial the `MyAppState` controls the `current` and the `favorites` vars, and manages them at the TOP of the application.
  
This approach has the advantage of not needing `StatfulWidgets` because all of them whatch & use a common shared state which is `MyAppState`.
  
> Please, refer the following illustration to see the composition of the tutorial's result Project  
>  
> ![First flutter app shared state and widget composition in a simple hierarchy tree](assets/First%20Flutter%20app%20shared%20state%20and%20widget%20composition.png)
>  

The way _stateless widgets_ observe (aka "watch") `MyAppState` is via their `build` methods, where a variable named `appState` is a _watch_ of this.  
As it will be seen in the code
  
```dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
            ...
        ],
      ),
    );
  }
}
```

