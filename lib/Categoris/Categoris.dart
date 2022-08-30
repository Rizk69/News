import 'package:flutter/material.dart';

import 'CategoryWidget.dart';

class CategorisFragment extends StatelessWidget {
  Function onCollbackCategry;

  CategorisFragment(this.onCollbackCategry);

  @override
  Widget build(BuildContext context) {
    var categoris = Category.getAllCategory();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            padding: EdgeInsets.only(left: 12, top: 12),
            child: Text(
              'Pick your category \n of interst',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF4F5A69)),
            )),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
              itemBuilder: (_, index) {
                return InkWell(
                    onTap: () {
                      onCollbackCategry(categoris[index]);
                    },
                    child: CategoryWidget(categoris[index], index));
              },
              itemCount: categoris.length,
            ),
          ),
        ),
      ],
    );
  }
}

class Category {
  String id;
  String title;
  Color color;
  String imagename;

  Category(this.id, this.title, this.color, this.imagename);

  static List<Category> getAllCategory() {
    //business entertainment general health science sports technology
    return [
      Category('sports', 'Sports', Color(0XFFC91C22), 'lib/assets/sports.png'),
      Category(
          'general', 'General', Color(0XFF003E90), 'lib/assets/Politics.png'),
      Category('health', 'Health', Color(0XFFED1E79), 'lib/assets/health.png'),
      Category(
          'business', 'Business', Color(0XFFCF7E48), 'lib/assets/bussines.png'),
      Category('technology', 'Technology', Color(0XFF4882CF),
          'lib/assets/environment.png'),
      Category(
          'science', 'Science', Color(0XFFF2D352), 'lib/assets/science.png'),
    ];
  }
}
