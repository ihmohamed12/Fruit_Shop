import 'dart:async';

import 'package:flutter/material.dart';
import '../../Model/Controller/Product_Controller.dart';
import '../../Model/Product.dart';
import 'package:get/get.dart';

class Loaded extends StatefulWidget {
  const Loaded({Key? key}) : super(key: key);

  @override
  State<Loaded> createState() => _Loaded();
}


final controller =Get.find<ProductController>();

class _Loaded extends State<Loaded> {

  @override
  void initState() {
    super.initState();
    controller.getData();

    Timer(Duration(seconds: 3),(){
      controller.setList();

      Get.toNamed("/ViewProduct");
    });


  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
