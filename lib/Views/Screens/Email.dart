import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fruitzzz_shop/Model/Controller/Login_Controller.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({Key? key}) : super(key: key);

  @override
  State<SendEmail> createState() => _SendEmail();
}

class _SendEmail extends State<SendEmail> {
  String data = '';
  bool correct = true;
  TextEditingController textPhone = TextEditingController();

  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                    key: _formKey2,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "login by phone number",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Flexible(
                              child: TextFormField(
                            validator: RequiredValidator(errorText: "Required"),
                            keyboardType: TextInputType.phone,
                            maxLength: 13,
                            decoration: InputDecoration(
                              prefixIconConstraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.22,
                              ),
                              counterText: '',
                              hintText: "Please enter phone ",
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
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
                                          fontSize: 18, color: Colors.black),
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
                                    exclude: <String>['KN', 'MF'],
                                    //Optional. Shows phone code before the country name.
                                    showPhoneCode: true,
                                    onSelect: (Country country) {
                                      controller.setCountries(country);
                                    },
                                    countryListTheme: CountryListThemeData(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(40.0),
                                        topRight: Radius.circular(40.0),
                                      ),
                                      inputDecoration: InputDecoration(
                                        labelText: 'Search',
                                        hintText: 'Start typing to search',
                                        prefixIcon: const Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xFF8C98A8)
                                                .withOpacity(0.2),
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {
                                if (_formKey2.currentState!.validate()) {
                                  phoneSignin(
                                      context,
                                      "+${controller.countryCode}${textPhone.text}",
                                      "");
                                }
                              },
                              child: const Padding(
                                padding:  EdgeInsets.fromLTRB(20, 15, 20, 15),
                                child:  Text(
                                  "Send",
                                  style: TextStyle(fontSize: 20),
                                ),
                              )),
                        ])))));
  }
}
