import 'package:flutter/material.dart';

import 'ButtomNavbar.dart';



class trainDetails extends StatefulWidget {
  const trainDetails({Key? key}) : super(key: key);

  @override
  State<trainDetails> createState() => _trainDetailsState();
}

class _trainDetailsState extends State<trainDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
      Expanded(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
            height: 45,
          ),
          Container(
            height : 170 ,
            color: Color.fromRGBO(240, 249, 247, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin : EdgeInsets.all(13.15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13.15),
                    child: Image.asset("long_distance.png", width: 155 , height: 138.15),
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Container(
                        margin : EdgeInsets.only(top : 13, bottom: 5),
                        child: Text(
                          "Train Name",
                          style: TextStyle(
                            color: Color.fromRGBO(76, 149, 147, 1),
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w600 ,
                            fontSize: 20
                          ),
                        ),
                      ),
                      Container(
                        width: 300 , height: 2,
                        color: Color.fromRGBO(197, 229, 237, 1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Station 1",
                              style: TextStyle(
                                  color: Color.fromRGBO(88, 89, 91, 1),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400 ,
                                  fontSize: 15
                              )),
                          ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.black,
                                size: 15.0),
                            ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                            "Station 1",
                            style: TextStyle(
                            color: Color.fromRGBO(88, 89, 91, 1),
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400 ,
                            fontSize: 15
                            )),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                  children : const [
                                  Padding(
                                    padding: EdgeInsets.only(right : 8),
                                    child: Icon(
                                      Icons.calendar_today_rounded,
                                      color: Color.fromRGBO(88, 89, 91, 1),
                                      size: 20
                                    ),
                                  ),
                                  Text(
                                      "04.05.22",
                                      style: TextStyle(
                                          color: Color.fromRGBO(88, 89, 91, 1),
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w400 ,
                                          fontSize: 15,
                                      )),
                                ]
                              ),
                              Container(
                                margin: EdgeInsets.all(4),
                                width: 90 , height: 1,
                                color: Colors.black,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children : const [
                                    Padding(
                                      padding: EdgeInsets.only(right : 8),
                                      child: Icon(
                                          Icons.tram,
                                          color: Color.fromRGBO(88, 89, 91, 1),
                                          size: 20
                                      ),
                                    ),
                                    Text(
                                        "04",
                                        style: TextStyle(
                                          color: Color.fromRGBO(88, 89, 91, 1),
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w400 ,
                                          fontSize: 15,
                                        )),
                                  ]
                              ),
                              Container(
                                margin: EdgeInsets.all(4),
                                width: 90 , height: 1,
                                color: Colors.black,
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 32.44,
                        width: 198,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(168, 212, 239, 1),
                                Color.fromRGBO(204, 235, 230, 1),

                              ]
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.39)) ,
                        ),
                        child:  Center(
                          child: Text(
                            'BOOK YOUR TICKET',
                            style: TextStyle(
                                color:Color.fromRGBO(76, 149, 147, 1),
                                fontSize: 13.11,
                                fontWeight: FontWeight.bold),),
                        ),
                      )
                    ]
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(),
          )
        ]
    )),
          const ButtomNavbar()]));
  }
}


