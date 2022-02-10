import 'package:backdrop/backdrop.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:shopping_cart/innerscreens/brands_navigation_rail.dart';
import 'package:shopping_cart/widget/CategoryWidget.dart';
import 'package:shopping_cart/widget/backlayer.dart';
import 'package:shopping_cart/widget/popular_product.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<String> imglist = [
  "assets/images/carousel1.png",
  "assets/images/carousel2.png",
  "assets/images/carousel3.png",
  "assets/images/carousel4.png"
];

List _brandImages = [
  'assets/images/addidas.jpg',
  'assets/images/apple.jpg',
  'assets/images/Dell.jpg',
  'assets/images/h&m.jpg',
  'assets/images/Huawei.jpg',
  'assets/images/nike.jpg',
  'assets/images/samsung.jpg',
];

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: BackdropScaffold(
        frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        headerHeight: MediaQuery.of(context).size.height * 0.25,
        appBar: BackdropAppBar(
          title: Text("Home"),
          leading: BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.red, Colors.blue],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
            )),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                padding: const EdgeInsets.all(10),
                icon: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
                  ),
                ))
          ],
        ),
        frontLayerBorderRadius: BorderRadius.only(
            topRight: Radius.circular(0.0), topLeft: Radius.circular(0.0)),
        backLayer:BackLayerMenu(),
        frontLayer: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 190,
              width: double.infinity,
              child: CarouselSlider(
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.3,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: imageSliders,
                carouselController: _carouselController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imglist.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _carouselController.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
            ),
            Container(
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (BuildContext ctx, int index) {
                    return CategoryWidget(index: index);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Popular Brands',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        BrandNavigationRailScreen.routeName,
                        arguments: {
                          7,
                        },
                      );
                    },
                    child: Text(
                      'View all...',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Swiper(
                itemCount: _brandImages.length,
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
                onTap: (index) {
                  Navigator.of(context).pushNamed(
                    BrandNavigationRailScreen.routeName,
                    arguments: {
                      index,
                    },
                  );
                },
                itemBuilder: (BuildContext ctx, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.blueGrey,
                      child: Image.asset(
                        _brandImages[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Popular Products",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View all...",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 285,
              margin: EdgeInsets.symmetric(horizontal: 3),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return PopularProducts();
                  }),
            )
          ]),
        ),
      ),
    ));
  }

  final List<Widget> imageSliders = imglist
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();
}
