import 'package:flutter/material.dart';

import 'package:news_app/model/Sourse.dart';
import 'SoursTab.dart';


class SourseTabs extends StatelessWidget {

  List<Source> sourses;

  SourseTabs(this.sourses);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: sourses.length,
        child: Column(
            children: [
        TabBar(tabs:sourses.map((sourse) =>{
        return SourseTab(source);
        }).toList()),
    ]
    ,
    )
    ,

    );
  }
}
