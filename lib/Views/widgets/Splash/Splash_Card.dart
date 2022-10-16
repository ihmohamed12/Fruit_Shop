import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Views/widgets/BackGround/Background_user.dart';

class SplachScreens extends StatelessWidget {
  final String description;
  final String description2;
  final String image;
  final List<Color> color;
  final PageController controller;

  const SplachScreens(
      {super.key,
      required this.description,
      required this.image,
      required this.description2,
      required this.color,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(

          children: [

        const BackGroundUser(),

        Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),

          child: Column(


            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Image(image: AssetImage(image)),
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                description2,
                style: const TextStyle(fontSize: 20, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.05,
                  child: CircleAvatar(
                    backgroundColor: color[0],
                    maxRadius: 30,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.05,
                  child: CircleAvatar(
                    backgroundColor: color[1],
                    maxRadius: 30,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.05,
                  child: CircleAvatar(
                    backgroundColor: color[2],
                    maxRadius: 30,
                  ),
                )
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.animateToPage(
                    controller.page!.toInt() + 1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const CircleBorder()),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  // <-- Button color
                  overlayColor:
                      MaterialStateProperty.resolveWith<Color?>((states) {
                    return null;
                  }),
                ),
                child: const Icon(Icons.arrow_right_alt),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
