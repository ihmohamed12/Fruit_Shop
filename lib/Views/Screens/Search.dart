import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Controller/Product_Controller.dart';
import 'package:fruitzzz_shop/Model/Product.dart';
import 'package:fruitzzz_shop/Views/widgets/Card/Type_card.dart';
import '../widgets/BackGround/Background_product.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../widgets/Card/Popular_card.dart';
import '../widgets/Shopping_cart/Top.dart';
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
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.white.withOpacity(0.97),
          extendBodyBehindAppBar: true,
          appBar: null,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
              child: GetBuilder<ProductController>(
                builder: (controller) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopBar(title: ""),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                        "Found ${controller.gridItems.length.toString()} Results",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: 'Churchward Isabella')),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context)
                          .size
                          .width, //you sure it should be 0.001?
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ListView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) => TypeCard(i: i)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context)
                          .size
                          .width, //you sure it should be 0.001?
                      child: ListView.builder(
                          itemCount: controller.gridItems.length,
                          physics:const NeverScrollableScrollPhysics(),

                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, i) => Container(
                            child: Popular(
                                  popular: controller.gridItems[i],
                                ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
