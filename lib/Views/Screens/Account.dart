import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Controller/Login_Controller.dart';
import 'package:fruitzzz_shop/Model/Controller/Product_Controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/BackGround/Background_user.dart';
import '../widgets/Bar/Bottom_Navigation.dart';



class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  State<Accounts> createState() => _Accounts();
}

final controller = Get.find<LoginController>();
final controller2 = Get.find<ProductController>();

final FirebaseAuth auth = FirebaseAuth.instance;

final User? user = auth.currentUser;
final uid = user?.uid;
// here you write the codes to input the data into firestore

class _Accounts extends State<Accounts> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: GetBuilder<LoginController>(
        builder: (controller) =>
            GetBuilder<ProductController>(
              builder: (controller2) => Container(
          padding: const EdgeInsets.all(20),
          child: Stack(
              children: [
                const BackGroundUser(),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.userName.toUpperCase().trim(),
                          style: const TextStyle(fontSize: 18,),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: const CircleAvatar(
                            backgroundColor: Colors.black12,
                            child: //ImagePath==""?
                                Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.grey,
                            ),
                            // : Image(image: AssetImage("")),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.007,
                    ),
                    Divider(color: Colors.black.withOpacity(0.5)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const  Text(
                            "My Cart",
                            style: TextStyle(fontSize: 18),
                          ),
                          Card(child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                            IconButton(

                              icon:const Icon(Icons.shopping_cart_outlined,size: 25,), onPressed: () {
                              Get.toNamed("/Shopping");
                            },),
                            Text("${controller2.bought.length.toString()}   " )
                          ],
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.007,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const  Text(
                            "Fav",
                            style: TextStyle(fontSize: 18),
                          ),
                          Card(child: Row(children: [
                            IconButton(

                              icon: Icon(Icons.favorite,size: 25,color: controller.darkMode? Colors.red:Colors.grey,), onPressed: () {
                              Get.toNamed("/Favorite");
                            },),
                            Text("${controller2.favorite.length.toString()}   ")
                          ],
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.009,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const  Text(
                            "Dark Mode",
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(children: [
                            Switch(
                              activeColor: Colors.white,
                              value: controller.darkMode, onChanged: (value) {
                              controller.changeTheme(value);
                              controller2.setDarkMode();
                            },)

                          ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.009,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const  Text(
                            "Logout",
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(children: [
                            IconButton(

                              icon:const Icon(Icons.logout), onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Get.offAllNamed('/login');


                            },),
                          ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
          ),
        ),
            ),
      ),

            bottomNavigationBar: const BottomBar()
    ));
  }
}
