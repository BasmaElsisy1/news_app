import 'package:flutter/material.dart';
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

class Settings_details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);

    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(12),
            width: double.infinity,
            // decoration: BoxDecoration(
            //     border:
            //     // Border.all(color: Theme.of(context).colorScheme.onSecondary),
            //     borderRadius: BorderRadius.circular(12)),
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
    );
  }

  void showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (c) {
          return Language_sheet();
        });
  }

}