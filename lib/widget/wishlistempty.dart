import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/provider/dark_theme_provider.dart';

class WishListEmpty extends StatelessWidget {
  const WishListEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/empty-wishlist.png'),
                  fit: BoxFit.fill)),
        ),
        Text(
          'Your wishlist is empty',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).textSelectionColor,
              fontSize: 36,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 30,
        ),
        Text('Explore more and shortlist some items',
            style: TextStyle(
                color: themChange.darkTheme
                    ? Theme.of(context).disabledColor
                    : Colors.grey,
                fontSize: 36,
                fontWeight: FontWeight.w600)
        ),
        SizedBox(height: 30,),
        Container(
          width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height*0.06,
          child: MaterialButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.red)
            ),
            color: Colors.redAccent,
            child: Text(
              'Add a wish'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color:Theme.of(context).textSelectionColor,
                fontWeight: FontWeight.w600,
                fontSize: 26
              ),
            ),
          ),
        )
      ],
    );
  }
}
