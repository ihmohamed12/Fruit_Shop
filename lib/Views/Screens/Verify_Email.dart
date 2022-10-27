import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Model/Controller/Login_Controller.dart';
import 'package:fruitzzz_shop/Views/widgets/BackGround/Background_user.dart';
import 'package:get/get.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key,}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmail();
}

class _VerifyEmail extends State<VerifyEmail> {
  List<TextEditingController> verifyControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

      return SafeArea(
        child: Scaffold(
      appBar: null, // No action bar will build
      extendBodyBehindAppBar: true,

      body: Stack(
        children: <Widget>[
          Positioned(
            left: MediaQuery.of(context).size.width * 0.08,
            top: MediaQuery.of(context).size.height * 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.pink.withOpacity(0.13),
                    Colors.red.withOpacity(0.008)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.29,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.16,
              width: MediaQuery.of(context).size.width * 0.18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.orange.withOpacity(0.33),
                    Colors.red.withOpacity(0.018)
                  ],
                ),
              ),
            ),
          ),
          const BackGroundUser(),
          SingleChildScrollView(
              child: Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.92,
                  height: MediaQuery.of(context).size.height * 0.23,
                  child:
                      const Image(image: AssetImage("assets/images/log.png")),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  children: const [
                    Text('Verify Email',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            fontFamily: 'Churchward Isabella')),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: const [
                    Text(
                        'Enter the code we just sent you \non your email address',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'Churchward Isabella')),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (TextEditingController i in verifyControllers)
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: FractionalTranslation(
                              translation: const Offset(0.4, 0.005),
                              child: TextFormField(
                                controller: i,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    node.nextFocus();
                                  }
                                },
                                maxLength: 1,
                                cursorColor: Colors.black,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 30),
                                decoration: const InputDecoration(
                                  counterText: "",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              )),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('if your didnt recive a code',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'Churchward Isabella')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Resend',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'Churchward Isabella')),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ElevatedButton(
                    onPressed: () async {
                      String sms="";
                      for(int i =0; i<verifyControllers.length;i++){
                        sms+=verifyControllers[i].text.trim();
                      }
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                        verificationId: verification,
                        smsCode: sms,
                      );
                      await FirebaseAuth.instance.signInWithCredential(credential);
                      Get.offAllNamed("/ViewProduct");
                    },
                    child: const Text("Verify"))
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
