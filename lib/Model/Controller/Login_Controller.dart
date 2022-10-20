import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruitzzz_shop/Views/Screens/Product_page.dart';
import 'package:fruitzzz_shop/Views/Screens/Splash_Screen.dart';
import 'package:username_gen/username_gen.dart';
import '../../Model/User.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Views/Screens/ListLazyLoading.dart';


import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../Views/Screens/User_page.dart';



final controller = Get.find<LoginController>();
String verification="";
class Users {
  String name;
  String phone;

  Users(this.name, this.phone);

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone': phone,
  };
}

FirebaseAuth auth = FirebaseAuth.instance;

class FireAuth {
  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      controller.error = '';
      controller.error2 = '';
      if (e.code == 'user-not-found') {
        controller.error = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        controller.error2 = 'Wrong password provided.';
      }
    }

    return user;
  }

  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      CollectionReference users =
      FirebaseFirestore.instance.collection('Users');
      user = userCredential.user;
      Users u = Users(name, phone);
      users.doc(user?.uid).set(u.toJson());
    } on FirebaseAuthException catch (e) {
      controller.error = '';
      controller.error2 = '';
      if (e.code == 'weak-password') {
        controller.error2 = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        controller.error = 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    }
    email = '';
    password = '';
    return user;
  }
}

Future<void> phoneSignin(
    BuildContext context, String phone, String verificationCode) async {
  TextEditingController codeController = TextEditingController();
  await auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential cred) async {
        await auth.signInWithCredential(cred);
      },
      verificationFailed: (e) {
        print('Failed: ${e.message.toString()}');
      },
      codeSent: ((String verificationId, int? resendToken) async {
        verification=verificationId;
        Get.toNamed("/Verify");
      }),
      codeAutoRetrievalTimeout: (String timeout) {
      });
}

class AuthService {
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const ProductsPage();
          } else {
            return const Splach();
          }
        });
  }
  Future<UserCredential> signInWithFacebook() async {

    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(loginResult.accessToken!.token);
    Get.offAllNamed("/ViewProduct");

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    Get.offAllNamed("/ViewProduct");


    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class LoginController extends GetxController {
  CounterStorage storage = CounterStorage();
  String countryCode = "1";
  String emoji = "🇦🇮";
  bool isObscure = true;
  var empty = "".obs;
  String data = '';
  String error = '';
  String error2 = '';

  List<Employee> Users = [];
  List<String> jobs = [
    "Ceo",
    "Account Manager",
    "Human Resources manager",
    "Sales Manager",
    "Marketing Manager",
    "R&D Team"
  ];
  final _random = new Random();
  ScrollController scrollController = ScrollController();


  void getData() {
    storage.readCounter().then((value) {
      data = value;
    });
  }

  updateEmail() {
    update();
  }

  bool registerCheck(String email) {
    List<String> split1 = data.split(';');
    for (int i = 0; i < split1.length; i++) {
      List<String> split2 = split1[i].split(',');
      if (split2[0] == email) {
        return true;
      }
    }
    return false;
  }

  setCountries(Country country) {
    emoji = (country.flagEmoji);
    countryCode = country.e164Key.split("-")[0];
    update();
  }

  setObsecure() {
    isObscure = !isObscure;
    update();
  }
  addData() {
    Timer(Duration(seconds: 1), () {

    for (int i = 0; i < 10; i++) {
      Users.add(Employee(
          name: UsernameGen.generateWith(),
          job: jobs[0 + _random.nextInt(6 - 0)],
          imagePath: ""));
    }
      update();
    });
  }
  void setUsers() {
    for (int i = 0; i < 10; i++) {
      Users.add(Employee(
          name: UsernameGen.generateWith(),
          job: jobs[0 + _random.nextInt(6 - 0)],
          imagePath: ""));
    }
    controller.scrollController.addListener(() {
      if (controller.scrollController.position.pixels ==
          controller.scrollController.position.maxScrollExtent) {
        if(Users.length<80){
          addData();
        }
        else{
          Fluttertoast.showToast(
              msg: "No more items",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              fontSize: 30.0
          );
        }

      }
    });



  }
}
