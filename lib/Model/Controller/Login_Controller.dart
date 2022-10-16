import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Views/Screens/Log_in.dart';
import 'package:fruitzzz_shop/Views/Screens/Splash_Screen.dart';
import 'package:fruitzzz_shop/Views/Screens/User_page.dart';
import 'package:fruitzzz_shop/Views/Screens/Verify_Email.dart';
import 'package:fruitzzz_shop/Views/widgets/User/showOtpDialog.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../User.dart';

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
        Get.toNamed("/ViewProduct");
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
            return ProductsPage();
          } else {
            return const Splach();
          }
        });
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
    await GoogleSignIn(scopes: <String>["email"]).signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

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
}
