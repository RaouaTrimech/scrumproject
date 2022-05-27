import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'Train_header.dart';

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
        color:const Color.fromRGBO(168, 212, 239, 1),
      ),
        Container(
          height:41 ,
          color:const Color.fromRGBO(168, 212, 239, 0.66),
        ),
        Container(
          height:41 ,
          color:const Color.fromRGBO(204, 235, 230, 1),
        ),
          const SizedBox(
            height: 30,
          ),
          TrainHeader(TrainName: "TrainName",Station1: "Station1",
              Station2: "Station2", Date: "04.05.22", Line: "04", TrainImage: "longDistance.png"),

        Padding(
          padding: const EdgeInsets.only(right : 25.0),
          child: FixedTimeline.tileBuilder(
                builder: TimelineTileBuilder.connectedFromStyle(
                  contentsAlign: ContentsAlign.reverse,
                  oppositeContentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Text('4.49PM ',
                          style: TextStyle(color: const Color.fromRGBO(166, 168, 172, 1),
                              fontFamily: 'Roboto', fontWeight: FontWeight.w200,
                          fontSize: 15)),
                        Text(' Station Name',
                          style: TextStyle(color: const Color.fromRGBO(166, 168, 172, 1),
                              fontFamily: 'Roboto', fontWeight: FontWeight.w700,
                              fontSize: 15),)

                      ],
                    ),
                  ),
                  contentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(76, 149, 147, 0.81),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      margin: EdgeInsets.all(10) ,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Content',style: TextStyle(color: Colors.white ,
                            fontFamily: 'Roboto', fontWeight: FontWeight.w500,
                            fontSize: 15),),
                      ),
                    ),
                  ),
                  connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
                  indicatorStyleBuilder: (context, index) => IndicatorStyle.outlined,
                  itemCount: 3,
                ),
              ),
        )
        ]
    )),
           Container(
            height:41 ,
            color:const Color.fromRGBO(168, 212, 239, 0.66),
          )]));
  }
}


