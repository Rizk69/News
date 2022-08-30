import 'package:flutter/material.dart';
import 'package:news_app/model/Sourse.dart';
import 'package:news_app/model/news__response.dart';
import '../Network/Api_Manager.dart';
import 'NewsWidgetDeteails.dart';

class NewsList extends StatelessWidget {
  Source source;

  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          FutureBuilder<News_Response>(
            future: ApiManager.getNewsListbysourceID(source.id ?? ''),
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
            },
          ),
        ],
      ),
    );
  }
}
