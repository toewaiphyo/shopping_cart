import 'package:flutter/material.dart';
import 'package:shopping_cart/screens/cart.dart';
import 'package:shopping_cart/screens/feeds.dart';
import 'package:shopping_cart/screens/home.dart';
import 'package:shopping_cart/screens/search.dart';
import 'package:shopping_cart/screens/user.dart';
class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
   // List? _pages;
  var _selectedindex=0;
  late List _pages;
  @override
  void initState() {
    _pages=[
      HomeScreen(),
      FeedsScreen(),
      SearchScreen(),
      CartScreen(),
      UserScreen()
    ];

    // TODO: implement initState
    super.initState();
  }
  void _selectedPage(int index){
    setState(() {
      _selectedindex= index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(

          onTap: _selectedPage,
          backgroundColor:Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).textSelectionColor,
          selectedItemColor: Colors.purple,
          selectedLabelStyle: TextStyle(fontSize: 10),
          currentIndex: _selectedindex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              tooltip: 'Home',
              label: 'Home',
            ),
          BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed),
              tooltip: 'Feed',
              label: 'Feed'),
            BottomNavigationBarItem(
              activeIcon: null,
              icon: Icon(Icons.search,
              color: Colors.transparent,),
              tooltip:'Search',
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              tooltip: 'Cart',
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              tooltip: 'UserInfo',
              label: 'UserInfo',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.purple,
        tooltip: 'Search',
        elevation: 5,
        child: Icon(Icons.search),
        onPressed: () {
        setState(() {
          _selectedindex=2;
        });
        },),

    );
  }
}
