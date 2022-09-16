import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider.dart';

class LanguagebouttenSheet extends StatefulWidget {
  @override
  State<LanguagebouttenSheet> createState() => _LanguagebouttenSheetState();
}

class _LanguagebouttenSheetState extends State<LanguagebouttenSheet> {
  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<Settingprovider>(context);
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                settingprovider.changeLanguage('en');
              },
              child: settingprovider.curentlang == 'en'
                  ? getSelecteditems('English')
                  : getUnSelecteditems('English')),
          SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                settingprovider.changeLanguage('ar');
              },
              child: settingprovider.curentlang == 'ar'
                  ? getSelecteditems('العربيه')
                  : getUnSelecteditems('العربيه')),
        ],
      ),
    );
  }

  Widget getSelecteditems(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 25, color: Colors.green),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  Widget getUnSelecteditems(String text) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 25, color: Colors.black))
      ],
    );
  }
}
