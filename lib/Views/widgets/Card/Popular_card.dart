import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Product.dart';
import 'package:fruitzzz_shop/Views/Screens/User_page.dart';
import 'package:get/get.dart';
import '../../../Model/Controller/Product_Controller.dart';
bool first = true;

class Popular extends StatelessWidget {
  const Popular ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =Get.find<ProductController>();

    return
      SizedBox(child:

      Card(
        shadowColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),

        child:


        // Image tapped
        ElevatedButton(
          onPressed: () {
            currentItem = controller.bestRated as Product;
            setCurrent(controller.bestRated);
            controller.current = (controller.bestRated);
            Get.toNamed("/Product_card");          },
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent, //specify the button's elevation color

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),


            ),
            primary: Colors.white,
            // Background color
            onPrimary: Colors
                .red, // Text Color (Foreground color)
          ),        // Splash color over image
          child: Row(children: <Widget>[
            SizedBox(

              // <-- SEE HERE
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.15,
              child:  Image(
                  image:  AssetImage(
                      controller.bestRated.imagePath)),
            ),


            Column(children: [
              Row(
                children: [
                  SizedBox(
                    child: Text('     ${controller.bestRated.name}',
                        style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,fontFamily: 'Churchward Isabella'
                        )
                    ),
                  ),
                ],
              ),
              Row(children: [
                SizedBox(
                  width:   MediaQuery.of(context).size.width*0.02,
                ),
                SizedBox(
                  // <-- SEE HERE
                  width:   MediaQuery.of(context).size.width*0.04,
                  height:  MediaQuery.of(context).size.height*0.05,
                  child:  const Image(
                      image:
                       AssetImage('assets/images/fire.png')),
                ),
                Text("   ${controller.bestRated.calories} calories",
                    style:const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.grey,fontFamily: 'Churchward Isabella')),
              ]),
              SizedBox(
                width: MediaQuery.of(context).size.height*0.18,
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
            ]),
          ]),
        )
        ,

      ),);

    //  return


  }

}
