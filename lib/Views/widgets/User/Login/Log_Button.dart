import 'package:flutter/material.dart';
import '../../../../Model/Product.dart';
import 'package:get/get.dart';

callback(List<Product> grid){

}


class Logbutton extends StatefulWidget {
  final String text;
  final GlobalKey<FormState> formKey;

   const Logbutton({Key? key,  required this.text,  required this.formKey,}) : super(key: key);
  @override
  State<Logbutton> createState() => _Logbutton();

}



class _Logbutton extends  State<Logbutton>  {



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withAlpha(50),
              blurRadius: 8.0,
              spreadRadius: 1.0,
              offset:const Offset(
                0.0,
                20.0,
              ),
            ),
          ]),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          primary: Colors.red,
        ),
        onPressed: () {
    if(widget.text=='Send Email') {
    if (widget.formKey.currentState!.validate()) {
      Get.toNamed("/Verify");
    }
      return;
    }
    if(widget.text!='Verify') {
            
            if (widget.formKey.currentState!.validate()) {
              Get.toNamed("/ViewProduct");
            }
          }
          else {
      Get.offAndToNamed("/Login");

    }


        },
        child: Text(widget.text,
            style:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'Churchward Isabella',
                color: Colors.white)),
      ),
    )


    ;}}