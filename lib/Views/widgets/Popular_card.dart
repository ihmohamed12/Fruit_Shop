import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruitzzz_shop/Model/Product.dart';
import 'package:fruitzzz_shop/Views/Screens/User_page.dart';
Product Current= new Product(weight: 0,ImagePath: "",decription: "",calories: 0,Price: 0,Type: "",Name: "",Rating: 0);
class Popular extends StatelessWidget {
  const Popular ({Key? key}) : super(key: key);

  // popular();

  @override
  Widget build(BuildContext context) {
    return
      Container(child:

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


            CurrentItem =Current;
            SetCurrent(Current);
            Get.toNamed("/ViewProduct");          },
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
            Container(

              // <-- SEE HERE
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.15,
              child:  Image(
                  image:  AssetImage(
                      Current.ImagePath)),
            ),


            Column(children: [
              Row(
                children: [
                  Container(
                    child: Text('     '+Current.Name,
                        style: TextStyle(
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
                  child: new Image(
                      image:
                      new AssetImage('assets/images/fire.png')),
                ),
                Text("   " +Current.calories.toString() +" calories",
                    style: TextStyle(
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
                    color:  Color(0xffffe0b2),
                    child: Text('  '+Current.weight.toString()+' KG  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.orange,fontFamily: 'Churchward Isabella')),
                  ),
                  Text('  \$',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.orange,fontFamily: 'Churchward Isabella')),
                  Text(' '+Current.Price.toString(),
                      style: TextStyle(
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
SetCurrentProduct(Product CurrentProduct){
  Current= new Product(Rating:CurrentProduct.Rating ,  Name:CurrentProduct.Name, Type:CurrentProduct.Type,Price: CurrentProduct.Price,calories: CurrentProduct.calories,decription: CurrentProduct.decription,ImagePath: CurrentProduct.ImagePath,weight: CurrentProduct.weight );
}