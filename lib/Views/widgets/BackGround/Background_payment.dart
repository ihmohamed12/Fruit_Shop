import 'package:flutter/material.dart';




class BackGroundPayment extends StatelessWidget {
  const BackGroundPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Stack(
      children: [

        Positioned(
          left: MediaQuery.of(context).size.width * 0.25,
          bottom:  MediaQuery.of(context).size.height*0.75,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.yellowAccent.withOpacity(0.09),
                  Colors.orange.withOpacity(0.01),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          left: MediaQuery.of(context).size.width * 0.75,
          top: MediaQuery.of(context).size.height * 0.26,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.4 ,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.green.withOpacity(0.2),
                  Colors.yellowAccent.withOpacity(0.01),
                ],
              ),
            ),
          ),
        ),


        Positioned(
          right: MediaQuery.of(context).size.width * 0.6,
          top: MediaQuery.of(context).size.height * 0.4,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.orange.withOpacity(0.09),
                  Colors.yellowAccent.withOpacity(0.01),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

// popular();
}