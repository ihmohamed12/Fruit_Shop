import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../../Controller/Login_Controller.dart';
import 'package:get/get.dart';

import '../../../../Model/User.dart';

class DefaultTextField<TF> extends StatelessWidget {
  final TextEditingController Textfield;
  final Texttype Type;

  const DefaultTextField({Key? key, required this.Textfield, required this.Type})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();

    return Obx(() => TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp('[ ]')),
          ],
          validator: Type == Texttype.email ? MultiValidator([
                  RequiredValidator(errorText: "Required"),
                  EmailValidator(
                      errorText: "Please enter a valid email address"),
                ])
              : MultiValidator([
                  RequiredValidator(errorText: "Required"),
                  MinLengthValidator(6,
                      errorText: "Password must contain at least 6 characters"),
                ]),
          controller: Textfield,
          cursorColor: Colors.black,
          style: const TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            enabledBorder:const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder:const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: "Please enter ${Type == Texttype.email ? "Email" : "Password"}",
            suffixIcon: Type == Texttype.passwordWithVisibility
                ? IconButton(
                    icon: loginController.isObscure.value
                        ?const Icon(Icons.visibility)
                        :const Icon(Icons.visibility_off),
                    color: Colors.grey,
                    onPressed: () {
                      loginController.setObsecure();
                    },
                  )
                : Text( loginController.empty.value),
          ),
          obscureText: (Type == Texttype.passwordWithVisibility) ? loginController.isObscure.value
              : Type == Texttype.passwordWithoutVisibility? true:false,
        ));
  }
}
