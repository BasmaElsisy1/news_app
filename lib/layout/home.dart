import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../shared/styles/colors.dart';

import '../shared/styles/colors.dart';

class HomePage extends StatelessWidget {
  static const String routename = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        title: Container(
            padding: EdgeInsets.only(left: 50),
            child: Text(
              'News App',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
            )),
        centerTitle: false,
      ),
      // body: screen[current_index],
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 8,
      //   child: BottomNavigationBar(
      //     backgroundColor: Colors.transparent,
      //     elevation: 0.0,
      //     type: BottomNavigationBarType.fixed,
      //     currentIndex: current_index,
      //     onTap: (index) {
      //       current_index = index;
      //       setState(() {});
      //     },
      //     items: [
      //       BottomNavigationBarItem(
      //           backgroundColor: pro.themeMode == ThemeMode.light
      //               ? Colors.white
      //               : blackColor,
      //           icon: Icon(
      //             Icons.list_rounded,
      //             size: 40,
      //           ),
      //           label: ''),
      //       BottomNavigationBarItem(
      //         backgroundColor:
      //         pro.themeMode == ThemeMode.light ? Colors.white : blackColor,
      //         icon: ImageIcon(
      //           AssetImage('assets/images/icon-settings.png'),
      //           size: 30,
      //         ),
      //         label: '',
      //       )
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     return showBottomAddTask();
      //   },
      //   child: Icon(Icons.add),
      //   shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 5)),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
