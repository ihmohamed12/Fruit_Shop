import 'package:flutter/material.dart';
import '../../Model/User.dart';
import '../widgets/User/Login/DefaultTextField.dart';
import '../widgets/User/Login/Log_Button.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({Key? key}) : super(key: key);

  @override
  State<SendEmail> createState() => _SendEmail();
}

class _SendEmail extends State<SendEmail> {


  String data = '';
  bool correct = true;
  TextEditingController textUserName = TextEditingController();

  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset:false,
            body: Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                    key: _formKey2,
                    child: Column(children: [
                      Row(
                        children:const [
                          Text(
                            "Reset your password ",
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: const [
                          Text(
                            "After entering your email and pressing the button.\na mail will be sent to you containing your code.",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        children: [
                          Flexible(
                              child: DefaultTextField(
                            Type: Texttype.email,
                            Textfield: textUserName,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Logbutton(text: "Send Email", formKey: _formKey2)
                    ])))));
  }
}
