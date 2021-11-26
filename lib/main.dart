import 'package:flutter/material.dart';
import './screens/posts_list_screen.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  @override
  Widget build(BuildContext context) {
    final ThemeData ourTheme = configureTheme(context);
    return MaterialApp(
      title: 'Tarn Aeluin Posts',
      theme: ourTheme,
      home: PostsListScreen(),
    );
  }

  ThemeData configureTheme(BuildContext ctx) {
    ThemeData ourTheme = ThemeData(
      primarySwatch: Colors.purple,
      highlightColor: Colors.white,
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: Colors.purple,
        primarySwatch: Colors.purple,
        accentColor: Colors.orange,
        brightness: Brightness.dark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
    return ourTheme;
  }
}
