import 'package:flutter/material.dart';


class BackGroundProducts extends StatelessWidget {
  const BackGroundProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
          children: [
            Positioned(

              right: MediaQuery.of(context).size.width *0.63,
              bottom: MediaQuery.of(context).size.height * 0.45,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.5,
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
            ), Positioned(
              right:  0,
              top: MediaQuery.of(context).size.height * 0.6,
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