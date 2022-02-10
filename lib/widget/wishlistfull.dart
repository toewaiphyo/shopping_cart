import 'package:flutter/material.dart';
class WishListFull extends StatefulWidget {
  const WishListFull({Key? key}) : super(key: key);

  @override
  State<WishListFull> createState() => _WishListFullState();
}

class _WishListFullState extends State<WishListFull> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin:EdgeInsets.only(right: 30,bottom: 10),
          child: Material(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(5),
            elevation: 3,
            child: InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      child:Image.network( 'https://abong.com.bd/public//admin/media/2020/03/yellow_mesh_men_sport_sneaker_shoesjpeg_20200307141459.jpeg'),
                    ),
                    SizedBox(width: 10,),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('title',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),),
                        SizedBox(height: 20,),
                        Text('\$ 16',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                        ),
                      ],
                    )
                    )
                    
                  ],
                ),
              ),
            ),
          ),
        ),
        positionRemove(),
      ],
    );
  }
}
Widget positionRemove(){
  return Positioned(
      top: 20,
      right: 15,
      child: Container(
        height: 30,
        width: 30,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: Colors.pink,
          child: Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: (){},
        ),
      )
  );
}
