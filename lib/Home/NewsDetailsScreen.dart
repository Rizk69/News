import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news__response.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Data/DateTime.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const routename = 'newscreen';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as News;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('lib/assets/pattern.jpg'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'News Title',
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    imageUrl: '${args.urlToImage}',
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(args.source?.name ?? '',
                        style:
                            TextStyle(color: Color(0XFF707070), fontSize: 12),
                        textAlign: TextAlign.start),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${args.title}'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(DateTimee.formatDateTime(args.publishedAt ?? ''),
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Color(0XFF707070))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24)),
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Text(
                              args.content ?? 'Not Found',
                              style: TextStyle(
                                color: Color(0XFF42505C),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextButton(
                                onPressed: () {
                                  openLinkClick(args.url);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'View Full Article',
                                      style: TextStyle(
                                          color: Color(0XFF42505C),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.keyboard_double_arrow_right_sharp,
                                      color: Colors.black,
                                    )
                                  ],
                                ))
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  openLinkClick(String? url) async {
    if (url == null) {
      return;
    }
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
