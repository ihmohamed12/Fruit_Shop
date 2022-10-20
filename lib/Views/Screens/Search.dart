import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Controller/Product_Controller.dart';
import 'package:fruitzzz_shop/Model/Product.dart';
import '../widgets/BackGround/Background_product.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'User_page.dart';
import '../widgets/Card/Item_card.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _Search();
}

int currentIndex = 0;

class _Search extends State<Search> {
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

    );
  }
  
  
}
