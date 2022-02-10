import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/model/product.dart';
import 'package:shopping_cart/provider/product.dart';
import 'package:shopping_cart/widget/feedproduct.dart';


class FeedsScreen extends StatelessWidget {
  static const routeName = '/Feeds';


  @override
  Widget build(BuildContext context) {
    final productsprovider =Provider.of<Products>(context);
    List<Product> productlist=productsprovider.products;
    return Scaffold(

        body: GridView.count(
            padding: EdgeInsets.all(8.0),
            childAspectRatio: 240/400,
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            children:  List.generate(productlist.length, (index) {
              return FeedProduct(id: productlist[index].id,
                  description: productlist[index].description,
                  price: productlist[index].price,
                  imageUrl: productlist[index].imageUrl,
                  quantity: productlist[index].quantity,
                  isFavourite: productlist[index].isFavourite);
            })


        )
      // body: GridView.count(crossAxisCount: 2,
      // childAspectRatio: 250/290,
      // crossAxisSpacing: 8,
      // mainAxisSpacing: 8,
      // children: List.generate(10, (index) => FeedProduct()),),

    );
  }
}
