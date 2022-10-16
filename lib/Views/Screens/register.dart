import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../Model/Controller/Login_Controller.dart';
import '../../Model/User.dart';
import 'package:get/get.dart';
import '../widgets/BackGround/Background_login.dart';
import '../widgets/User/Login/DefaultTextField.dart';
import '../widgets/User/Login/Log_Button.dart';
import 'package:country_picker/country_picker.dart';

class Register extends StatefulWidget {
  const Register({super.key});


  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {

  final controller = Get.find<LoginController>();


  TextEditingController textUserName = TextEditingController();
  TextEditingController textPassword = TextEditingController();
  TextEditingController textEmail = TextEditingController();
  TextEditingController textPhone = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: null,
            // No action bar will build

            backgroundColor: Colors.white.withOpacity(0.96),
            extendBodyBehindAppBar: true,
            body: Stack(
              children: <Widget>[
                const BackGroundLogin(),
                SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.92,
                                  height:
                                      MediaQuery.of(context).size.height * 0.23,
                                  child: const Image(
                                      image:
                                          AssetImage("assets/images/log.png")),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text('Sign up',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        fontFamily: 'Churchward Isabella')),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            GetBuilder<LoginController>(
                              builder: (controller) =>   Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                              child: TextFormField(
                                            validator: RequiredValidator(
                                                errorText: "Required"),
                                            controller: textUserName,
                                            cursorColor: Colors.black,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: const InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                ),
                                                hintText: "Please enter name"),
                                          ))
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                              child: DefaultTextField(
                                            Textfield: textEmail,
                                            Type: Texttype.email,
                                          )),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                              child: TextFormField(
                                            validator: RequiredValidator(
                                                errorText: "Required"),
                                            keyboardType: TextInputType.phone,
                                            maxLength: 13,
                                            decoration: InputDecoration(
                                              prefixIconConstraints:
                                                  BoxConstraints(
                                                maxWidth: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.22,
                                              ),
                                              counterText: '',
                                              hintText: "Please enter phone ",
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              focusedBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              prefixIcon: InkWell(
                                                child: Row(
                                                  children: [
                                                  Text(controller.emoji,
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                        )),
                                                    Text(
                                                      controller.countryCode,
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black),
                                                    ),
                                                    const Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.grey,
                                                    ),
                                                  ],
                                                ),
                                                onTap: () {
                                                  showCountryPicker(
                                                    context: context,
                                                    //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                                                    exclude: <String>[
                                                      'KN',
                                                      'MF'
                                                    ],
                                                    //Optional. Shows phone code before the country name.
                                                    showPhoneCode: true,
                                                    onSelect:
                                                        (Country country) {
                                                      controller.setCountries(
                                                          country);
                                                    },
                                                    countryListTheme:
                                                        CountryListThemeData(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                40.0),
                                                        topRight:
                                                            Radius.circular(
                                                                40.0),
                                                      ),
                                                      inputDecoration:
                                                          InputDecoration(
                                                        labelText: 'Search',
                                                        hintText:
                                                            'Start typing to search',
                                                        prefixIcon: const Icon(
                                                            Icons.search),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: const Color(
                                                                    0xFF8C98A8)
                                                                .withOpacity(
                                                                    0.2),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            controller: textPhone,
                                          )),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                              child: DefaultTextField(
                                            Textfield: textPassword,
                                            Type: Texttype
                                                .passwordWithoutVisibility,
                                          )),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('OR',
                                              style: TextStyle(
                                                  color: Colors.red
                                                      .withOpacity(0.6),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      'Churchward Isabella')),
                                        ],
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              child: const Image(
                                                  image: AssetImage(
                                                      "assets/images/facebook.png")),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              child: const Image(
                                                  image: AssetImage(
                                                      "assets/images/instagram.png")),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              child: const Image(
                                                  image: AssetImage(
                                                      "assets/images/in.png")),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              child: const Image(
                                                  image: AssetImage(
                                                      "assets/images/twitter.png")),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                      ),
                                      Logbutton(email: textEmail.text,
                                          name: textUserName.text,
                                          password: textPassword.text,
                                          phone: textPhone.text.toString(),
                                          text: "Sign up", formKey: _formKey),
                                    ],
                                  )),
                            ),
                          ],
                        )))
              ],
            ),
           ));
  }
}
