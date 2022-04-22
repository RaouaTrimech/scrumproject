import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrainTicket extends StatelessWidget {
  String Type ;
  String Station1 ;
  String Station2 ;
  String Date ;
  String Line ;
  String TravelTime ;
  TrainTicket({Key? key, required this.Type ,
    required this.Station1 , required this.Station2 ,
    required this.Date , required this.Line ,
    required this.TravelTime }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, -1),
            end: Alignment(0, 0),
        colors: [
        Color.fromRGBO(168, 212, 239, 1),
    Color.fromRGBO(204, 235, 230, 1),

    ]
    )),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: AssetImage("assets/TrainTicket_images/rail.png"),width: 280,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    Station1,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700 ,
                        fontSize: 30
                    ),
                  ),
                ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                Station2,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700 ,
                    fontSize: 30
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0 , right: 25.0 ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:  Colors.white
            ),
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Train Ticket",
                          style: const TextStyle(
                              color: Color.fromRGBO(58,58,58, 1),
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700 ,
                              fontSize: 20
                          )),
                          Container(
                            width: 150 , height: 2,
                            color: const Color.fromRGBO(197, 229, 237, 1),
                          ),

                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),

        Container(
          margin: const EdgeInsets.only(top: 15 ,left: 25.0 , right: 25.0 ),
          height: 58,
          width: 354,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(88, 89, 91, 1),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child:  const Center(
            child: Text(
              'BUY TICKET',
              style: TextStyle(
                  color:Colors.white,
                  fontSize: 18,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold),),
          ),
        )
      ],
    ),
    );
  }
  }