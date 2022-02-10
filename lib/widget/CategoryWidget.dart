import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key, required this.index}) : super(key: key);
  final int index;
  List category = [
    "assets/images/CatPhones.png",
    "assets/images/CatClothes.jpg",
    "assets/images/CatShoes.jpg",
    "assets/images/CatBeauty.jpg",
    "assets/images/CatLaptops.png",
    "assets/images/CatFurniture.jpg",
    "assets/images/CatWatches.jpg",
  ];
  List<String> cattitles = [
    "Phones",
    "Clothes",
    "Shoes",
    "Beauty&Health",
    "Laptops",
    "Furniture",
    "Watches",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(category[index]),
            fit: BoxFit.cover
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 150,
        height: 150,
      ),
      Positioned(
        bottom: 0,
          left: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            color: Theme.of(context).backgroundColor,
        child: Text(cattitles[index],
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Theme.of(context).textSelectionColor
        ),),
      ))
    ]);
  }
}
