import 'package:flutter/material.dart';
import 'package:news_app/Categoris/Categoris.dart';
import 'package:news_app/News/News_Fragment.dart';
import 'package:news_app/Settings/Settings.dart';
import '../Network/Api_Manager.dart';
import '../News/NewsWidgetDeteails.dart';
import '../model/news__response.dart';
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
          title: Text(
            'News App',
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: ClickSearch());
                  },
                  icon: Icon(
                    Icons.search,
                    size: 25,
                  )),
            )
          ],
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

class ClickSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(
            Icons.search,
            size: 25,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.clear,
          size: 25,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: FutureBuilder<News_Response>(
          future: ApiManager.getNewsListbysourceID(searchKey: query),
          builder: (buildContext, snapShot) {
            if (snapShot.hasError) {
              return Center(child: Text(snapShot.error.toString()));
            } else if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            var data = snapShot.data;
            if (data?.status == 'error') {
              return Center(child: Text('${data?.message}'));
            }
            return Expanded(
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return NewsWidgetDeteails((data?.newsList![index])!);
                },
                itemCount: data?.newsList?.length,
              ),
            );
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/assets/pattern.jpg'))));
  }
}
