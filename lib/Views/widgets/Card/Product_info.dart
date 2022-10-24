import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:fruitzzz_shop/Views/Screens/User_page.dart';


class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return Row(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.05,
          child:const Image(
              image: AssetImage("assets/images/fire.png")),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Text("${currentItem.calories} calories",
            style:const TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        const Spacer(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.05,
          child:const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        ),
        const Text(" 4.9 ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        const Text("(2645 reiview) ",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),

        const SizedBox(
    height: 10,
    ),
    Row(

    children: [
    ReadMoreText(
    currentItem.description,
    trimLines: 4,
    colorClickableText: Colors.grey,
    trimMode: TrimMode.Line,
    trimCollapsedText: ' Show more',
    trimExpandedText: ' Show less',
    moreStyle:const TextStyle(
    fontSize: 14, fontWeight: FontWeight.bold),
    style:const TextStyle(
    color: Colors.grey,
    fontSize: 15,
    fontWeight: FontWeight.bold),
    ),
    ],
    )],
   );



  }

// popular();
}