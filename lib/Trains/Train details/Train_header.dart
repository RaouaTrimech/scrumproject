import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:scrumproject/services/payment.dart';
import '../../Globals/Popup.dart';
import '../../Globals/global.dart';
import '../../TicketPages/pdf_api.dart';
import '../Available trains/trainModel.dart';
import '../../../Globals/global.dart' as globals ;

import 'package:http/http.dart' as http;
class TrainHeader extends StatefulWidget {

  TrainHeader({Key? key, required this.train}) : super(key: key);
  final trainModel train ;
  @override
  State<TrainHeader> createState() => _TrainHeaderState();
//calculate price  ==> to go back to
}

class _TrainHeaderState extends State<TrainHeader>{
  late trainModel _train ;
  String Station1 = "";
  String Station2 = "";
  //ecrire la fonction get price
  late String _price  ;
  late bool _successAchieved;
  @override
  void initState() {
    super.initState();
    _train = widget.train ;
    getStationName();
    StripeServices.init();
  }

  getStationName() {
    if (_train.Type == "Long") {
      Station1 = globals.LongDist.elementAt(_train.DepStat!);
      Station2 = globals.LongDist.elementAt(_train.ArrStat!);}
    else {if (_train.Type == "BSahel") {
      Station1 = globals.SahelBDist.elementAt(_train.DepStat!);
      Station2 = globals.SahelBDist.elementAt(_train.ArrStat!);}
    else {
      Station1 = globals.TunisBDist.elementAt(_train.DepStat!);
      Station2 = globals.TunisBDist.elementAt(_train.ArrStat!);
    }}
  }


  //getTrainInfo:
  String getTrainInfos(){
    if(_train.Type == 'Long') {
      return 'TrainName: ${_train.TrainName} \n TrainType: ${_train
          .Type} \n DepartureTime: ${_train
          .Departure} \n From: ${LongDist[_train
          .DepStat!]} \n To: ${LongDist[_train.ArrStat!]} \n Price: ${_price}';
    }else if(_train.Type == 'BTunis'){
      return 'TrainName: ${_train.TrainName} \n TrainType: ${_train
          .Type} \n DepartureTime: ${_train
          .Departure} \n From: ${TunisBDist[_train
          .DepStat!]} \n To: ${TunisBDist[_train.ArrStat!]} \n Price: ${_price}';
    }else if (_train.Type == 'BSahel'){
      return 'TrainName: ${_train.TrainName} \n TrainType: ${_train
          .Type} \n DepartureTime: ${_train
          .Departure} \n From: ${SahelBDist[_train
          .DepStat!]} \n To: ${SahelBDist[_train.ArrStat!]} \n Price: ${_price}';
    }
    return 'resultat inconsistant';
  }

  //createPDf
  CreatePDF() async {
    final pdfFile = await PdfApi.generateCenteredText(_train , int.parse(_price));
    PdfApi.openFile(pdfFile);

  }

  //send payment
  payNow() async {
    //the amount must be transformed to cents
    _price=getPrice();
    var response =
    await StripeServices.payNowHandler(amount: getPrice(), currency: 'USD');
    print('response message :::::::::: ${response.success}');
    _successAchieved = response.success ;
    if(_successAchieved ){
      /*send ticket to email function */

      String message = getTrainInfos();
      print('----------- $CurrentUserEmail --------------------');
      sendEmail(email: CurrentUserEmail,subject: 'TrainTicket',message: message);
      showDialog(
          context: context,
          builder: (context) => PopUpSuccess(title: "Ticket booked", subtitle: "Your ticket has been sent to your email"));
    }

  }
  //calculate price ==> to work on later par defaut on a mis la valeur a 1000 centimes
  String getPrice(){
    int dist = _train.DepStat! - _train.ArrStat! ;
    if(_train.Type == 'Long') {
      if (dist.abs() <= 7) {
        return '12000';
      }else if (dist.abs() <= 14){
        return '15000';
      }else{
        return '17000';
      }
    }else if(_train.Type == 'BTunis'){
      if (dist.abs() <= 4) {
        return '2000';
      }else if (dist.abs() <= 8){
        return '3000';
      }else{
        return '3500';
      }
    }else if (_train.Type == 'BSahel'){
      if (dist.abs() <= 7) {
        return '2000';
      }else if (dist.abs() <= 14){
        return '3000';
      }else{
        return '3500';
      }
    }
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
              child : Image (image: AssetImage("assets/Train_Type/"+_train.Type!+".jpg"),
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
                    _train.TrainName!,
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
                          Station1 ,
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
                          Station2,
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
                                  DateFormat('dd.MM.yy').format(_train.Departure!),
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
                                  '0'+_train.Line.toString(),
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
                        //CreatePDF();
                        /*create train ticket function */
                        payNow();

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

  Future sendEmail({
    required String email,
    required String subject,
    required String message,
  }) async {
    //account emailJS password :exbj{;>6X9
    final serviceId = 'service_l6lxhve';
    final templateId = 'template_cv3sb7n';
    final userId = 'oeDmL6vfgKFeyAy9a';

    //send post request to the EmailJs API
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id' : serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_email':email,
            'user_subject':subject,
            'user_message':message,
          }
        }));

    if(response.statusCode == 200){
      showDialog(
          context: context,
          builder: (context) => PopUpSuccess(title: "Ticket booked", subtitle: "Your ticket has been sent to your email"));

    }

  }

}
