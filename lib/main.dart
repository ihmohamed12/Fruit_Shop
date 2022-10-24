import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Controller_Bindings.dart';
import 'package:get/get.dart';
import 'Views/Screens/User_page.dart';
import 'Views/Screens/Log_in.dart';
import 'Views/Screens/register.dart';
import 'Views/Screens/Product_page.dart';
import 'Model/User.dart';

import 'Views/Screens/Email.dart';
import 'Views/Screens/Verify_Email.dart';
void main() {
  LoginBinding().dependencies();
  ProductBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.onlyBuilder,
      getPages: [
        GetPage(name: '/ViewProduct',
          page:()=> const ProductsPage(),
          binding: ProductBinding(),
        ),
        GetPage(name: '/Product_card',
          page:()=>  const ViewProduct(),
        ),

        GetPage(name: '/Register',
          page:()=>  Register(storage: CounterStorage()),
        ),
        GetPage(name: '/',
          page:()=>  Login(storage: CounterStorage(),),
          binding: LoginBinding(),

        ),
        GetPage(name: '/Verify',
          page:()=>  const VerifyEmail(),
        ),
        GetPage(name: '/Send_Email',
          page:()=>  const SendEmail(),
        ),
      ],
      initialBinding: LoginBinding(),
      title: 'Exam Application',
      home: Login(storage: CounterStorage()),
      // bottomNavigationBar: ,
    );
  }
}
