import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Views/widgets/Splash/Splash_Card.dart';


class Splach extends StatelessWidget {
  const Splach({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: null, // No action bar will build

        backgroundColor: Colors.white.withOpacity(0.95),
        extendBodyBehindAppBar: true,
        body: const MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(


      physics: const NeverScrollableScrollPhysics(),
      controller: controller,


      children:  <Widget>[

    Center(
      child: SplachScreens(description: "Quick Delivery at Your Doorstep",description2: "Home delivery and online reservation system for restaurants and cafe",image: "assets/images/Splash2.PNG",color:const [Colors.red,Colors.orange,Colors.orange],controller: controller),
    ),
    Center(
      child: SplachScreens(description: "Find your nearby grocery store",description2: "Choose anything from daily essentials to grocery store at home delivery ",image: "assets/images/Splash3.PNG",color:const [Colors.orange,Colors.red,Colors.orange],controller: controller),
    ),
    Center(
      child: SplachScreens(description: "Choose from best menu",description2: "Pick your desired food from the menu there are more than 66 items",image: "assets/images/Splash1.PNG",color: const [Colors.orange,Colors.orange,Colors.red],controller: controller),
    )

      ],
    );
  }
}
