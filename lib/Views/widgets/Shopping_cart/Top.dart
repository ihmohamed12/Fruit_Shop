import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Model/Controller/Product_Controller.dart';
bool first = true;
final controller = Get.find<ProductController>();

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.back();
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.12,
            height: MediaQuery.of(context).size.height * 0.06,

            child:    Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: IconButton(
                onPressed: () {
                  controller.clearBrought();
                }, // Image tapped
                splashColor: Colors.white10,
                icon: const Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.red, //Icon Size
                ),
              ),
            ),
          ),
        ]);
  }

}