import 'package:flutter/material.dart';
import '../widgets/BackGround/Background_login.dart';
import '../widgets/User/Login/Log_Button.dart';
import 'package:get/get.dart';
import '../../Model/User.dart';
import '../widgets/User/Login/DefaultTextField.dart';

class Login<L> extends StatefulWidget {
  const Login({super.key, required this.storage});

  final CounterStorage storage;

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController textUserName =  TextEditingController();
  TextEditingController textPassword =  TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    widget.storage.readCounter().then((value) {
      data = value;
      textUserName = TextEditingController();
      textPassword = TextEditingController();
    });
  }

  @override
  Widget build(BuildContext context) {



    return SafeArea(
        child: Scaffold(
      appBar: null, // No action bar will build

      backgroundColor: Colors.white.withOpacity(0.95),
      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
         const BackGroundLogin(),

          Positioned(
            left: MediaQuery.of(context).size.width * 0.0,
            top: MediaQuery.of(context).size.height * 0.8,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.yellow.withOpacity(0.1),
                    Colors.yellowAccent.withOpacity(0.01)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.05,
            top: MediaQuery.of(context).size.height * 0.8,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width*0.91,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withAlpha(30),
                      blurRadius: 8.0,
                      spreadRadius: 1.0,
                      offset:const Offset(
                        0.0,
                        8.0,
                      ),
                    ),
                  ]),

            ),
          ),
          SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: MediaQuery.of(context).size.height * 0.23,
                            child:const Image(
                                image: AssetImage("assets/images/log.png")),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text('Sign in',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  fontFamily: 'Churchward Isabella')),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      Form(
                          key: _formKey,
                          child: Column(children: [
                            SizedBox(
                              child: Row(
                                children: [
                                  Flexible(
                                    child: DefaultTextField(
                                      Textfield: textUserName,
                                      Type: Texttype.email,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  Flexible(
                                    child: DefaultTextField(
                                      Textfield: textPassword,
                                      Type: Texttype.passwordWithVisibility,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed("/Send_Email");
                                  },
                                  child:
                                  const Text('Forgot Password?',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        fontFamily: 'Churchward Isabella')),
                                )],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('OR',
                                    style: TextStyle(
                                        color: Colors.red.withOpacity(0.6),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontFamily: 'Churchward Isabella')),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.023),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child:const Image(
                                        image: AssetImage(
                                            "assets/images/facebook.png")),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child:const Image(
                                        image: AssetImage(
                                            "assets/images/instagram.png")),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child:const Image(
                                        image:
                                            AssetImage("assets/images/in.png")),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child:const Image(
                                        image: AssetImage(
                                            "assets/images/twitter.png")),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Logbutton(text: "Sign in",formKey: _formKey),
                          ])),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed("/Register");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:const [
                            Text('Don\'t you have account?',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: 'Churchward Isabella')),
                          ],
                        ),
                      ),

                    ],
                  )))
        ],
      ),

    ));
  }
}
