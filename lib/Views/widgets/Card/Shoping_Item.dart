import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Views/Screens/User_page.dart';
import 'package:get/get.dart';
import '../../../Model/Controller/Product_Controller.dart';

bool first = true;

class ShoppingItem extends StatelessWidget {
  final int i;

  const ShoppingItem({Key? key, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    return SizedBox(
        child: Card(
      shadowColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 15, 40, 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                // <-- SEE HERE
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Image(image: AssetImage(controller.bought[i].imagePath)),
              ),
              Column(children: [
                Row(
                  children: [
                    SizedBox(
                      child: Text('     ${controller.bought[i].name}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Churchward Isabella')),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  children: [
                    const Text('Kg: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: 'Churchward Isabella')),
                    /*const Text('  \$',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.orange,
                        fontFamily: 'Churchward Isabella')),*/
                    Text(' ${controller.bought[i].weightBought}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: 'Churchward Isabella')),
                  ],
                ),
              ]),
              InkWell(
                onTap: () {
                  if(controller.bought[i].weightBought==1) {
                    controller.removeBrought(i);
                  }
                  else{
                    controller.subBrought(i);
                  }

                },
                child: controller.bought[i].weightBought == 1
                    ? const Text(
                        'x',
                        style:
                            TextStyle(color: Colors.grey, fontSize: 30),
                      )
                    : const Text(
                        '-',
                        style: TextStyle(color: Colors.grey, fontSize: 30),
                      ),
              ),
            ]),
      ),
    ));

    //  return
  }
}
