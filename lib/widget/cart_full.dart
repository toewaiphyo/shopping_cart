import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/provider/dark_theme_provider.dart';

class CartFullScreen extends StatelessWidget {
  const CartFullScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      height: 135,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: const Radius.circular(16),
          topRight: const Radius.circular(16),
        ),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU'),
                  fit: BoxFit.cover),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'title',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(32),
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Entypo.cancel,
                            color: Colors.red,
                            size: 22,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('Price'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "450",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('Sub Total'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "450",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: themeChange.darkTheme
                                ? Colors.brown.shade900
                                : Theme.of(context).accentColor),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Ships fee',
                        style: TextStyle(
                            color: themeChange.darkTheme
                                ? Colors.brown.shade900
                                : Theme.of(context).accentColor),
                      ),
                      Spacer(),
                      InkWell(
                        borderRadius: BorderRadius.circular(4.0),
                        onTap: () {},
                        child: Container(
                          child: Icon(
                            Entypo.minus,
                            color: Colors.red,
                            size: 22,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 12,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.12,
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.red, Colors.blue],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: Text(
                            '0',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(4.0),
                        onTap: () {},
                        child: Container(
                          child: Icon(
                            Entypo.plus,
                            color: Colors.red,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
