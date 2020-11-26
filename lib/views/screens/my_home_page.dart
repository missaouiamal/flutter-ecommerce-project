import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/category.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/screens/bag_screen.dart';
import 'package:flutter_ecommerce_project/views/screens/home_screen.dart';
import 'package:flutter_ecommerce_project/views/widgets/Category_Item.dart';
import 'package:flutter_ecommerce_project/views/widgets/Category_List.dart';
import 'package:flutter_ecommerce_project/views/widgets/Home.dart';
import 'package:flutter_ecommerce_project/views/widgets/Product_View.dart';
import 'package:flutter_ecommerce_project/views/widgets/admin_panel.dart';
import 'package:flutter_ecommerce_project/views/widgets/filters.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_list.dart';
import 'package:flutter_ecommerce_project/views/widgets/titled_category_list.dart';
import 'package:flutter_ecommerce_project/views/widgets/titled_product_list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController;
  int currentIndex = 0;
  void onSelect(int index) {
    setState(() {
      this.currentIndex = index;
      pageController.animateToPage(currentIndex,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController();
  }

  List<Widget> _screens = [
    HomeScreen(),
    Center(
      child: AdminPanel(),
    ),
    Center(
      child: BagScreen(),
    ),
    Center(child: Home())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: _screens,
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock), label: "admin Dashbord"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Bag"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "login/sign in"),
          ],
          currentIndex: currentIndex,
          onTap: onSelect,
        ));
  }
}
