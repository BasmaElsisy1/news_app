import 'package:flutter/material.dart';
import 'layout/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routename,
      routes: {
        HomePage.routename: (context) => HomePage(),
      },
    );
  }
}


