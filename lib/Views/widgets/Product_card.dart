import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Views/Screens/User_page.dart';
import 'package:fruitzzz_shop/Model/Product.dart';
import 'package:get/get.dart';

Product CurrentProduct= new Product(weight: 0,ImagePath: "",decription: "",calories: 0,Price: 0,Type: "",Name: "",Rating: 0);

class Product_Card extends StatefulWidget {
  final int i;
  const Product_Card ({ required Key? key,required this.i}) : super(key: key);

  @override
  State<Product_Card> createState() => _Product_Card();

}



class _Product_Card extends  State<Product_Card>  {
  callback(Product grid){
    setState(() {
      setState(() => CurrentProduct = grid);    });
  }

  // popular();

  @override
  Widget build(BuildContext context) {
    return Container(

        child: Column(
          children: [
            Visibility(
                child: SizedBox(
                  height: 15,
                ),
                visible: (widget.i.isEven)),
            Container(
              height:
              MediaQuery.of(context).size.height * 0.2,
              width:
              MediaQuery.of(context).size.width * 0.5,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                shadowColor: Colors.transparent,
                child: ElevatedButton(
                    onPressed: () {

                      CurrentItem = GridItems[widget.i];
                      SetCurrent(GridItems[widget.i]);
                      Get.toNamed("/ViewProduct");
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      //specify the button's elevation color

                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(15.0),
                      ),
                      primary: Colors.white,
                      // Background color
                      onPrimary: Colors
                          .red, // Text Color (Foreground color)
                    ),
                    child: Column(children: <Widget>[
                      Container(
                        // <-- SEE HERE
                        width: MediaQuery.of(context)
                            .size
                            .width *
                            0.4,
                        height: MediaQuery.of(context)
                            .size
                            .height *
                            0.12,
                        child: new Image(
                            image: new AssetImage(
                                GridItems[widget.i].ImagePath)),
                      ),
                      Text(GridItems[widget.i].Name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily:
                              'Churchward Isabella')),
                      Row(
                        children: [
                          SizedBox(
                            width: 14,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(
                                  15.0),
                            ),
                            color: widget.i.isEven
                                ? Color(0xffffe0b2)
                                : Color(0xffffcdd2),
                            child: Text(
                                ' ' +
                                    GridItems[widget.i]
                                        .weight
                                        .toString() +
                                    ' kg ',
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.bold,
                                    fontSize: 15,
                                    color: widget.i.isEven
                                        ? Colors.orange
                                        : Colors.red,
                                    fontFamily:
                                    'Churchward Isabella')),
                          ),
                          Text('  \$',
                              style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.orange)),
                          Text(
                              ' ' +
                                  GridItems[widget.i]
                                      .Price
                                      .toString(),
                              style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily:
                                  'Churchward Isabella')),
                        ],
                      ),
                    ])),
              ),
            ),
          ],
        )
    )

      ;

    //  return


  }

}