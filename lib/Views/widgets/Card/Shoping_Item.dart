import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Model/Controller/Product_Controller.dart';
import '../../Screens/User_page.dart';

bool first = true;

class ShoppingItem extends StatelessWidget {
  final int i;

  const ShoppingItem({Key? key, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    return SizedBox(
        child: InkWell(
        onTap: (){
      currentItem = controller.bought[i];
      setCurrent(controller.bought[i]);
      controller.current = (controller.bought[i]);
      Get.toNamed("/Product_card");
    },
          child: Card(
      shadowColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
          padding: const EdgeInsets.fromLTRB(15, 11, 35, 11),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  // <-- SEE HERE
                  width: MediaQuery.of(context).size.width * 0.27,
                  height: MediaQuery.of(context).size.height * 0.12,

                      child: Image(image: AssetImage(controller.bought[i].imagePath))

                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                  Row(
                    children: [
                      SizedBox(
                        child: Text(' ${controller.bought[i].name}',
                            style:  TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black.withOpacity(0.7),
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
                        child: Text('  ${controller.bought[i].weight} KG  ',
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
                      Text(' ${controller.bought[i].price}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18 ,
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
                              if (controller.bought[i].weightBought != 1) {
                                controller. weightSUB2(i);
                              }
                            },
                            icon:const Icon(Icons.remove),
                            color: Colors.white,
                            iconSize: 11,
                          ),
                        ),
                      ),

                      Text( ' ${controller.bought[i].weightBought}  kg ',
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
                                controller.weightADD2(i);
                              },
                              icon:const Icon(Icons.add),
                              color: Colors.white,
                              iconSize: 10,
                            ),
                          )),
                    ],
                  ),


                ]),

                SizedBox(
                  width: 15,
                  child: IconButton(onPressed: (){
                    controller.removeBrought(i);

                  }, icon:const Icon(Icons.delete_outline,color: Colors.red,)),
                )
              ]),
      ),
    ),
        ));

    //  return
  }
}
