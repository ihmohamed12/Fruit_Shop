import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Controller/Product_Controller.dart';
import 'package:fruitzzz_shop/Model/Product.dart';
import 'package:fruitzzz_shop/Views/widgets/Shopping_cart/Shoping_Item.dart';
import 'package:get/get.dart';

import '../widgets/BackGround/Background_cart.dart';
import '../widgets/Shopping_cart/Top.dart';

class ShoppingBag extends StatefulWidget {
  const ShoppingBag({super.key});

  @override
  State<ShoppingBag> createState() => _ShoppingBag();
}

class _ShoppingBag extends State<ShoppingBag> {
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      backgroundColor: Colors.white.withOpacity(0.95),
      extendBodyBehindAppBar: true,
      appBar: null,
      body: GetBuilder<ProductController>(
        builder: (controller) => Stack(children: [
          const BackGroundCart(),
          SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: Column(
                  children: [
                    const TopBar(),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.bought.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, i) => Dismissible(
                        background: Container(
                          color: Colors.transparent,
                        ),
                        key: ValueKey<Product>(controller.bought[i]),
                        onDismissed: (DismissDirection direction) {
                          setState(() {
                            controller.bought.removeAt(i);
                          });
                        },
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            ShoppingItem(i: i),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ],
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.27,
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.fromLTRB(20, 33, 20, 33),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Item Select",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                        Text(controller.bought.length.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.6))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Text('  \$',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.orange,
                                    fontFamily: 'Churchward Isabella')),
                            Text(controller.boughtTotal().toStringAsFixed(2),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontFamily: 'Churchward Isabella')),
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.073,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withAlpha(70),
                              blurRadius: 8.0,
                              spreadRadius: 1.0,
                              offset: const Offset(
                                0.0,
                                15.0,
                              ),
                            ),
                          ]),
                      child: ElevatedButton(
                          onPressed: () {},

                          // Image tapped
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            backgroundColor: Colors.red,
                          ), // Image tapped

                          child: const Text(
                            "Order Now",
                            style: TextStyle(fontSize: 26),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
