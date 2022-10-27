import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Product.dart';
import 'package:fruitzzz_shop/Views/Screens/User_page.dart';
import 'package:get/get.dart';
import '../../../Model/Controller/Product_Controller.dart';
bool first = true;

class Popular extends StatelessWidget {
  final Product popular;
  const Popular ({Key? key, required this.popular}) : super(key: key);

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
            currentItem = popular;
            setCurrent(popular);
            controller.current = (popular);
            Get.toNamed("/Product_card");          },
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent, //specify the button's elevation color

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),


            ),
            // Background color
          ),        // Splash color over image
          child: Row(children: <Widget>[
            SizedBox(

              // <-- SEE HERE
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.14,
              child:  Image(
                  image:  AssetImage(
                      popular.imagePath)),
            ),


            Column(children: [
              Row(
                children: [
                  SizedBox(
                    child: Text('     ${popular.name}',
                        style:const TextStyle(
                            fontSize: 22,fontFamily: 'Churchward Isabella'
                        )
                    ),
                  ),
                ],
              ),
              Row(children: [

                SizedBox(
                  // <-- SEE HERE
                  width:   MediaQuery.of(context).size.width*0.04,
                  height:  MediaQuery.of(context).size.height*0.05,
                  child:  const Image(
                      image:
                       AssetImage('assets/images/fire.png')
                  ),
                ),
                Text("   ${popular.calories} calories",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                       color:  controller.darkMode?  Colors.white.withOpacity(0.7):Colors.grey,fontFamily: 'Churchward Isabella')),
              ]),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.18,
              ),
              Row(
                children: [
                  Card(
                    shadowColor: Colors.transparent,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color:const  Color(0xffffe0b2),
                    child: Text('  ${popular.weight} KG  ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.orange,fontFamily: 'Churchward Isabella')),
                  ),
                  const Text('  \$',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.orange,fontFamily: 'Churchward Isabella')),
                  Text(' ${popular.price}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Churchward Isabella')),
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
