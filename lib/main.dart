import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './providers/posts_provider.dart';
import './screens/posts_list_screen.dart';
import './screens/post_details_screen.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext ctx) => Posts([]),
        ),
      ],
      child: const MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData ourTheme = configureTheme(context);
    return MaterialApp(
      title: 'Tarn Aeluin Posts',
      theme: ourTheme,
      home: PostsListScreen(),
      routes: {
        PostDetailsScreen.routeName: (ctx) => PostDetailsScreen(),
      },
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
