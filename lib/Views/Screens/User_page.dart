import 'package:flutter/material.dart';
import '../../Model/Controller/Product_Controller.dart';
import '../widgets/Bar/Bottom_Navigation.dart';
import '../widgets/Card/Type_card.dart';
import '../../Model/Product.dart';
import '../widgets/Card/Popular_card.dart';
import '../widgets/Card/Product_card.dart';
import '../../Model/User.dart';
import 'package:get/get.dart';
import '../widgets/BackGround/Background_user.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPage();
}

Product currentItem = Product(
    name: '',
    type: '',
    price: 0,
    description: '',
    imagePath: '',
    calories: 0,
    weight: 15,
    rating: 0,
    weightBought:0);

void setCurrent(item) {
  currentItem = item;
}

List<Product> items = [];
List<bool> _flag = [];
final controller =Get.find<ProductController>();

class _ProductsPage extends State<ProductsPage> {

  @override
  void initState() {

    super.initState();

    if (items.isEmpty) {
      items = controller.setList();
    }
    for (int i = 0; i < items.length; i++) {
      _flag.add(true);
    }
    if (controller.gridItems.isEmpty) {
      controller.gridItems = List.from(items).obs;
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: null,
            body: Stack(
              children: [
                const BackGroundUser(),
                NotificationListener<OverscrollIndicatorNotification> (
                  onNotification: (overScroll){
                    overScroll.disallowIndicator();
                    return false;
                  },
                  child: SingleChildScrollView(
                      child: Container(
                          margin: const EdgeInsets.only(top: 15.0),
                          padding: const EdgeInsets.all(18),
                          child: GetBuilder<ProductController>(
                            builder: (controller) =>Column(children: <Widget>[
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text('Hey $name',
                                        style: const TextStyle(
                                            fontFamily: 'Churchward Isabella',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            )),
                                    SizedBox(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height*0.008,
                                    ),

                                     Text('what do you like to find',
                                        style: TextStyle(
                                          color: controller.darkMode?  Colors.white.withOpacity(0.7):Colors.grey,
                                          fontSize: 18,
                                          fontFamily: 'Churchward Isabella',
                                        )),  ],
                                ),
                             Row(children: [
                                IconButton(onPressed: (

                                    ){
                                  Get.toNamed("/Search");
                                }, icon:const Icon(Icons.search,size: 30,)),




                                IconButton(onPressed: (){
                                    }, icon: Icon(Icons.notifications,color: controller.darkMode? Colors.yellow:Colors.red,size: 30))
                             ],)

                              ]),
                               SizedBox(
                                 height: MediaQuery.of(context)
                                    .size
                                    .height*0.001,
                              ),

                                     SizedBox(
                                height: MediaQuery.of(context).size.height * 0.04,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context)
                                    .size
                                    .width, //you sure it should be 0.001?
                                height: MediaQuery.of(context).size.height * 0.08,
                                child: ListView.builder(
                                    itemCount: 4,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, i) =>
                                        TypeCard(i: i)),
                              ),
                              const   SizedBox(
                                height: 20,
                              ),
                              Row(children: <Widget>[
                                const       Text('Popular',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        fontFamily: 'Churchward Isabella')),
                                const        Spacer(),
                                InkWell(
                                  onTap: () {},
                                  splashColor: Colors.white10,
                                  child:const Text('Sell All',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 17)),
                                ),
                              ]),
                                      SizedBox(
                                height: MediaQuery.of(context).size.height * 0.03,
                              ),
                               Popular(popular: controller.bestRated),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.03,
                              ),
                              Row(
                                children: const [
                                  Text('Top Item',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23,
                                          fontFamily: 'Churchward Isabella')),
                                ],
                              ),

                                    GridView.count(
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.98,
                                  crossAxisSpacing: 1,
                                  physics:const NeverScrollableScrollPhysics(),
                                  children: List.generate(
                                      controller.gridItems.length, (i) {
                                    return ProductCard(
                                      i: i,
                                      key: null,
                                    );
                                  }),
                                ),


                            ]),
                          ))),
                )
              ],
            ),
            bottomNavigationBar: const BottomBar()));
  }
}
