import 'package:flutter/material.dart';
import 'package:news/layout/delegateClass.dart';
import 'package:news/model/SourcesRes.dart';
import 'package:news/model/category.dart';
import 'package:news/modules/settings/settings_screen.dart';
import 'package:news/screens/Categories_screen.dart';
import 'package:news/screens/drawer_widget.dart';
import 'package:news/screens/homescreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:news/shared/network/remote/api_manager.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../model/NewsRes.dart';
import '../shared/styles/colors.dart';

class HomePage extends StatefulWidget {
  static const String routename = 'Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: DrawerWidget(drawerClicked),
        appBar: AppBar(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.transparent)),
          backgroundColor: greenColor,
          title: Container(
              // padding: EdgeInsets.only(left: 50),

              child: Text(
                AppLocalizations.of(context)!.appBarText,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
          )),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: delegateClass());
                },
                icon: Icon(
                  Icons.search,
                  size: 32,
                ))
          ],
          centerTitle: true,
        ),
        body: selectedCategory == null
            ? Categories_screen(callCategory)
            : HomeScreen(selectedCategory!),
        // body: SettingsScreen(),
      ),
    );
  }

  Category? selectedCategory = null;

  callCategory(Category category) {
    selectedCategory = category;
    setState(() {});
  }

  drawerClicked(selectednumber) {
    if (selectednumber == DrawerWidget.category_no) {
      selectedCategory = null;
      Navigator.pop(context);
    } else if (selectednumber == DrawerWidget.settings_no) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsScreen()),
      );
      print('clicked');
    }
    setState(() {});
  }
}
