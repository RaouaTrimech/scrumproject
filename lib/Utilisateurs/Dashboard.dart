import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DatePickerSearch.dart';


class Dashboard extends StatefulWidget {
  Dashboard({ Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

final departureController = TextEditingController();
final arrivalController = TextEditingController();

// Toggles the password show status

@override
void dispose() {
  // Clean up the controller when the widget is disposed.
  departureController.dispose();
  arrivalController.dispose();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
           child: Column(
        children: [
          Column(
      mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
        height:41 ,
        color:Color.fromRGBO(168, 212, 239, 1),
      ),
      Container(
        height:41 ,
        color:Color.fromRGBO(168, 212, 239, 0.66),
      ),
      Container(
        height:41 ,
        color:Color.fromRGBO(204, 235, 230, 1),
      ),
      SizedBox(
        height: 25,
      ),
        Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Padding(
              padding: const EdgeInsets.only(top : 25.0, left: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Welcome back !",
                    style: TextStyle(
                      fontFamily: "Prata" ,
                      color: Color.fromRGBO(88, 89, 91, 1),
                      fontSize: 28,
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 220,
                    color: Color.fromRGBO(168, 212, 239, 0.66)
                  )
                ]
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color:Color.fromRGBO(177,218,251, 0.3),
              ),
            ),
            const Image(image:AssetImage("assets/dashboard_images/train.png"),width: 250),
            Padding(
              padding: const EdgeInsets.only(top : 100.0, left: 195),
              child:Text(
              "Where do you want to go ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Roboto" ,
                color: Color.fromRGBO(88, 89, 91, 1),
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),
            ))
          ],
        ),
        Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(left : 8.0, right: 8.0 , top: 130),
                child: Image(image:AssetImage("assets/dashboard_images/background.png"),width: 350),
              ),
              GestureDetector(
                onTap: () {
                    //TODO : Search
                  },
                child: Container(
                  margin: EdgeInsets.only(right: 15,left: 15,top: 200),
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(168, 212, 239, 1),
                          Color.fromRGBO(204, 235, 230, 1),

                        ]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)) ,
                  ),
                  child:  Center(
                    child: Text(
                      'SEARCH',
                      style: TextStyle(
                          color:Color.fromRGBO(76, 149, 147, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15,top: 15),
                height: 160,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color:Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 2,
                      offset: Offset.fromDirection(0,0)
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                const Padding(
                                  padding:  EdgeInsets.only( bottom: 8.0),
                                  child:  Text(
                                      "DEPARTURE CITY",
                                      style: TextStyle(
                                          color: Color.fromRGBO(58, 136, 195, 1),
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w700 ,
                                          fontSize: 10
                                      )),
                                ),
                                Container(
                                  width: 120,
                                  height: 30,
                                  child: TextField(
                                    controller: departureController,
                                    decoration: InputDecoration(border: OutlineInputBorder())
                                  ),
                                )
                              ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                const Padding(
                                  padding:  EdgeInsets.only( bottom: 8.0),
                                  child:  Text(
                                      "ARRIVAL CITY",
                                      style: TextStyle(
                                          color: Color.fromRGBO(58, 136, 195, 1),
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w700 ,
                                          fontSize: 10
                                      )),
                                ),
                                Container(
                                  width: 120,
                                  height: 30,
                                  child: TextField(
                                      controller: arrivalController,
                                      decoration: InputDecoration(border: OutlineInputBorder())
                                  ),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                const Padding(
                                  padding:  EdgeInsets.only(bottom: 8.0),
                                  child:  Text(
                                      "DATE",
                                      style: TextStyle(
                                          color: Color.fromRGBO(58, 136, 195, 1),
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w700 ,
                                          fontSize: 10
                                      )),
                                ),
                                SizedBox(
                                  height: 30,
                                    width: 123,
                                    child: DatePickerSearch())
                              ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                const Padding(
                                  padding:  EdgeInsets.only( bottom: 8.0),
                                  child:  Text(
                                      "TYPE",
                                      style: TextStyle(
                                          color: Color.fromRGBO(58, 136, 195, 1),
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w700 ,
                                          fontSize: 10
                                      )),
                                ),
                                Container(
                                  width: 120,
                                  height: 30,
                                  child: TextField(
                                      controller: departureController,
                                      decoration: InputDecoration(border: OutlineInputBorder())
                                  ),
                                )
                              ]
                          ),
                        )
                      ],
                    )
                  ],
                )
                ),
              ]
        )]
      )]
    )
                )
      )
    );
  }
}
