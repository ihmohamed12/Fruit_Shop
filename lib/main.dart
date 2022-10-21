import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Controller/Login_Controller.dart';
import 'package:fruitzzz_shop/Model/Controller_Bindings.dart';
import 'package:fruitzzz_shop/Views/Screens/Payment.dart';
import 'package:fruitzzz_shop/Views/Screens/Search.dart';
import 'package:fruitzzz_shop/Views/Screens/Shopping_Bag.dart';
import 'package:fruitzzz_shop/Views/Screens/Splash_Screen.dart';
import 'package:get/get.dart';
import 'Views/Screens/User_page.dart';
import 'Views/Screens/Log_in.dart';
import 'Views/Screens/register.dart';
import 'Views/Screens/Product_page.dart';
import 'Views/Screens/Email.dart';
import 'Views/Screens/Verify_Email.dart';

void main() async {
  LoginBinding().dependencies();
  ProductBinding().dependencies();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  return firebaseApp;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        smartManagement: SmartManagement.full,
        getPages: [
          GetPage(
            name: '/ViewProduct',
            page: () => const ProductsPage(),
            binding: ProductBinding(),
          ),
          GetPage(
            name: '/Shopping',
            page: () => const ShoppingBag(),
          ),
          GetPage(
            name: '/payment',
            page: () => const Payment(),
          ),GetPage(
            name: '/Search',
            page: () => const Search(),
          ), GetPage(
            name: '/Splach',
            page: () => const Splach(),
          ),
          GetPage(
            name: '/Product_card',
            page: () => const ViewProduct(),
          ),
          GetPage(
            name: '/Register',
            page: () => const Register(),
            binding: LoginBinding(),
          ),
          GetPage(
            name: '/',
            page: () =>const Login(),
            binding: LoginBinding(),
          ),
          GetPage(
            name: '/Verify',
            page: () =>  VerifyEmail(),
          ),
          GetPage(
            name: '/Send_Email',
            page: () =>const SendEmail(),
          ),
        ],
        title: 'Exam Application',
        home:  AuthService().handleAuthState()


        );
  }
}
