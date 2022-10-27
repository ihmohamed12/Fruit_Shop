import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Model/Controller/Product_Controller.dart';
bool first = true;
final controller = Get.find<ProductController>();

class TopBar extends StatelessWidget {
  final String title;
  const TopBar({Key? key, required this.title}) : super(key: key);

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

            child:  Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              shadowColor: Colors.transparent,
              child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 13, 9, 13),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 20, //Icon Size
                    color: Colors.red,
                  )),
            ),
          ),
           Text(
            title,
            style:const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Churchward Isabella'),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.125,
            height: MediaQuery.of(context).size.height * 0.065,

            child:    Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(

                child: IconButton(
                  onPressed: () {
                    if(title=="My Cart") {
                      controller.clearBrought();
                    }
                    else{
                      controller.clearFavoriate();

                    }
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
          ),
        ]);
  }

}