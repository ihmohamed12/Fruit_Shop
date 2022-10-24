import 'package:flutter/material.dart';
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


class _ViewProduct extends State<ViewProduct> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: Stack(

            children: <Widget>[
             const BackGround_Products(),
              SingleChildScrollView(
                child: Container(

                  margin: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: <Widget>[
                      Row(children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        InkWell(
                          onTap: () {
                            Get.offNamed('/ViewProduct');
                          },
                          // Image tapped
                          splashColor: Colors.white10,
                          // Splash color over image
                          // Splash color over image
                          child: Card(



                            child: Container(
                                padding:const EdgeInsets.fromLTRB(9, 7, 4, 7),
                                child:const Icon(
                                  Icons.arrow_back_ios,
                                  size: 20, //Icon Size
                                  color: Colors.red,
                                )),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                          }, // Image tapped
                          splashColor: Colors.white10,

                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(7, 7, 9, 7),
                              child:const Icon(
                                Icons.shopping_bag,
                                size: 20,
                                color: Colors.red, //Icon Size
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ]),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.328,
                        width: MediaQuery.of(context).size.width,
                        child:
                        const Item_card(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                        padding:const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(currentItem.name,
                                    style:const TextStyle(
                                        color: Colors.black,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Churchward Isabella')),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.0,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.05,
                                  width: MediaQuery.of(context).size.width * 0.05,
                                  child: const Image(
                                      image: AssetImage("assets/images/fire.png")),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text("${currentItem.calories} calories",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                                const           Spacer(),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.05,
                                  width: MediaQuery.of(context).size.width * 0.05,
                                  child: const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                ),
                                const    Text(" 4.9 ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                                const  Text("(2645 reiview) ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            const      SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                ReadMoreText(
                                  currentItem.description,
                                  trimLines: 4,
                                  colorClickableText: Colors.grey,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: ' Show more',
                                  trimExpandedText: ' Show less',
                                  moreStyle: const TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height * 0.05),
                            Column(
                              children: [
                                Row(
                                  children: const [
                                    Text("Delivery time ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height:
                                      MediaQuery.of(context).size.height * 0.05,
                                      width: MediaQuery.of(context).size.width * 0.05,
                                      child: const Icon(
                                        Icons.punch_clock,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const     Text("   20 - 30 min ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.1,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      // Image tapped
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0.0,
                                        shadowColor: Colors.transparent,
                                        shape:const StadiumBorder(),
                                        primary: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              width:
                                              MediaQuery.of(context).size.width *
                                                  0.02),
                                          SizedBox(
                                            height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                            width: MediaQuery.of(context).size.width *
                                                0.05,
                                            child:const Image(
                                                image: AssetImage(
                                                    'assets/images/movie.png')),
                                          ),
                                          const    Text(" Watch video ",

                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.09,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(0.0),
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

              child: SizedBox(
                child: Row(
                  children: [
                    const   Text('  \$ ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(currentItem.price.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    const     Spacer(),
                    Card(
                        elevation: 0,
                        color:const Color(0xffef9a9a).withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Row(children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.07,
                                height: MediaQuery.of(context).size.height * 0.06,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:const Color(0xffef9a9a).withOpacity(0.8)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.012,
                                    ),
                                    const     Icon(
                                      Icons.shopping_bag,
                                      color: Colors.yellow,
                                      size: 18   ,
                                    ),
                                  ],
                                )),
                            const   Text("  Add to cart   ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                )),

                          ]),
                        )),
                  ],
                ),
              )),
        ),

      ),);
  }
}

