import 'package:flutter/material.dart';
import '../../../Controller/Product_Controller.dart';
import '../../Screens/User_page.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class Item_card extends StatelessWidget {
  const Item_card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =Get.find<ProductController>();

    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(130),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            child: Image(image: AssetImage(currentItem.imagePath)),
          ),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Card(
                  color: Colors.orange,
                  child: IconButton(
                    onPressed: () {
                      if (currentItem.weight + controller.weight.value != 1) {
                        controller.weightSUB();
                      }
                    },
                    icon:const Icon(Icons.remove),
                    color: Colors.white,
                    iconSize: 15,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
    Obx(() =>     Text('${controller.weight.value}  kg',
                  style:const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Churchward Isabella'))),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Card(
                    color: Colors.orange,
                    child: IconButton(
                      onPressed: () {
                        controller.weightADD();
                      },
                      icon:const Icon(Icons.add),
                      color: Colors.white,
                      iconSize: 15,
                    ),
                  )),
              const     Spacer()
            ],
          )
        ],
      ),
    );
  }
}
