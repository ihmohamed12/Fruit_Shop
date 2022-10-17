import 'package:flutter/material.dart';
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
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    Card(
                      shadowColor: Colors.transparent,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color:const  Color(0xffffe0b2),
                      child: Text('  ${controller.bestRated.weight} KG  ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.orange,fontFamily: 'Churchward Isabella')),
                    ),
                    const Text('  \$',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.orange,fontFamily: 'Churchward Isabella')),
                    Text(' ${controller.bestRated.price}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.black,fontFamily: 'Churchward Isabella')),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.09,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Card(
                        color: Colors.orange,
                        child: IconButton(
                          onPressed: () {
                            if (controller.current.weightBought != 1) {
                              controller. weightSUB();
                            }
                          },
                          icon:const Icon(Icons.remove),
                          color: Colors.white,
                          iconSize: 11,
                        ),
                      ),
                    ),

                    Text( '${controller.current.weightBought}  kg',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Churchward Isabella')),

                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.09,
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: Card(
                          color: Colors.orange,
                          child: IconButton(
                            onPressed: () {
                              controller.weightADD();
                            },
                            icon:const Icon(Icons.add),
                            color: Colors.white,
                            iconSize: 11,
                          ),
                        )),
                  ],
                ),


              ]),
              InkWell(
                onTap: () {
                    controller.removeBrought(i);


                },
                child: controller.bought[i].weightBought == 1
                    ? const Text(
                        'x',
                        style:
                            TextStyle(color: Colors.red, fontSize: 30),
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
