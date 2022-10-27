import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Controller/Product_Controller.dart';
import 'package:fruitzzz_shop/Views/widgets/Card/Type_card.dart';
import 'package:get/get.dart';
import '../widgets/BackGround/Background_search.dart';
import '../widgets/Card/Popular_card.dart';
import '../widgets/Shopping_cart/Top.dart';

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
    TextEditingController searchField = TextEditingController();

    return SafeArea(
      child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: null,
          body: Stack(
            children: [
            const  BackGroundSearch(),
              NotificationListener<OverscrollIndicatorNotification> (
                onNotification: (overScroll){
                  overScroll.disallowIndicator();
                  return false;
                },
                child: SingleChildScrollView(
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
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          TextFormField(
                            controller: searchField,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.black,
                              focusedBorder:OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(20),
                              ),

                              hintText:"Search",

                            ),
                            keyboardType: TextInputType.text,
                            onChanged: (text) {
                              controller.searchItem(text);
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
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
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, i) => Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context)
                                              .size
                                              .height *
                                          0.01,
                                    ),
                                    Popular(
                                      popular: controller.gridItems[i],
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
