import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:username_gen/username_gen.dart';
import '../../Model/User.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

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

      user =  userCredential.user;
      await  controller.setUserID(user!.uid.toString());

      await FirebaseFirestore.instance.collection('Users').doc(user.uid).get().then((value)
     => controller.setUserName(value.data().toString().split(",")[1].split(":")[1].split("}")[0]));
      if(user.uid!=null){
        Get.toNamed("/ViewProduct");
      }
      controller.error = '';
      controller.error2 = '';

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: "No user found for that email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            fontSize: 30.0
        );
      } else if (e.code == 'wrong-password') {
        controller.setError2('Wrong password provided.');
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
      await  users.doc(user?.uid).set(u.toJson());
      controller.setUserID(user!.uid.toString());
      controller.setUserName(name);


    } on FirebaseAuthException catch (e) {
      controller.error = '';
      controller.error2 = '';
      if (e.code == 'weak-password') {
        controller.setError2( 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        controller.setError1('The account already exists for that email.');
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
    await  controller.setUserID(googleUser!.id.toString());
    await controller.setUserName(googleUser.displayName.toString());
  //  await FirebaseFirestore.instance.collection('Users').doc(googleUser.id).get().then((value)
   // => controller.setUserName(value.data().toString().split(",")[1].split(":")[1].split("}")[0]));
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    Get.toNamed("/ViewProduct");
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class LoginController extends GetxController {
  bool darkMode = false;
  CounterStorage storage = CounterStorage();
  String countryCode = "1";
  String emoji = "🇦🇮";
  bool isObscure = true;
  var empty = "".obs;
  String data = '';
  String error = '';
  String error2 = '';
  String userID = '';
  String userName = '';

  setMode(){
    darkMode=!darkMode;
    update();
  }
  setError1(String value){
    error = value;
    update();
  }
  setError2(String value){
    error2 = value;
    update();
  }

  setUserID(String iD){
    userID = iD;
    update();
  }
  setUserName(String Name){
    userName = Name;
    update();
  }

  List<Employee> Users = [];
  List<String> jobs = [
    "Ceo",
    "Account Manager",
    "Human Resources manager",
    "Sales Manager",
    "Marketing Manager",
    "R&D Team"
  ];
  final _random = Random();
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
    Timer( const Duration(seconds: 1), () {

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

  void changeTheme(bool value) {
    darkMode = value;
    Get.changeThemeMode(
      !darkMode ? ThemeMode.light : ThemeMode.dark,
    );
    update();
  }
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', darkMode);
  }




}
