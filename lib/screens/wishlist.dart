import 'package:flutter/material.dart';
import 'package:shopping_cart/widget/wishlistempty.dart';
import 'package:shopping_cart/widget/wishlistfull.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';

  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List wishlist = [];
    return wishlist.isNotEmpty
        ? Scaffold(body: WishListEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Wishlist()'),
            ),
            body: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext ctx, int index) {
                  return WishListFull();
                }),
          );
  }
}
