import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late List result;
List<String> _list=["item 1","item 2","item 3","item 4"];
var map = json.decode('''{
    "status": "Success",
    "result": {
        "canApprove": true,
        "leaveType": "Annual",
        "leaveFrom": "28-Sep-2022",
        "leaveTo": "29-Sep-2022",
        "leaveDays": "4",
        "destination": "cairo",
        "for": "Boules Hisham",
        "pendingApproval": null,
        "createdBy": "Boules Hisham",
        "createdOn": "28-Sep-2022",
        "remarks": "testingmy notes"
    }
}''') as Map<String, dynamic> ;

final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
getData() async {
 /* map = await json.decode('''{
    "status": "Success",
    "result": {
        "canApprove": true,
        "leaveType": "Annual",
        "leaveFrom": "28-Sep-2022",
        "leaveTo": "29-Sep-2022",
        "leaveDays": "4",
        "destination": "cairo",
        "for": "Boules Hisham",
        "pendingApproval": null,
        "createdBy": "Boules Hisham",
        "createdOn": "28-Sep-2022",
        "remarks": "testingmy notes"
    }
}''') as Map<String, dynamic>;
*/
  /*for(int i=0;i<map["result"].length;i++){
    print(map["result"].keys.toList()[i].toString()+":"+map["result"][map["result"].keys.toList()[i]].toString());
  }
*/
}

class Login2<L> extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2();
}

bool first = false;

class _Login2 extends State<Login2> with TickerProviderStateMixin {
  TextEditingController textEmail = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {

    _controller.forward(from: 0);

    Timer(const Duration(seconds: 7), () {
//        _controller.forward(from: 0);
      //_controller.repeat(reverse: true);
    });

    _controller.addListener(() async {
      /*    if (_controller.isCompleted) {
        await Future.delayed(Duration(seconds: 2));
        _controller.reverse();
        first=true;
      } else if (_controller.isDismissed&&first) {
        await Future.delayed(Duration(seconds: 5));
        _controller.forward();
      }
    */
    });

    super.initState();
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  );

  late final Animation<double> _animation =
      Tween(begin: 2.0, end: 2.7).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));

  bool expanded = true;
  bool screenFade = false;
  bool imageFade = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
      appBar: null, // No action bar will build
      extendBodyBehindAppBar: true,
      body: Container(
        child: AnimatedList(
          key: _listKey,
          initialItemCount:  map["result"].length,
          itemBuilder:
              (BuildContext context, int i, Animation<double> animation) {
            return Column(
              children: [
                SlideTransition(
                  position: Tween<Offset>(
                    begin:  Offset((2.5+i), 0.0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: _controller,
                    curve: Curves.easeIn,

                  )),
                  child: ListItemWidget(
                    item:map["result"].keys.toList()[i].toString()+" : "+map["result"][map["result"].keys.toList()[i]].toString(),
                    animation:animation,
                    onClicked:(){
                      removeItem(i);
                    }


                  ),
                ),
              ],
            );
          },
        ),
      ),
      /* AnimatedCrossFade(
        crossFadeState:
            screenFade ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(seconds: 2),
        secondChild: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
        ),
        firstChild: Container(
          padding: const EdgeInsets.fromLTRB(70, 20, 70, 20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/pngegg.png"),
                  fit: BoxFit.cover)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Center(
                child: FadeTransition(
              opacity: _animation,
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    AnimatedCrossFade(
                      crossFadeState: expanded
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(seconds: 1),
                      secondChild: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: const Center(
                            child: Text(
                              "Faded",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )),
                      firstChild: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Brand",
                                style: GoogleFonts.pacifico(
                                  textStyle: TextStyle(
                                      fontSize: 61, color: Colors.white),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "EMAIL",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                          cursorColor: Colors.white,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                          decoration: const InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "PASSWORD",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          obscureText: true,
                                          cursorColor: Colors.white,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration: const InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width:
                                    MediaQuery.of(context).size.height * 0.385,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("LOGIN",
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ))),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                              ),
                              const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Row(children: [
                                Expanded(
                                    child: Container(
                                  margin: const EdgeInsets.only(right: 20.0),
                                  child: const Divider(
                                    color: Colors.white,
                                  ),
                                )),
                                const Text(
                                  "OR",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Expanded(
                                    child: Container(
                                        margin:
                                            const EdgeInsets.only(left: 20.0),
                                        child: const Divider(
                                          color: Colors.white,
                                        ))),
                              ]),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.018,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width:
                                    MediaQuery.of(context).size.height * 0.385,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0.0,
                                      backgroundColor:
                                          HexColor.fromHex('#3b5999'),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            child: const Image(
                                                image: AssetImage(
                                                    "assets/images/Facebook2.png"))),
                                        const Text("    LOG IN WITH FACEBOOK",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            )),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ),
        ),
      )*/

    ));
  }

  void removeItem(int i) {
    final removedItem = _list[i];
    _list.removeAt(i);
    _listKey.currentState!.removeItem(i, (context, animation) => ListItemWidget(
        item: removedItem, animation: animation, onClicked: (){

    }),duration: Duration(milliseconds: 800),

    );
  }
}
class ListItemWidget extends StatelessWidget{
  final String item;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  const ListItemWidget( {
    required this.item,
    required this.animation,
    required this.onClicked,
    Key? key

});
@override
  Widget build(BuildContext context)=>SizeTransition(
  key: ValueKey(item),
    sizeFactor: animation ,
    child: buildItem());

Widget buildItem()=> Container(
  margin: EdgeInsets.all(10),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Colors.white,
  ),
  child:    ListTile(
    contentPadding:const EdgeInsets.all(20),
    title: Text(item),
    trailing: IconButton(onPressed:onClicked, icon:const Icon(Icons.delete) ,),
  ),
);

}