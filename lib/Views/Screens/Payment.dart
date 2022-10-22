import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/Controller/Product_Controller.dart';
import '../widgets/BackGround/Background_payment.dart';
import '../widgets/Shopping_cart/Payment_Method.dart';
import '../widgets/Shopping_cart/Top.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _Payment();
}

class _Payment extends State<Payment> {
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.white.withOpacity(0.98),
            extendBodyBehindAppBar: true,
            appBar: null,
            body: Stack(
              children: [
                BackGroundPayment(),
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const TopBar(
                          title: 'My Cart',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        GetBuilder<ProductController>(
                            builder: (controller) => ListView.separated(
                                itemCount: 4,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03);
                                },
                                shrinkWrap: true,
                                itemBuilder: (context, i) => PaymentMethod(
                                      i: i,
                                    ))),
                      ],
                    ),
                  ),
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
                      height: MediaQuery.of(context).size.height * 0.35,
                      margin: EdgeInsets.zero,
                      padding: const EdgeInsets.fromLTRB(20, 39, 20, 33),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Row(
                                children: [
                                  Text('  \$',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.black.withOpacity(0.5),
                                          fontFamily: 'Churchward Isabella')),
                                  Text(
                                      (controller.boughtTotal() - 20)
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Colors.black.withOpacity(0.6))),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Row(
                                children: [
                                  Text('  \$',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.black.withOpacity(0.5),
                                          fontFamily: 'Churchward Isabella')),
                                  Text("20",
                                      style: TextStyle(
                                          fontSize: 18,

                                          color:
                                              Colors.black.withOpacity(0.6))),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  const Text('  \$',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.orange,
                                          fontFamily: 'Churchward Isabella')),
                                  Text(
                                      controller
                                          .boughtTotal()
                                          .toStringAsFixed(2),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontFamily: 'Churchward Isabella')),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
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
                                onPressed: () {
                                  Get.toNamed("payment");
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

                                child: const Text(
                                  "Pay Now",
                                  style: TextStyle(fontSize: 26),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
