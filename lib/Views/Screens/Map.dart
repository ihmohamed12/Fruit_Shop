import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//final Completer<GoogleMapController> _controller = Completer();

const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
const LatLng destination = LatLng(37.33429383, -122.06600055);

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _Maps();
}

class _Maps extends State<Maps> {
 /* Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
         // GoogleMap(initialCameraPosition:CameraPosition(target: sourceLocation) ),
          Container(
            padding:const EdgeInsets.fromLTRB(25, 40, 25, 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.height * 0.015,
                              10,
                              MediaQuery.of(context).size.height * 0.1,
                              10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(Icons.location_pin, color: Colors.red),
                              Text(
                                "  143 love road, California",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding:const EdgeInsets.all(5),
                          child:const Icon(
                            Icons.location_searching,
                            color: Colors.red,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              margin:const EdgeInsets.all(30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding:const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.09,
                            child: const Image(
                                image: AssetImage("assets/images/Name.PNG"))),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "  John Smith",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                              Text("  ID - 46BH4HK",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(0.6))),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                              Text("  Food courier",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(0.6))),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(180),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withAlpha(70),
                                blurRadius: 12.0,
                                spreadRadius: 0.0,
                                offset: const Offset(
                                  0.0,
                                  5.0,
                                ),
                              ),
                            ]),
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side:const BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            child: Container(
                                padding: const EdgeInsets.all(12),
                                child: const Icon(
                                  Icons.phone,
                                  size: 30,
                                  color: Colors.red,
                                ))))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }*/
}
