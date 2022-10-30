import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Model/Controller/Product_Controller.dart';
import '../../Screens/User_page.dart';

bool first = true;

class FavoriteCard extends StatelessWidget {
  final int i;

  const FavoriteCard({Key? key, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    return SizedBox(
        child: InkWell(
          onTap: () {
            currentItem = controller.favorite[i];
            setCurrent(controller.favorite[i]);
            controller.current = (controller.favorite[i]);
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
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.27,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.12,

                        child: Image(
                            image: AssetImage(controller.favorite[i].imagePath))

                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            children: [
                              SizedBox(
                                child: Text(' ${controller.favorite[i].name}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.black.withOpacity(0.7),
                                        fontFamily: 'Churchward Isabella')),
                              ),

                            ],
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.01,
                          ),
                          Row(
                            children: [
                              Card(
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: const Color(0xffffe0b2),
                                child: Text('  ${controller.favorite[i]
                                    .weight} KG  ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.orange,
                                        fontFamily: 'Churchward Isabella')),
                              ),
                              const Text('  \$',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.orange,
                                      fontFamily: 'Churchward Isabella')),
                              Text(' ${controller.favorite[i].price}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontFamily: 'Churchward Isabella')),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.02,
                          ),


                        ]),

                    SizedBox(
                      width: 15,
                      child: IconButton(onPressed: () {
                        controller.removeBrought(i);
                      },
                          icon: const Icon(
                            Icons.delete_outline, color: Colors.red,)),
                    )
                  ]),
            ),
          ),
        ));

    //  return
  }
}
