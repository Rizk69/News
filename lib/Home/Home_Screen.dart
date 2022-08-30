import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/News/News_Fragment.dart';

class HomeScreen extends StatelessWidget {
  static const String routename = 'homescreen';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('lib/assets/pattern.jpg'))),
      child: Scaffold(
        drawer: Drawer(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('News Apps..!'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
        ),
        body: NewsFragment(),
      ),
    );
  }
}
