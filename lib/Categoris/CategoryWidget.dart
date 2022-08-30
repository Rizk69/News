import 'package:flutter/material.dart';
import 'Categoris.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  int index;

  CategoryWidget(this.category, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
            bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category.imagename,
            height: 120,
            fit: BoxFit.fitHeight,
          ),
          Text(
            category.title,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
