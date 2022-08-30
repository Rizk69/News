import 'package:flutter/material.dart';
import 'package:news_app/Home/soursTabs.dart';
import 'package:news_app/Network/Api_Manager.dart';

import '../model/Sourse.dart';

class HomeScreen extends StatelessWidget {
  static const String routename = 'homescreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('News App'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FutureBuilder<SourcesRspons>(
            future: ApiManager.getSources(),
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
              var sourses = data?.sources;
              return SourseTabs(sourses!);
            },
          ),
        ],
      ),
    );
  }
}
