import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../Model/Controller/Login_Controller.dart';
import 'package:get/get.dart';

import '../../../../Model/User.dart';

class DefaultTextField<TF> extends StatelessWidget {
  final TextEditingController Textfield;
  final Texttype Type;

  const DefaultTextField(
      {Key? key, required this.Textfield, required this.Type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller) => TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
              validator: (text) {
                if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text.toString())&&Type == Texttype.email) {
                  return 'please enter proper email';
                }
                if (text == null || text.isEmpty) {
                  return 'Can\'t be empty';
                }
                if ((Type == Texttype.passwordWithoutVisibility ||
                    Type == Texttype.passwordWithVisibility )&&
                        text.length < 6) {
                  return 'Too short';
                }
                if (Type == Texttype.email && controller.error != '')
                  {  return controller.error;}
                if (Type != Texttype.passwordWithVisibility && controller.error2 != '')
                 { return controller.error2;}
                return null;
              },
              controller: Textfield,
              cursorColor: Colors.black,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText:
                    "Please enter ${Type == Texttype.email ? "Email" : "Password"}",
                suffixIcon: Type == Texttype.passwordWithVisibility
                    ? IconButton(
                        icon: controller.isObscure
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        color: Colors.grey,
                        onPressed: () {
                          controller.setObsecure();
                        },
                      )
                    : Text(controller.empty.value),
              ),
              obscureText: (Type == Texttype.passwordWithVisibility)
                  ? controller.isObscure
                  : Type == Texttype.passwordWithoutVisibility
                      ? true
                      : false,
            ));
  }
}
