import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Controller_Bindings.dart';
import 'package:fruitzzz_shop/Views/Screens/Favoriate.dart';
import 'package:fruitzzz_shop/Views/Screens/Payment.dart';
import 'package:fruitzzz_shop/Views/Screens/Search.dart';
import 'package:fruitzzz_shop/Views/Screens/Shopping_Bag.dart';
import 'package:fruitzzz_shop/Views/Screens/Splash_Screen.dart';
import 'package:get/get.dart';
import 'Model/Theme.dart';
import 'Views/Screens/Account.dart';
import 'Views/Screens/ListLazyLoading.dart';
import 'Views/Screens/Loading.dart';
import 'Views/Screens/Login2.dart';
import 'Views/Screens/Map.dart';
import 'Views/Screens/User_page.dart';
import 'Views/Screens/Log_in.dart';
import 'Views/Screens/register.dart';
import 'Views/Screens/Product_page.dart';
import 'Views/Screens/Email.dart';
import 'Views/Screens/Verify_Email.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


 @override
  Widget build(BuildContext context) {

   return GetMaterialApp(

        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
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
            binding: ProductBinding(),

          ),
          GetPage(
            name: '/payment',
            page: () => const Payment(),
            binding: ProductBinding(),

          ),GetPage(
            name: '/Search',
            page: () => const Search(),
            binding: ProductBinding(),
          ), GetPage(
            name: '/Splach',
            page: () => const Splach(),
            binding: ProductBinding(),
          ),
          GetPage(
            name: '/Product_card',
            page: () => const ViewProduct(),
            binding: ProductBinding(),
          ),
          GetPage(
            name: '/Favorite',
            page: () => const Favorite(),
            binding: ProductBinding(),
          ),
          GetPage(
            name: '/Loaded',
            page: () => const Loaded(),
            binding: ProductBinding(),
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
            name: '/Login2',
            page: () =>const Login2(),
            binding: LoginBinding(),
          ),
          GetPage(
            name: '/Verify',
            page: () =>  const VerifyEmail(),
            binding: LoginBinding(),

          ),
          GetPage(
            name: '/Send_Email',
            page: () =>const SendEmail(),
            binding: LoginBinding(),
          ),
          GetPage(
            name: '/Map',
            page: () =>const Maps(),
          ),
          GetPage(
            name: '/Account',
            page: () =>const Accounts(),
            binding: LoginBinding(),

          ),
          GetPage(
            name: '/Lazy',
            page: () =>const LazyLoading(),
            binding: LoginBinding(),

          ),
        ],
        title: 'Exam Application',
        home:const  Splach()


        );
  }


}
