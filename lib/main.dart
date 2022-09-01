import 'package:flutter/material.dart';
import 'package:news_app/Home/Home_Screen.dart';
import 'package:news_app/Home/NewsDetailsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0XFF39A552)),
      routes: {
        HomeScreen.routename: (_) => HomeScreen(),
        NewsDetailsScreen.routename: (_) => NewsDetailsScreen()
      },
      initialRoute: HomeScreen.routename,
    );
  }
}
