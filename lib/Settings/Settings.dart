import 'package:flutter/material.dart';

import 'LanguagebouttenSheet.dart';

class SettingsFragment extends StatefulWidget {
  @override
  State<SettingsFragment> createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Text(
            'Language',
            style: TextStyle(
                color: Color(0XFF303030),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            showLanguagebouttenSheet();
          },
          child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 1),
                borderRadius: BorderRadius.circular(0),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'English',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Icon(Icons.arrow_drop_down_sharp,
                      color: Theme.of(context).primaryColor)
                ],
              )),
        ),
      ],
    );
  }

  void showLanguagebouttenSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return LanguagebouttenSheet();
        });
  }
}
