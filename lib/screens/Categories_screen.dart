import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/screens/category_item.dart';

class Categories_screen extends StatelessWidget {
  Function callBack;
  Categories_screen(this.callBack);
  @override
  Widget build(BuildContext context) {
    var categoriesList = Category.getCategories();
    return Container(
      padding: EdgeInsets.only(top: 35, left: 35, right: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 35),
              child: Text(
                'Pick your category \n of interest',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: GridView.builder(
                  itemCount: categoriesList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        callBack(categoriesList[index]);
                      },
                        child: Category_item(categoriesList[index], index));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
