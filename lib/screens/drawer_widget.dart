import 'package:flutter/material.dart';
import 'package:news/layout/home.dart';
import 'package:news/shared/styles/colors.dart';

import '../model/category.dart';
import '../modules/settings/settings_screen.dart';

class DrawerWidget extends StatefulWidget {
  Function selectedClicked;
  static int category_no = 1;
  static int settings_no = 2;
  DrawerWidget(this.selectedClicked);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * .80,

      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(57, 165, 82, 1.0),
            ),
            child: Text(
              'News App!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.list_rounded,
                    color: blackColor,
                    size: 30,
                  ),
                ),
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
            onTap: () {
              widget.selectedClicked(DrawerWidget.category_no);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.settings,
                    color: blackColor,
                  ),
                ),
                Text(
                  'Settings',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
            onTap: () {
              widget.selectedClicked
                (DrawerWidget.settings_no);
            },
          ),
        ],
      ),
    );
  }
}
