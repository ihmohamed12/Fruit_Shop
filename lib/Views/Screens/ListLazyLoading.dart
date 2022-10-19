import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruitzzz_shop/Model/Controller/Login_Controller.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class LazyLoading extends StatefulWidget {
  const LazyLoading({Key? key}) : super(key: key);

  @override
  State<LazyLoading> createState() => _LazyLoading();
}


final controller =Get.find<LoginController>();



class _LazyLoading extends State<LazyLoading> {
  @override
  void initState() {
    super.initState();
    controller.setUsers();

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Employees"),
              backgroundColor: Colors.green,
            ),
            drawer: const Drawer(),
            body:  GetBuilder<LoginController>(
              builder: (controller) => ListView.builder(
                  itemExtent: 80,
                  controller: controller.scrollController,

                  itemBuilder: (context, i) {

                    if (i == controller.Users.length ) {
                      if(i< 80) {

                        return  const CupertinoActivityIndicator(

                      );

                      }
                    }
                    return ListTile(
                      tileColor:
                          i.isOdd ? Colors.white : Colors.grey.withOpacity(0.1),
                      title: Text(controller.Users[i].name.trim(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      focusColor:
                          i.isEven ? Colors.white : Colors.grey.withOpacity(0.1),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.black12,
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                      subtitle: Text(controller.Users[i].job.trim(),
                          style: const TextStyle(
                            color: Colors.grey,
                          )),
                    );
                  },
                itemCount:controller.Users.length==80? controller.Users.length:controller.Users.length+1,
              ),

            )
        ));
  }
}
