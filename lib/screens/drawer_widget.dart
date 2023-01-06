import 'package:flutter/material.dart';
import 'package:news/layout/home.dart';
import 'package:news/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../model/category.dart';
import '../modules/settings/settings_screen.dart';
import '../providers/myProvider.dart';

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
    var pro = Provider.of<MyProvider>(context);

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
                  margin: pro.language == "ar"
                      ? EdgeInsets.only(left: 16)
                      : EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.list_rounded,
                    color: blackColor,
                    size: 30,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.caetgories,
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
                  margin: pro.language == "ar"
                      ? EdgeInsets.only(left: 16)
                      : EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.settings,
                    color: blackColor,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.settings,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
            onTap: () {
              widget.selectedClicked(DrawerWidget.settings_no);
            },
          ),
        ],
      ),
    );
  }
}
