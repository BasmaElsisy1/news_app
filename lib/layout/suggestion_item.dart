import 'package:flutter/material.dart';
import 'package:news/model/NewsRes.dart';
import 'package:news/model/SourcesRes.dart';
import 'package:news/shared/styles/colors.dart';

class TabItemsugg extends StatelessWidget {
  Articles articles;

  TabItemsugg(this.articles);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 16),
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: greenColor , width: 2)),
        child: Text(
          articles.title?? "",
          style: TextStyle(
              fontSize: 14, ),
        ));
  }
}
