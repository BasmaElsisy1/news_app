import 'package:flutter/material.dart';
import 'package:news/model/category.dart';

class Category_item extends StatelessWidget {
  Category category;
  int index;
  Category_item(this.category , this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(11),
     decoration: BoxDecoration(
       color: category.colorBG,
       borderRadius: BorderRadius.only(
         topLeft: Radius.circular(25),
         topRight: Radius.circular(25),
         bottomLeft: index%2==0? Radius.circular(25): Radius.circular(0),
         bottomRight:  index%2==0? Radius.circular(0): Radius.circular(25),
       )
     ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(category.image , height: 90, width: 100,),
          Text(category.title , style: TextStyle(fontSize: 18,color: Colors.white),)],
      ),
    );
  }
}
