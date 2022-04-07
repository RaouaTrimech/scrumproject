import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import 'ButtomNavbar.dart';
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
              Station2: "Station2", Date: "04.05.22", Line: "04", TrainImage: "long_distance.png"),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FixedTimeline.tileBuilder(
              builder: TimelineTileBuilder.connectedFromStyle(
                contentsAlign: ContentsAlign.alternating,
                oppositeContentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('opposite\ncontents'),
                ),
                contentsBuilder: (context, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Contents'),
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
          const ButtomNavbar()]));
  }
}


