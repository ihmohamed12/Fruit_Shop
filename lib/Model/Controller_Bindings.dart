
import 'package:fruitzzz_shop/Controller/Login_Controller.dart';
import 'package:get/get.dart';

import '../Controller/Product_Controller.dart';


class ProductBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<ProductController>(() => ProductController());
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<LoginController>(() => LoginController());
  }
}