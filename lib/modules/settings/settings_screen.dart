import 'package:flutter/material.dart';
import 'package:news/modules/settings/settings_details.dart';
// import 'package:todo_application/modules/settings/theme.dart';
import '../../model/category.dart';
import '../../providers/myProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../screens/Categories_screen.dart';
import '../../screens/drawer_widget.dart';
import '../../screens/homescreen.dart';
import '../../shared/styles/colors.dart';
import 'language.dart';

class SettingsScreen extends StatefulWidget {
  static const String routename = 'Settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        drawer: DrawerWidget(drawerClicked),
        appBar: AppBar(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.transparent)),
          backgroundColor: greenColor,
          title: Container(
            // padding: EdgeInsets.only(left: 50),

              child: Text(
                'Settings',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
              )),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 20 ),
                padding: EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                    border:
                    Border.all(color: Color.fromRGBO(57, 165, 82, 1.0)),
                   ),
                child: InkWell(
                    onTap: () {
                      return showLanguageSheet(context);
                    },
                    child: Text(pro.language == "ar"
                        ? AppLocalizations.of(context)!.arabic
                        : AppLocalizations.of(context)!.english)
                      ),
              ),
              SizedBox(
                height: 50,
              ),

            ],
          ),
        ),

      ),
    );
  }

  void showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (c) {
          return Language_sheet();
        });
  }

  Category? selectedCategory = null;

  drawerClicked(selectednumber) {
    if (selectednumber == DrawerWidget.category_no) {
      Navigator.pop(context);
      Navigator.pop(context);
    }
    setState(() {});
    Navigator.pop(context);
  }
}
