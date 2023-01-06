import 'package:flutter/material.dart';
import 'package:news/model/SourcesRes.dart';
import 'package:news/shared/styles/colors.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool isSelected;

  TabItem(this.source, this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 16),
        decoration: BoxDecoration(
            color: isSelected ? greenColor : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: greenColor , width: 2)),
        child: Text(
          source.name ?? "",
          style: TextStyle(
              fontSize: 14, color: isSelected ? Colors.white : greenColor),
        ));
  }
}
