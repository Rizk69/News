import 'package:flutter/material.dart';
import 'package:news_app/model/Sourse.dart';

class SourseTab extends StatelessWidget {
  Source sourse;
  bool selected;

  SourseTab(this.sourse, this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          color: selected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
      child: Text(
        sourse.name ?? '',
        style: TextStyle(
            color: selected ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}
