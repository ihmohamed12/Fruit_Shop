import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Controller/Product_Controller.dart';
import 'package:fruitzzz_shop/Views/Screens/User_page.dart';
import 'package:get/get.dart';



class PaymentMethod extends StatelessWidget {


  final int i;
  const PaymentMethod({Key? key,  required this.i}) : super(key: key);






  // popular();

  @override
  Widget build(BuildContext context) {
    final controller =Get.find<ProductController>();
    return

      Container(
        decoration:controller.paymentCheck[i]?
        BoxDecoration(borderRadius: BorderRadius.circular(60), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8.0,
            spreadRadius: 1.0,
            offset: const Offset(
              0.0,
              25.0,
            ),
          ),
        ]):null,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary:  Colors.white ,
              shadowColor: Colors.black.withOpacity(0.1),
              elevation: 0,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () {
              //  if(Get.currentRoute=="/ViewProduct") {
              controller.selectPayment(i);

              controller.getType(i);
              // }

            },
            // Text Color (Foreground color)

            child: Container(
              width: MediaQuery.of(context).size.width ,
              height: MediaQuery.of(context).size.height *
                  0.09,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,children:  [

                Row(
                  children: [
                    Image(image: AssetImage(controller.selectedPayment[i].Image_Path),height: MediaQuery.of(context).size.height*0.1,width: MediaQuery.of(context).size.width*0.1),


                    Text("   ${controller.selectedPayment[i].name}",style:const TextStyle(color: Colors.black,fontSize: 20)),

                  ],
                ),
                 CircleAvatar(
                  backgroundColor: !controller.paymentCheck[i]? Colors.grey.withOpacity(0.5):Colors.orange,
                  radius: 15,
                  child:  CircleAvatar(
                    backgroundColor: Colors.white ,
                    radius: 12,
                    child: CircleAvatar(
                      backgroundColor: !controller.paymentCheck[i]? Colors.white:Colors.orange,
                      radius: 10,
                    ),

                  ),

                ),
              ],),
            ),

        ),
      );

    //  return


  }

}
