import 'package:flutter/material.dart';
import 'package:news_app/Categoris/Categoris.dart';
import 'package:news_app/Network/Api_Manager.dart';
import '../model/Sourse.dart';
import 'SoursTabs.dart';

class NewsFragment extends StatelessWidget {
  Category category;

  NewsFragment(this.category);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FutureBuilder<SourcesRspons>(
          future: ApiManager.getSources(category.id),
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
            var sources = data?.sources;
            return SourseTabs(sources!);
          },
        ),
      ],
    );
  }
}
