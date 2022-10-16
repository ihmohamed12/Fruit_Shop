import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Controller/Login_Controller.dart';
import 'package:fruitzzz_shop/Model/Controller/Product_Controller.dart';
import 'package:fruitzzz_shop/Views/widgets/Card/Shoping_Item.dart';
import 'package:get/get.dart';

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
            body: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Column(
                      children: [
                    GetBuilder<ProductController>(
                    builder: (controller) => ListView.builder(
                          itemCount: controller.bought.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, i) => ShoppingItem(i: i),
                        ),
                    ),


                      ],
                    )
                )
            ),bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0.0),
      child: ElevatedButton(
          onPressed: () {
          },

          // Image tapped
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            primary: Colors.red,
          ), // Image tapped

          child:const Text("Order",style: TextStyle(fontSize: 25
          ),)

      ),
    ),
        )
    );
  }
}
