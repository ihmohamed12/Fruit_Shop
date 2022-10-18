import 'package:flutter/material.dart';




class BackGroundCart extends StatelessWidget {
  const BackGroundCart  ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Stack(
      children: [

        Positioned(
          left: MediaQuery.of(context).size.width * 0.63,
          bottom: MediaQuery.of(context).size.height * 0.78,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.orange.withOpacity(0.08),
                  Colors.yellowAccent.withOpacity(0.02)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0,
          bottom: MediaQuery.of(context).size.height * 0.35,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.pink.withOpacity(0.12),

                  Colors.red.withOpacity(0.01)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: MediaQuery.of(context).size.width * 0.72,
          top: MediaQuery.of(context).size.height * 0.55,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.orange.withOpacity(0.15),
                  Colors.yellowAccent.withOpacity(0.02)
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