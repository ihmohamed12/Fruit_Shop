import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Controller/Product_Controller.dart';
import 'package:fruitzzz_shop/Views/Screens/User_page.dart';
import 'package:get/get.dart';



class TypeCard extends StatelessWidget {


  final int i;
  const TypeCard({Key? key,  required this.i}) : super(key: key);






  // popular();

  @override
  Widget build(BuildContext context) {
    final controller =Get.find<ProductController>();

    return Card(
        shadowColor: Colors.transparent,
        //specify the button's elevation color

        shape:  RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(15.0),
        ),
        child:
Obx(()=>
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: controller.flag[i] ? Colors.white : Colors.red,

            elevation: 0,
            shape:  RoundedRectangleBorder(
              borderRadius:  BorderRadius.circular(15.0),
            ),),
            onPressed: () {
              controller.getType(i);
            },
            // Text Color (Foreground color)

            child: Row(children: <Widget>[
              SizedBox(
                // <-- SEE HERE
                width: MediaQuery.of(context).size.width *
                    0.08,
                height: MediaQuery.of(context).size.height *
                    0.08,
                child: Image(
                    image: AssetImage(items[i].imagePath)),
              ),
              Text(items[i].type,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Churchward Isabella')),
            ])),
      ));

    //  return


  }

}
