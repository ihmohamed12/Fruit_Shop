import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Model/Controller/Product_Controller.dart';
final controller = Get.find<ProductController>();

class BottomBar extends StatelessWidget {

  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = <String>[ '/ViewProduct', '/Shopping', '/Map', '/Account','/login',];
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
      child: GetBuilder<ProductController>(
        builder: (controller) =>
            BottomNavigationBar(
              backgroundColor: controller.darkMode ? Colors.black : Colors
                  .white,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.index,

              onTap: (int newindex) {
                if (newindex == 4) {
                  FirebaseAuth.instance.signOut();
                  Get.toNamed('/login');

                }
                Get.offNamedUntil(
                  pages[newindex],
                      (route) => route.settings.name==pages[0]

                )?.then((value) {
                  controller.setPage(0);

                });

                if(newindex == 0||newindex == 3) {
                  controller.setPage(newindex);
                }
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
    );
  }}