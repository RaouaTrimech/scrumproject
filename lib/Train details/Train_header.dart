import 'package:flutter/material.dart';
import 'package:scrumproject/services/payment.dart';

import '../Train_Ticket/ConfirmTicketPopUp.dart';

class TrainHeader extends StatefulWidget {
  String TrainName;
  String Station1;
  String Station2;
  String Date;
  String Line;
  String TrainImage;

  TrainHeader({Key? key, required this.TrainName,
    required this.Station1, required this.Station2,
    required this.Date, required this.Line,
    required this.TrainImage }) : super(key: key);

  @override
  State<TrainHeader> createState() => _TrainHeaderState();
//calculate price  ==> to go back to
}

class _TrainHeaderState extends State<TrainHeader>{
  late String _TrainName;
  late String _Station1;
  late String _Station2;
  late String _Date;
  late String _Line;
  late String _TrainImage;
  late double _price ;
  late Future<bool> _successAchieved;
  @override
  void initState() {
    super.initState();
     _TrainName= widget.TrainName;
     _Station1= widget.Station1;
     _Station2= widget.Station2;
     _Date= widget.Date;
     _Line=widget.Line;
     _TrainImage=widget.TrainImage;

     StripeServices.init();
  }
  //send payment
  Future<bool> payNow() async {
    //the amount must be transformed to cents
    var response =
    await StripeServices.payNowHandler(amount: getPrice(), currency: 'USD');
    print('response message ${response.message}');
    return response.success;
  }
  //calculate price ==> to work on later par defaut on a mis la valeur a 1000 centimes
  String getPrice(){
    return '1000';
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height : 160 ,
      color: const Color.fromRGBO(240, 249, 247, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin : const EdgeInsets.all(11),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              //TrainImage
              child : Image (image: AssetImage("assets/longDistance.jpg"),
                  width: 130 ,
                  height: 110
              ),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                Container(
                  margin : const EdgeInsets.only(top : 13, bottom: 5),
                  child: Text(
                    _TrainName,
                    style: const TextStyle(
                        color: Color.fromRGBO(76, 149, 147, 1),
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600 ,
                        fontSize: 20
                    ),
                  ),
                ),
                Container(
                  width: 200 , height: 2,
                  color: const Color.fromRGBO(197, 229, 237, 1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          _Station1 ,
                          style: const TextStyle(
                              color: Color.fromRGBO(88, 89, 91, 1),
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400 ,
                              fontSize: 15
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.black,
                          size: 15.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          _Station2,
                          style: const TextStyle(
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
                            children : [
                              const Padding(
                                padding: EdgeInsets.only(right : 8),
                                child: Icon(
                                    Icons.calendar_today_rounded,
                                    color: Color.fromRGBO(88, 89, 91, 1),
                                    size: 20
                                ),
                              ),
                              Text(
                                  _Date,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(88, 89, 91, 1),
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400 ,
                                    fontSize: 15,
                                  )),
                            ]
                        ),
                        Container(
                          margin: const EdgeInsets.all(4),
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
                            children : [
                              const Padding(
                                padding: EdgeInsets.only(right : 8),
                                child: Icon(
                                    Icons.tram,
                                    color: Color.fromRGBO(88, 89, 91, 1),
                                    size: 20
                                ),
                              ),
                              Text(
                                  _Line,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(88, 89, 91, 1),
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400 ,
                                    fontSize: 15,
                                  )),
                            ]
                        ),
                        Container(
                          margin: const EdgeInsets.all(4),
                          width: 90 , height: 1,
                          color: Colors.black,
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 32.44,
                  width: 198,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(168, 212, 239, 1),
                          Color.fromRGBO(204, 235, 230, 1),

                        ]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.39)) ,
                  ),
                  child:  Center(
                    child: GestureDetector(
                      onTap:(){
                        /*create train ticket function */
                        _successAchieved =payNow();
                        if(_successAchieved == true){
                          /*send ticket to email function */
                        showDialog(
                            context: context,
                            builder: (context) => confirmTicketPopUp());
                      }
                        },
                      child: Text(
                        'BOOK YOUR TICKET',
                        style: TextStyle(
                            color:Color.fromRGBO(76, 149, 147, 1),
                            fontSize: 13.11,
                            fontWeight: FontWeight.bold),),
                    ),
                  ),

                )
              ]
          )
        ],
      ),
    );
  }

}
