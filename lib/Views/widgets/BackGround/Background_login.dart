import 'package:flutter/material.dart';




class BackGroundLogin extends StatelessWidget {
  const BackGroundLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Stack(
      children: [

        Positioned(
          left: MediaQuery.of(context).size.width * 0.08,
          top:  0,
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


        Positioned(
          left: MediaQuery.of(context).size.width * 0.6,
          top: MediaQuery.of(context).size.height * 0.35,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.5,
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
        ],
    );
  }

// popular();
}