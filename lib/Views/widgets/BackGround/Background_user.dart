import 'package:flutter/material.dart';




class BackGroundUser extends StatelessWidget {
  const BackGroundUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Stack(
      children: [

        Positioned(
          right: MediaQuery.of(context).size.width * 0,
          top: MediaQuery.of(context).size.height * 0.08,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.orange.withOpacity(0.12),
                  Colors.yellowAccent.withOpacity(0.01)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0,
          top: MediaQuery.of(context).size.height * 0.12,
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
          right: MediaQuery.of(context).size.width * 0,
          top: MediaQuery.of(context).size.height * 0.5,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.orange.withOpacity(0.12),
                  Colors.yellowAccent.withOpacity(0.01)
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