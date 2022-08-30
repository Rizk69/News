import 'package:flutter/material.dart';

class DrawerDetails extends StatelessWidget {
  static const int categore = 10;
  static const int setting = 20;
  Function onItemsClick;

  DrawerDetails(this.onItemsClick);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          alignment: Alignment.center,
          color: Theme.of(context).primaryColor,
          height: 150,
          child: Text('News App..!',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center),
        ),
        InkWell(
          onTap: () {
            onItemsClick(categore);
          },
          child: Row(
            children: [
              ImageIcon(
                AssetImage('lib/assets/Icon menue.png'),
                size: 50,
              ),
              Text('Categoris',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF303030)))
            ],
          ),
        ),
        InkWell(
          onTap: () {
            onItemsClick(setting);
          },
          child: Row(
            children: [
              ImageIcon(
                AssetImage('lib/assets/Icon settings.png'),
                size: 50,
              ),
              Text('Settings',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF303030)))
            ],
          ),
        )
      ],
    );
  }
}
