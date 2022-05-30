import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrumproject/Trains/Available%20trains/trainModel.dart';
import 'package:timelines/timelines.dart';
import 'Train_header.dart';
import '../../../Globals/global.dart' as globals ;

class trainDetails extends StatefulWidget {
  const trainDetails({Key? key, required this.train}) : super(key: key);
  final trainModel train ;
  @override
  State<trainDetails> createState() => _trainDetailsState();
}

class _trainDetailsState extends State<trainDetails> {

  late trainModel _train ;
  late List<String> InterStations = [];
  late double height = 0 ;

  @override
  void initState() {
    super.initState();
    _train = widget.train ;
    getInterStations();
  }

  getInterStations() {
    List<String> Stations = [] ;
    switch(_train.Type) {
      case "Long" : Stations = globals.LongDist ; break ;
      case "BSahel" : Stations = globals.SahelBDist ; break ;
      case "BTunis" : Stations = globals.TunisBDist ; break ;
    }
    if (_train.DepStat! < _train.ArrStat!) {
      for (int i = _train.DepStat! ; i <= _train.ArrStat! ; i++){
        InterStations.add(Stations.elementAt(i));
      }
    } else {
      for (int i = _train.DepStat! ; i >= _train.ArrStat! ; i--){
        InterStations.add(Stations.elementAt(i));
      }
    }
    if (InterStations.length-2 <= 4.0) {
      height = 190 ;
    } else {
      height = 300 ;
    }
  }

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
          GestureDetector(
              onTap: () {
                Navigator.pop(context,true);
              },
              child:Container(
          height: 41 ,
          width: 500,
          color:const Color.fromRGBO(204, 235, 230, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.arrow_back,
                    color: const Color.fromRGBO(76, 149, 147, 0.81) , size : 25),
              ),
              Center(
                child: Text('BACK',style: TextStyle(color: Color.fromRGBO(76, 149, 147, 0.81) ,
            fontFamily: 'Roboto', fontWeight: FontWeight.bold,
            fontSize: 18),
                ),
              )],
          ),
        )),
           SizedBox(
            height: 30,
          ),
          TrainHeader(train: _train),
         Stack(
           alignment: AlignmentDirectional.topCenter,
           children : [
             Padding(
               padding: const EdgeInsets.only(top : 115.0,left: 110),
               child: const ClipRRect( child : Image (image: AssetImage("assets/Train_details/LogoBackground.png"))),
             ),
             Container(
               height: height ,
               child: Padding(
                   padding: const EdgeInsets.only(right : 20.0),
                   child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisSize : MainAxisSize.min ,
                       children : [
                         TimelineTile(
                           contents: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child:  Text( InterStations.elementAt(0),
                               style: TextStyle(color: const Color.fromRGBO(88, 89, 91, 1),
                                   fontFamily: 'Roboto', fontWeight: FontWeight.w700,
                                   fontSize: 20),),
                           ),
                           oppositeContents: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Container(
                               decoration: const BoxDecoration(
                                   color:  Color.fromRGBO(76, 149, 147, 0.81),
                                   borderRadius: BorderRadius.all(Radius.circular(20))),
                               margin: const EdgeInsets.all(10) ,
                               child: const Padding(
                                 padding:  EdgeInsets.all(8.0),
                                 child: Text('Departure',style: TextStyle(color: Colors.white ,
                                     fontFamily: 'Roboto', fontWeight: FontWeight.w500,
                                     fontSize: 15),),
                               ),
                             ),
                           ),
                           node: TimelineNode(
                               indicator: DotIndicator(color: Color.fromRGBO(88, 89, 91, 1)),
                               endConnector: SolidLineConnector(color: Color.fromRGBO(88, 89, 91, 1))
                           ),
                         ),
                         Flexible(
                             fit : FlexFit.loose,
                             child: ListView.builder(
                                 controller : ScrollController(initialScrollOffset: 42),
                                 shrinkWrap: true,
                                 itemCount: InterStations.length-2,
                                 itemBuilder: (context, index){
                                   return TimelineTile(
                                     contents: Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child:  Text( InterStations.elementAt(index+1),
                                         style: TextStyle(color: const Color.fromRGBO(88, 89, 91, 1),
                                             fontFamily: 'Roboto', fontWeight: FontWeight.normal,
                                             fontSize: 10),),
                                     ),
                                     node: TimelineNode(
                                       startConnector: SolidLineConnector(color: Color.fromRGBO(88, 89, 91, 1)),
                                       indicator: OutlinedDotIndicator(color: Color.fromRGBO(88, 89, 91, 1)),
                                       endConnector: SolidLineConnector(color: Color.fromRGBO(88, 89, 91, 1)),
                                     ),
                                   );})),
                         TimelineTile(
                           contents: Padding(
                             padding: const EdgeInsets.only(bottom : 8.0, left: 8,right: 8),
                             child:  Text( InterStations.elementAt(InterStations.length-1),
                               style: TextStyle(color: const Color.fromRGBO(88, 89, 91, 1),
                                   fontFamily: 'Roboto', fontWeight: FontWeight.w700,
                                   fontSize: 20),),
                           ),
                           oppositeContents: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Container(
                               decoration: const BoxDecoration(
                                   color:  Color.fromRGBO(76, 149, 147, 0.81),
                                   borderRadius: BorderRadius.all(Radius.circular(20))),
                               margin: const EdgeInsets.all(10) ,
                               child: const Padding(
                                 padding:  EdgeInsets.all(8.0),
                                 child: Text('Arrival',style: TextStyle(color: Colors.white ,
                                     fontFamily: 'Roboto', fontWeight: FontWeight.w500,
                                     fontSize: 15),),
                               ),
                             ),
                           ),
                           node: TimelineNode(
                               indicator: DotIndicator(color: Color.fromRGBO(88, 89, 91, 1)),
                               startConnector: SolidLineConnector(color: Color.fromRGBO(88, 89, 91, 1))
                           ),
                         ),
                       ]
                   )),
             ),
             Container(
               margin: const EdgeInsets.only(top : 402),
               height:41 ,
               color:const Color.fromRGBO(168, 212, 239, 0.66))
           ]
         )
        ]
    )),]));
  }
}