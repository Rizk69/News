import 'package:flutter/material.dart';
import 'package:news_app/News/New_list.dart';

import '../model/Sourse.dart';
import 'SoursTab.dart';

class SourseTabs extends StatefulWidget {
  List<Source> sourse;

  SourseTabs(this.sourse);

  @override
  State<SourseTabs> createState() => _SourseTabsState();
}

class _SourseTabsState extends State<SourseTabs> {
  int selectedtab = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: widget.sourse.length,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              child: TabBar(
                  onTap: (index) {
                    selectedtab = index;
                    setState(() {});
                  },
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  tabs: widget.sourse.map((sourses) {
                    bool isselected =
                        widget.sourse.indexOf(sourses) == selectedtab;
                    return SourseTab(sourses, isselected);
                  }).toList()),
            ),
            NewsList(widget.sourse[selectedtab]),
          ],
        ),
      ),
    );
  }
}
