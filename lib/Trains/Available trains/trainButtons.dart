import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../Globals/global.dart' as globals ;
import '../Available trains/trainModel.dart';
import '../Train details/Train_details.dart';


Color colorTrainName = Color.fromRGBO(76, 149, 147, 1);
Color departureArrivalButton = Color.fromRGBO(76, 149, 147, 0.81);
Color lineColor = Color.fromRGBO(197, 229, 237, 1);

class trainButtons extends StatelessWidget {
  trainButtons({Key? key, required this.filter}) : super(key: key);
  final String filter ; 

  List<trainModel> trainList = [] ;

  Future<List<trainModel>> gettrainsApi ()async{
    String uri ;
    if (filter != "") { uri = "filter?type="+filter; }
    else {uri = "trainList";} ;
    final response = await http.get(Uri.parse("http://"+globals.IPAddress+":8080/"+uri)) ;
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      trainList.clear();
      for(Map i in data){
        trainModel t = trainModel.fromJson(i);
        t.setTrainName(i['trainName']) ;
        t.setDeparture(DateTime.parse(i['departure']).add(const Duration(hours: 1)));
        t.setArrival(DateTime.parse(i['arrival']).add(const Duration(hours: 1)));
        t.setType(i['type']);
        t.setLine(i['line']);
        t.setArrStat(i['stationArr']);
        t.setDepStat(i['stationDep']);

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
                  return Text('Loading ...');
                }else {
                  return ListView.separated(
                      itemCount: trainList.length,
                      itemBuilder: (context, index){
                        return
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => trainDetails(train: trainList[index]),
                                  ));
                           },
                            child: Center(
                               child: Container(
                            width: 400,
                            height: 120,
                            padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color:Color.fromRGBO(204,235,230, 0.3),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                        Text( DateFormat('hh:mm a').format(trainList[index].Departure!).toString(),
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
                                        Padding(
                                          padding: const EdgeInsets.only(left : 3.0),
                                          child: const Image(image:AssetImage("assets/DimandShapedLine.png")),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(DateFormat('hh:mm a').format(trainList[index].Arrival!).toString(),
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
                                          Container(
                                            width: 70,
                                            height:22,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(12)),
                                              color:Color.fromRGBO(76, 149, 147, 0.81),
                                            ),
                                            child: Center(
                                              child: Text('Departure',
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
                                            width: 82,
                                          ),
                                          Container(
                                            width: 56,
                                            height:22,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(12)),
                                              color:Color.fromRGBO(76, 149, 147, 0.81),
                                            ),
                                            child: Center(
                                              child: Text('Arrival',
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
                                    child:
                                     Image(image:AssetImage("assets/Train_Type/"+trainList[index].Type!+".jpg"),width: 100,)
                                ),
                              ],

                            ),
                          )));
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