import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Model/Controller/Product_Controller.dart';
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

class _ProductsPage extends State<ProductsPage> {
  final controller =Get.find<ProductController>();

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
            backgroundColor: Colors.white.withOpacity(0.98),
            extendBodyBehindAppBar: true,
            appBar: null,
            body: Stack(
              children: [
                const BackGroundUser(),
                SingleChildScrollView(
                    child: Container(
                        margin: const EdgeInsets.only(top: 15.0),
                        padding: const EdgeInsets.all(20),
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
                                          color: Colors.black)),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height*0.008,
                                  ),

                                  const Text('what do you like to find',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: 'Churchward Isabella',
                                      )),  ],
                              ),
                           Row(children: [
                              IconButton(onPressed: (

                                  ){
                                Get.toNamed("/Search");
                              }, icon:const Icon(Icons.search,color: Colors.black,size: 30,)),




                              IconButton(onPressed: (){
                                    Get.toNamed("/Shopping");
                                  }, icon:const Icon(Icons.notifications,color: Colors.red,size: 30))
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
                        )))
              ],
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              child:   GetBuilder<ProductController>(
                builder: (controller) => BottomNavigationBar(
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.red,
                  unselectedItemColor: Colors.grey.withOpacity(0.5 ),
                  currentIndex: controller.index,
                  onTap: (int newindex) {
                    FirebaseAuth.instance.signOut();
                    if (newindex == 4) {
                      Get.offAllNamed('/login');
                      FirebaseAuth.instance.signOut();
                    }
                    if (newindex == 1) {
                      Get.toNamed('/Shopping');
                    }
                    controller.setPage(newindex);
                  },
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_bag),
                      label: 'Shopping',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.location_on),
                      label: 'location',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'profile',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.logout),
                      label: 'logout',
                    ),
                  ],
                ),
              ),
            )));
  }
}
