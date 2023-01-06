import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/screens/screen_details.dart';
import 'package:news/modules/settings/settings_screen.dart';
import 'package:news/providers/myProvider.dart';
import 'package:provider/provider.dart';
import 'layout/home.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: HomePage.routename,
      locale: Locale(provider.language),
      supportedLocales: [
        Locale('en'), // English, no country code
        Locale('ar'), // Spanish, no country code
      ],
      routes: {
        HomePage.routename: (context) => HomePage(),
        SettingsScreen.routename: (context) => SettingsScreen(),
        DetailsScreen.routename : (context) => DetailsScreen()
      },
    );
  }
}


