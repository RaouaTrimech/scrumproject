import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class trainButton extends StatefulWidget {
  String TrainName;
  DateTime Departure ;
  DateTime Arrival ;
  String Type  ;

  trainButton({required this.TrainName,required this.Arrival,required this.Departure,required this.Type,Key? key}) : super(key: key);

  @override
  State<trainButton> createState() => _trainButtonState(TrainName,Departure,Arrival,Type);
}

class _trainButtonState extends State<trainButton> {
  String trainName;
  DateTime departure ;
  DateTime arrival ;
  String type  ;

  Color colorTrainName = Color.fromRGBO(76, 149, 147, 1);
  Color departureArrivalButton = Color.fromRGBO(76, 149, 147, 0.81);
  Color lineColor = Color.fromRGBO(197, 229, 237, 1);

  _trainButtonState(String this.trainName, DateTime this.departure,
      DateTime this.arrival, String this.type);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 431,
        height: 116,
        padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color:Color.fromRGBO(204,235,230, 0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trainName,
                  style: TextStyle(
                    color: Color.fromRGBO(76, 149, 147, 1),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600 ,
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: 247,
                  height: 1,
                  margin: EdgeInsets.only(top: 5,bottom: 10),
                  color: Color.fromRGBO(197, 229, 237, 1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text('${departure.hour} PM',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color:Color.fromRGBO(88,89, 91, 1),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset('DimandShapedLine.png'),
                    SizedBox(
                      width: 5,
                    ),
                    Text('${arrival.hour} PM',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color:Color.fromRGBO(88,89, 91, 1),
                      ),
                    ),

                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 56,
                        height:22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color:Color.fromRGBO(76, 149, 147, 0.81),
                        ),
                        child: Center(
                          child: Text('Départ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color:Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                      ),
                      Container(
                        width: 56,
                        height:22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color:Color.fromRGBO(76, 149, 147, 0.81),
                        ),
                        child: Center(
                          child: Text('Arrivé',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color:Colors.white,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Image.asset(
                "shortDistance.png",
                width: 100,


              ),
            ),
          ],

        ),
      ),
    );
  }
}
