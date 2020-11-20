import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/category.dart';
import 'category_item.dart';

/* this widget present a scrolable horizontal list of the category Items .
   it takes a map of that contains each category title and image path . you can add a new 
   category after instantiation with add category  _ souheil  */

class CategoryList extends StatelessWidget {
  final List<Widget> widgetsList = [];

  // this is a constructor  that takes a map of categories and creat a list of category_item widgets

  CategoryList(List<Category> m1) {
    m1.forEach((element) {
      widgetsList.add(CategoryItem(element));
    });
  }

  // this function add a new category to the list
  void addCategory(Category c1) {
    widgetsList.add(CategoryItem(c1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
            scrollDirection: Axis.horizontal, children: this.widgetsList));
  }
}
