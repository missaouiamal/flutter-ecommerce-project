import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/* this widget represents a grid view of products . it uses the StaggeredGridView 
widget from an external package  that had been added to the project  _souheil */

class ProductGridView extends StatelessWidget {
  final List<Product> productList;

  /// final List<ProductView> productListView = [];

  ProductGridView(this.productList);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int index) =>
              ProductView(productList[index]),
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          padding: EdgeInsets.all(5),
        )));
  }
}
