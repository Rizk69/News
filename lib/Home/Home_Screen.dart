import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Categoris/Categoris.dart';
import 'package:news_app/News/News_Fragment.dart';
import 'package:news_app/Settings/Settings.dart';
import 'DrawerDetails.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('lib/assets/pattern.jpg'))),
      child: Scaffold(
        drawer: Drawer(
          child: DrawerDetails(onDrawerItemsClick),
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('News Apps..!'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(24),
            ),
          ),
        ),
        body: currentwidget,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentwidget = CategorisFragment(onCategoryClick);
  }

  late Widget currentwidget;

  void onCategoryClick(Category category) {
    currentwidget = NewsFragment(category);
    setState(() {});
  }

  void onDrawerItemsClick(int type) {
    if (type == DrawerDetails.categore) {
      currentwidget = CategorisFragment(onCategoryClick);
    } else if (type == DrawerDetails.setting) {
      currentwidget = SettingsFragment();
    }
    setState(() {});
    Navigator.pop(context);
  }
}
