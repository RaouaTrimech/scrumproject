import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
  Widget Info(String infoName , String infoValue) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only( bottom: 8.0),
              child: Text(
                  infoName,
                  style: const TextStyle(
                      color: Color.fromRGBO(58, 136, 195, 1),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w700 ,
                      fontSize: 10
                  )),
            ),
            Text(
                infoValue,
                style: const TextStyle(
                    color: Color.fromRGBO(58,58,58, 1),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500 ,
                    fontSize: 12
                ))
          ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
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
                                margin: EdgeInsets.only(top: 5),
                                width: 120 , height: 2,
                                color: const Color.fromRGBO(197, 229, 237, 1),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10.0, left: 15.0 , right: 15.0),
                                child: Image(
                                  image: AssetImage("assets/TrainTicket_images/icon-train-ticket.png"),
                                width: 50,),
                              )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top : 20.0 , left: 20.0 , right: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only( bottom: 8.0),
                              child: Text(
                                "TYPE",
                              style: const TextStyle(
                                  color: Color.fromRGBO(163,163,163, 1),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700 ,
                                  fontSize: 10
                              )),
                            ),
                            Text(
                                "GRANDES LIGNES",
                                style: const TextStyle(
                                    color: Color.fromRGBO(58,58,58, 1),
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w500 ,
                                    fontSize: 12
                                )),

                            Padding(
                              padding: const EdgeInsets.only(top : 20.0, bottom: 8.0),
                              child: Text(
                                  "CLASS",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(163,163,163, 1),
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w700 ,
                                      fontSize: 10
                                  )),
                            ),
                            Text(
                                "1",
                                style: const TextStyle(
                                    color: Color.fromRGBO(58,58,58, 1),
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w500 ,
                                    fontSize: 12
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                 /* Divider */
                 Center(
                   child: Container(
                     width: 280 , height: 1,
                     color: const Color.fromRGBO(234, 234, 234, 1),
                   ),
                 ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       Info("LINE","5/22/71 DC"),
                        Info("DATE",Date),
                        Info("TIME",TravelTime)
                        ]
                  ),
                  Center(
                    child: Container(
                      width: 280 , height: 1,
                      color: const Color.fromRGBO(234, 234, 234, 1),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Info("SEAT","A1-05"),
                        Info("PRICE","13,000 DT")
                      ]
                  ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child:DottedLine(
                    direction: Axis.horizontal,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: Color.fromRGBO(76, 149, 147, 0.73),
                    dashRadius: 0.0,
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 0.0,
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: QrImage(
                        data: 'This is a simple QR code', //TODO : Generate QR Code from Data
                        version: QrVersions.auto,
                        size: 160,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          /* Button */
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
                    fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
      ),
    );
  }
  }