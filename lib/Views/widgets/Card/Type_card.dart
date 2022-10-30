import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Controller/Product_Controller.dart';
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

        ElevatedButton(
          style: ElevatedButton.styleFrom(

            elevation: 0,
            shape:  RoundedRectangleBorder(
              borderRadius:  BorderRadius.circular(15.0),
            ),),
            onPressed: () {
          //  if(Get.currentRoute=="/ViewProduct") {
              controller.getType(i);
           // }

            },
            // Text Color (Foreground color)

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              SizedBox(
                // <-- SEE HERE
                width: MediaQuery.of(context).size.width *
                    0.08,
                height: MediaQuery.of(context).size.height *
                    0.08,
                child: Image(
                    image: AssetImage(items[i].imagePath)),
              ),
              Text(" ${items[i].type}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Churchward Isabella')),
            ])),
      );

    //  return


  }

}
