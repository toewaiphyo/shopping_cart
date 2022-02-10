import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/consts/%20theme_data.dart';
import 'package:shopping_cart/innerscreens/brands_navigation_rail.dart';
import 'package:shopping_cart/provider/dark_theme_provider.dart';
import 'package:shopping_cart/provider/product.dart';
import 'package:shopping_cart/screens/cart.dart';
import 'package:shopping_cart/screens/feeds.dart';
import 'package:shopping_cart/screens/productdetails.dart';
import 'package:shopping_cart/screens/wishlist.dart';

import 'bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getcurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    // TODO: implement initState
    getcurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          }),
          ChangeNotifierProvider(create: (_)=>
            Products(),
          )
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bottom Navigation bar',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: BottomBarScreen(),
            routes: {
              BrandNavigationRailScreen.routeName: (ctx) => BrandNavigationRailScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              FeedsScreen.routeName: (ctx) => FeedsScreen(),
              WishListScreen.routeName: (ctx) => WishListScreen(),
              ProductDetails.routeName:(ctx)=>ProductDetails(),
            },
          );
        }));
  }
}
