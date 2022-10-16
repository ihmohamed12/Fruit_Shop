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
  int index = 0;
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
            backgroundColor: Colors.white.withOpacity(0.95),
            extendBodyBehindAppBar: true,
            appBar: null,
            body: Stack(
              children: [
                const BackGroundUser(),
                SingleChildScrollView(
                    child: Container(
                        margin: const EdgeInsets.only(top: 15.0),
                        padding: const EdgeInsets.all(20),
                        child: Column(children: <Widget>[
                          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text('Hey $name',
                                style: const TextStyle(
                                    fontFamily: 'Churchward Isabella',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.black)),
                            const         Spacer(),
                            SizedBox(
                                // <-- SEE HERE
                                width: MediaQuery.of(context).size.width * 0.06,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: InkWell(
                                  onTap: () {},
                                  // Image tapped
                                  splashColor: Colors.white10,
                                  // Splash color over image
                                  child: Ink.image(
                                    image: const AssetImage(
                                      'assets/images/search.png',
                                    ),
                                  ),
                                )),
                            const   SizedBox(
                              width: 20, //<-- SEE HERE
                            ),
                            SizedBox(
                                // <-- SEE HERE
                                width: MediaQuery.of(context).size.width * 0.06,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed("/Shopping");
                                  },
                                  // Image tapped
                                  splashColor: Colors.white10,
                                  // Splash color over image
                                  child: Ink.image(
                                    image:const AssetImage(
                                      'assets/images/bell.png',
                                    ),
                                  ),
                                )),
                          ]),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(children: const [
                            Text('what do you like to find',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: 'Churchward Isabella',
                                )),
                          ]),
                          const        SizedBox(
                            height: 10,
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
                          const        SizedBox(
                            height: 20,
                          ),
                          const Popular(),
                          const           SizedBox(
                            height: 20,
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
                          GetBuilder<ProductController>(
                            builder: (controller) => GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              physics:const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              clipBehavior: Clip.none,
                              children: List.generate(
                                  controller.gridItems.length, (i) {
                                return ProductCard(
                                  i: i,
                                  key: null,
                                );
                              }),
                            ),
                          )
                        ])))
              ],
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.red,
                currentIndex: index,
                onTap: (int newindex) {
                  FirebaseAuth.instance.signOut();
                  if (newindex == 0) Get.toNamed('/login');

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
                    icon: Icon(Icons.share_location_outlined),
                    label: 'location',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'profile',
                  ),
                ],
              ),
            )));
  }
}
