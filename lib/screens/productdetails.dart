import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/provider/dark_theme_provider.dart';
import 'package:shopping_cart/screens/cart.dart';
import 'package:shopping_cart/screens/wishlist.dart';
import 'package:shopping_cart/widget/feedproduct.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);
  static const routeName = '/ProductDetails';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  GlobalKey previewContainer = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(color: Colors.black12),
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(
              'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg',
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 250,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.save,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.share,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          'title',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'US \$ 15',
                        style: TextStyle(
                            color: themeChange.darkTheme
                                ? Theme.of(context).disabledColor
                                : Color(0xFF393236),
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                      color: themeChange.darkTheme
                          ? Theme.of(context).disabledColor
                          : Color(0xFF393236),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
                _details(themeChange.darkTheme, 'Brand', 'BrandName', context),
                _details(themeChange.darkTheme, 'Quantity', '12 Left', context),
                _details(themeChange.darkTheme, 'Category', 'CatName', context),
                _details(
                    themeChange.darkTheme, 'Popularity', 'Popular', context),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                  height: 1,
                ),
                Container(
                  color: Theme.of(context).backgroundColor,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'No review yet',
                          style: TextStyle(
                            color: Theme.of(context).textSelectionColor,
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            'Be the first review',
                            style: TextStyle(
                              color: themeChange.darkTheme
                                  ? Theme.of(context).disabledColor
                                  : Color(0xFF393236),
                            ),
                          )),
                      SizedBox(
                        height: 70,
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                        height: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Text(
                    'Suggested products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 300,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (BuildContext ctx, int index) {
                        return CartScreen();
                      }),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Detail",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(WishListScreen.routeName);
                  },
                  icon: Icon(
                    Entypo.heart_empty,
                    color: Color(0xFFF44336),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Color(0xFF5E35B1),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 50,
                    child: MaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(side: BorderSide.none),
                      color: Colors.redAccent.shade400,
                      onPressed: () {},
                      child: Text(
                        'Add To Cart'.toUpperCase(),
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    child: MaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(side: BorderSide.none),
                      color: Theme.of(context).backgroundColor,
                      onPressed: () {},
                      child: Row(children: [
                        Text(
                          'Buy Now'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).textSelectionColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.payment,
                          color: Colors.grey.shade700,
                          size: 19,
                        )
                      ]),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: themeChange.darkTheme
                          ? Theme.of(context).disabledColor
                          : Color(0xFF393236),
                      height: 50,
                      child: InkWell(
                        splashColor: Color(0xFFF44336),
                        onTap: (){},
                        child: Center(
                          child: Icon(
                            Entypo.heart_empty,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _details(
    bool themeChange, String title, String info, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                color: Theme.of(context).textSelectionColor,
                fontWeight: FontWeight.w600,
                fontSize: 21)),
        Text(
          info,
          style: TextStyle(
            color: themeChange
                ? Theme.of(context).disabledColor
                : Color(0xFF393236),
          ),
        )
      ],
    ),
  );
}
