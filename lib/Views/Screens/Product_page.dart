import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Controller/Product_Controller.dart';
import 'package:fruitzzz_shop/Model/Product.dart';
import '../widgets/BackGround/Background_product.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'User_page.dart';
import '../widgets/Card/Item_card.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({Key? key}) : super(key: key);

  @override
  State<ViewProduct> createState() => _ViewProduct();
}

int currentIndex = 0;

class _ViewProduct extends State<ViewProduct> {
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(children: <Widget>[
          const BackGroundProducts(),
          NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return false;
            },
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),

              child: Container(
                margin: const EdgeInsets.only(top: 25.0),
                child: Column(
                  children: <Widget>[
                    Row(children: [
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.04,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        splashColor: Colors.white10,
                        child: Card(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                              padding: const EdgeInsets.fromLTRB(9, 7, 4, 7),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 20, //Icon Size
                                color: Colors.red,
                              )),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.white10,

                        child: Card(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(7, 7, 9, 7),
                            child: const Icon(
                              Icons.shopping_bag,
                              size: 20,
                              color: Colors.red, //Icon Size
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.04,
                      ),
                    ]),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.38,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: const Item_card(),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.03,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(currentItem.name,
                                  style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Churchward Isabella')),
                              GetBuilder<ProductController>(
                                builder: (controller) => IconButton(icon:
                                 Icon(
                                  controller.checkFav()
                                      ? Icons.favorite_border_outlined:Icons.favorite,
                                  color: Colors.red,), onPressed: () {
                                  controller.favoriteAdd();
                                  print(controller.favorite.length);
                                },),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.05,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.05,
                                child: const Image(
                                    image: AssetImage(
                                        "assets/images/fire.png")),
                              ),
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.02,
                              ),
                              Text("${currentItem.calories} calories",
                                  style:  TextStyle(
                                    color: controller.darkMode?  Colors.white.withOpacity(0.7):Colors.grey,
                                    fontSize: 18,

                                  )),
                              const Spacer(),
                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.05,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.06,
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 30,
                                ),
                              ),
                              const Text(" 4.9 ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                               Text("(2645 reiview) ",
                                  style: TextStyle(
                                    color: controller.darkMode?  Colors.white.withOpacity(0.7):Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              ReadMoreText(
                                currentItem.description,
                                trimLines: 4,
                                colorClickableText: controller.darkMode?  Colors.white.withOpacity(0.7):Colors.grey,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: ' Show more',
                                trimExpandedText: ' Show less',
                                moreStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                style:  TextStyle(
                                  color: controller.darkMode?  Colors.white.withOpacity(0.7):Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],

                          ),
                          SizedBox(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                const Text("Delivery time ",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(
                                  height:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.01,
                                ),
                                Row(children: [
                                  SizedBox(
                                    height:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.05,
                                    width:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.05,
                                    child: const Icon(
                                      Icons.punch_clock,
                                      color: Colors.red,
                                    ),
                                  ),

                                  const Text("   20 - 30 min ",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],),
                              ],),

                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  shadowColor: Colors.transparent,
                                  shape: const StadiumBorder(),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.02),
                                      SizedBox(
                                          height:
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .height *
                                              0.05,
                                          width:
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.05,
                                          child: const
                                          Icon(Icons.play_circle,
                                            color: Colors.orange, size: 30,)

                                      ),
                                      SizedBox(
                                        width:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width *
                                            0.012,
                                      ),
                                      const Text("   Watch video ",
                                          style: TextStyle(
                                            fontSize: 18,
                                          )),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.09,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ElevatedButton(
              onPressed: () {
                controller.buy();
                Get.back();
              },

              // Image tapped
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor: Colors.red,
              ), // Image tapped

              child: SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height *
                          0.08,


                    ),
                    const Text('  \$ ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(currentItem.price.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    const Spacer(),
                    Card(
                        elevation: 0,
                        color: const Color(0xffef9a9a).withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width *
                                    0.01,


                              ),
                              Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.09,
                                  height:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.065,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xffef9a9a)
                                          .withOpacity(0.8)),

                                  child:
                                  const Icon(
                                    Icons.shopping_bag,
                                    color: Colors.yellow,
                                    size: 23,
                                  )),
                            ],
                          ),
                          const Text("  Add to cart   ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                        ])),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
