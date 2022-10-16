
import 'package:get/get.dart';

import 'Controller/Product_Controller.dart';
import 'Controller/Login_Controller.dart';


class ProductBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<ProductController>(() => ProductController());
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies(){
    Get.put(LoginController());
  }
}