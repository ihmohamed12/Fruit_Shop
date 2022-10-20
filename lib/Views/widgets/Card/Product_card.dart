import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Views/Screens/User_page.dart';
import 'package:fruitzzz_shop/Model/Product.dart';
import 'package:get/get.dart';

import '../../../Model/Controller/Product_Controller.dart';

Product currentProduct = Product(
    weight: 0,
    imagePath: "",
    description: "",
    calories: 0,
    price: 0,
    type: "",
    name: "",
    rating: 0,
    weightBought: 0);
final controller = Get.find<ProductController>();

class ProductCard extends StatelessWidget {
  final int i;

  const ProductCard({required Key? key, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    Visibility(
        visible: (i.isEven),
        child:  SizedBox(
          height: MediaQuery.of(context).size.height * 0.0235,
        )),
    SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Obx(
        () => Card(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          shadowColor: Colors.transparent,
          child: ElevatedButton(
              onPressed: () {
                goToPopular();
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                //specify the button's elevation color

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                primary: Colors.white,
                // Background color
                onPrimary: Colors.red, // Text Color (Foreground color)
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                SizedBox(
                  // <-- SEE HERE
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: Image(
                      image: AssetImage(controller.gridItems[i].imagePath)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.006),

                Text(controller.gridItems[i].name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:19,
                        color: Colors.black,
                        fontFamily: 'Churchward Isabella')),
                SizedBox(height: MediaQuery.of(context).size.height * 0.006),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: i.isEven
                          ? const Color(0xffffe0b2)
                          : const Color(0xffffcdd2),
                      child: Text(' ${controller.gridItems[i].weight} kg ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: i.isEven ? Colors.orange : Colors.red,
                              fontFamily: 'Churchward Isabella')),
                    ),
                    const Text('  \$',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.orange)),
                    Text(' ${controller.gridItems[i].price}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Churchward Isabella')),
                  ],
                ),
              ])),
        ),
      ),
    ),
      ],
    );

    //  return
  }

  goToPopular() {
    currentItem = Get.find<ProductController>().gridItems[i];
    setCurrent(controller.gridItems[i]);
    controller.current = (controller.gridItems[i]);
    Get.toNamed("/Product_card");
  }
}
