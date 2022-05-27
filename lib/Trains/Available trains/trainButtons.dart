import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../Globals/global.dart' as globals ;
import '../Available trains/trainModel.dart';


Color colorTrainName = Color.fromRGBO(76, 149, 147, 1);
Color departureArrivalButton = Color.fromRGBO(76, 149, 147, 0.81);
Color lineColor = Color.fromRGBO(197, 229, 237, 1);

class trainButtons extends StatelessWidget {
  trainButtons({Key? key}) : super(key: key);

  List<trainModel> trainList = [] ;

  Future<List<trainModel>> gettrainsApi ()async{
    final response = await http.get(Uri.parse("http://"+globals.IPAddress+":8080/trainList")) ;
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      trainList.clear();
      for(Map i in data){
        trainModel t = trainModel.fromJson(i);
        t.setTrainName(i['trainName']) ;
        t.setDeparture(DateTime.parse(i['departure']));
        t.setArrival(DateTime.parse(i['arrival']));
        t.setType(i['type']);

        trainList.add(t);
      }
      return trainList ;
    }else {
      return trainList ;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: gettrainsApi(),
              builder: (context , snapshot){

                if(!snapshot.hasData){
                  return Text('Loading');
                }else {
                  return ListView.separated(
                      itemCount: trainList.length,
                      itemBuilder: (context, index){
                        return Center(
                          child: Container(
                            width: 400,
                            height: 120,
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
                                      trainList[index].TrainName.toString(),
                                      style: const TextStyle(
                                        color: Color.fromRGBO(76, 149, 147, 1),
                                        fontFamily: "Roboto-Regular",
                                        fontWeight: FontWeight.w600 ,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Container(
                                      width: 210,
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
                                        Text('${trainList[index].Departure?.hour.toString()} PM',
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
                                        const Image(image:AssetImage("assets/DimandShapedLine.png")),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('${trainList[index].Arrival?.hour.toString()} PM',
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
                                    child: const Image(image:AssetImage("assets/shortDistance.jpg"),width: 100,)
                                ),
                              ],

                            ),
                          ),
                        );

                      },
                    separatorBuilder: (BuildContext context, int index) { return const Divider( height: 10); },);
                }
              },
            ),
          )
        ],
      );
  }
}