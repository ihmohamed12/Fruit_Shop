import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Controller/Product_Controller.dart';
import 'package:fruitzzz_shop/Views/widgets/BackGround/Background_product.dart';
import 'package:fruitzzz_shop/Views/widgets/BackGround/Background_user.dart';
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
      body: Stack(
        children: [
        const  BackGroundUser(),
          SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: GetBuilder<ProductController>(
              builder: (controller) => Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.offNamed('/ViewProduct');
                              },
                              // Image tapped
                              splashColor: Colors.white10,
                              // Splash color over image
                              // Splash color over image

                              child: Container(
                                  padding: const EdgeInsets.fromLTRB(9, 7, 4, 7),
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 20, //Icon Size
                                    color: Colors.red,
                                  )),
                            ),
                            const Text(
                              "My Cart",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Churchward Isabella'),
                            ),
                            InkWell(
                              onTap: () {}, // Image tapped
                              splashColor: Colors.white10,

                              child: Card(
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(7, 7, 9, 7),
                                  child: InkWell(
                                    onTap: () {
                                      controller.clearBrought();
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      size: 20,
                                      color: Colors.red, //Icon Size
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      ListView.builder(
                        itemCount: controller.bought.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, i) => ShoppingItem(i: i),
                      ),


                    ],
                  )),
        )),
    ]  ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          child:

          Container(
            height:MediaQuery.of(context).size.height*0.23
            ,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Item Select",style: TextStyle(fontSize: 20,color: Colors.grey),),
                    Text(controller.bought.length.toString(),style: TextStyle(fontSize: 20,color: Colors.grey)),
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total",style: TextStyle(fontSize: 25),),

                  Row(children: [ const Text('  \$',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.orange,fontFamily: 'Churchward Isabella')),
                    Text("20",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,fontFamily: 'Churchward Isabella')),],)
                  ],),

                SizedBox(
                  width:MediaQuery.of(context).size.width*0.8,
                  height:MediaQuery.of(context).size.height*0.07,

                  child: ElevatedButton(
                      onPressed: () {},

                      // Image tapped
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        primary: Colors.red,
                      ), // Image tapped

                      child: const Text(
                        "Order Now",
                        style: TextStyle(fontSize: 25),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
