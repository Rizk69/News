import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Data/DateTime.dart';
import 'package:news_app/Home/NewsDetailsScreen.dart';
import 'package:news_app/model/news__response.dart';

class NewsWidgetDeteails extends StatelessWidget {
  News news;

  NewsWidgetDeteails(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetailsScreen.routename,
            arguments: news);
      },
      child: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                height: 230,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: '${news.urlToImage}',
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(news.author ?? '',
                style: TextStyle(color: Color(0XFF707070), fontSize: 12),
                textAlign: TextAlign.start),
            Text(
              news.title ?? '',
              style: TextStyle(
                  color: Color(0XFF42505C),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Text(DateTimee.formatDateTime(news.publishedAt ?? ''),
                style: TextStyle(color: Color(0XFF707070), fontSize: 12),
                textAlign: TextAlign.end),
          ],
        ),
      ),
    );
  }
}
