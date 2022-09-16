import 'package:flutter/material.dart';
import 'package:news_app/Home/Home_Screen.dart';
import 'package:news_app/Home/NewsDetailsScreen.dart';
import 'package:provider/provider.dart';

import 'Settings/Provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return Settingprovider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<Settingprovider>(context);

    return MaterialApp(
      locale: Locale(settingprovider.curentlang),
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
