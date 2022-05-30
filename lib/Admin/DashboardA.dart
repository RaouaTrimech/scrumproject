import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrumproject/Landing_Pages/StartScreen.dart';
import 'package:scrumproject/Trains/Train_Mngt/Train_List/Train_List_Ad.dart';

import '../Trains/Train_Mngt/AddTrain.dart';


class DashboardA extends StatefulWidget {
  DashboardA({ Key? key}) : super(key: key);

  @override
  _DashboardAState createState() => _DashboardAState();
}


// Toggles the password show status

@override
void dispose() {
  // Clean up the controller when the widget is disposed.
}


class _DashboardAState extends State<DashboardA> {

  @override
  void initState(){}

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
                                 Image(image:AssetImage("assets/dashboard_images/train.png"),width: 250),
                                Padding(
                                    padding: const EdgeInsets.only(top : 100.0, left: 200),
                                    child:Text(
                                      "Ready to rail \nthe roads ?",
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
                                  const Padding(
                                    padding: EdgeInsets.only(left : 8.0, right: 8.0 , top: 130),
                                    child: Image(image:AssetImage("assets/dashboard_images/background.png"),width: 350)),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => trainListAd(),
                                                ));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 15,left: 15,top: 30),
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
                                                'UPDATE /DELETE TRAIN',
                                                style: TextStyle(
                                                    color:Color.fromRGBO(76, 149, 147, 1),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => AddTrain(),
                                                ));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 15,left: 15,top: 10),
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
                                                'ADD TRAIN',
                                                style: TextStyle(
                                                    color:Color.fromRGBO(76, 149, 147, 1),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => StartScreen(),
                                                ));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 15,left: 15,top: 60),
                                            height: 40,
                                            width: 200,
                                            decoration: const BoxDecoration(
                                              color: Color.fromRGBO(168, 212, 239, 0.66),
                                              borderRadius: BorderRadius.all(Radius.circular(15.0)) ,
                                            ),
                                            child:  const Center(
                                              child: Text(
                                                'Log out',
                                                style: TextStyle(
                                                    color:Color.fromRGBO(58, 136, 195, 1),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ]
                            )],
                      ),
                      Container(margin: EdgeInsets.only(top:5), height: 63, color: Color.fromRGBO(168, 212, 239, 1),)]
                )
            )
        )
    );
  }
}
