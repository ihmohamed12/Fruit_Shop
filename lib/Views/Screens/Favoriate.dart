import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Controller/Login_Controller.dart';
import 'package:fruitzzz_shop/Model/Controller/Product_Controller.dart';
import 'package:get/get.dart';

import '../../Model/Product.dart';
import '../widgets/Favoriate/Facorite_Card.dart';
import '../widgets/Shopping_cart/Top.dart';



class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);
  @override
  State<Favorite> createState() => _Favorite();
}

final controller = Get.find<LoginController>();
final controller2 = Get.find<ProductController>();

class _Favorite extends State<Favorite> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: NotificationListener<OverscrollIndicatorNotification> (
            onNotification: (overScroll){
              overScroll.disallowIndicator();
              return false;
            },
            child:GetBuilder<ProductController>(
              builder: (controller) => SingleChildScrollView(
              child: Container(
                  padding:const EdgeInsets.all(20),
                  child: Column(children: [
                    const TopBar(title: "Favorite"),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.favorite.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, i) => Dismissible(
                        background: Container(
                          color: Colors.transparent,
                        ),
                        key: ValueKey<Product>(controller.favorite[i]),
                        onDismissed: (DismissDirection direction) {
                          setState(() {
                            controller.favorite.removeAt(i);
                          });
                        },
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.02),
                            FavoriteCard(i: i),
                          ],
                        ),
                      ),
                    ),
                  ],),
                ),
              ),
            ),
          ),
        )
    );
  }
}