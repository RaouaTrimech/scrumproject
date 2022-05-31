import 'dart:ui';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrumproject/Utilisateurs/Entities/SearchArg.dart';
import 'package:scrumproject/Utilisateurs/Entities/utilisateur.dart';
import '../../../Globals/global.dart' as globals ;
import '../../Globals/PopupFail.dart';
import '../../Trains/Train details/Navigation.dart';

class Dashboard extends StatefulWidget {
  Dashboard({ Key? key, required this.user}) : super(key: key);
  final Utilisateur user ;

  @override
  _DashboardState createState() => _DashboardState();
}
String TypeValue = 'Long Distance';
List<String> StationsList = globals.LongDist ;
String Station1Value = StationsList.first ;
String Station2Value = StationsList.last ;

// Toggles the password show status

@override
void dispose() {
  // Clean up the controller when the widget is disposed.
}


class _DashboardState extends State<Dashboard> {
  late Utilisateur _user ;
  late SearchArg searchArg ;
  late int entry ;
  final TextEditingController _dateController = TextEditingController(text: DateFormat('yyyy-MM-dd').format(DateTime.now()));

  Widget? BasicDateField()  {
    final format = DateFormat("yyyy-MM-dd");
      return Scaffold(
        body : DateTimeField(
          controller: _dateController,
          onChanged: (value) {
          },
          style: TextStyle(
            fontSize: 14.2,
            color: Color.fromRGBO(88, 89, 91, 1),
          ),
          resetIcon: Icon(Icons.restore, size: 20,),
          initialValue: DateTime.now(),
          textAlign : TextAlign.end,
          format: format,
          onShowPicker: (context, currentValue) {
            return showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(const Duration(days: 0)),
              lastDate: DateTime(2100),);
          },
        ),
      );
  }

  @override
  void initState(){
    _user= widget.user;
    searchArg = SearchArg("", 0, 0,"");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
           child: Column(
        children: [
              Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
            height:41 ,
            color:Color.fromRGBO(168, 212, 239, 1),
          ),
          Container(
            height:41 ,
            color:Color.fromRGBO(168, 212, 239, 0.66),
          ),
          Container(
            height:41 ,
            color:Color.fromRGBO(204, 235, 230, 1),
          ),
          SizedBox(
            height: 25,
          ),
            Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Padding(
              padding: const EdgeInsets.only(top : 25.0, left: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Welcome back !",
                    style: TextStyle(
                      fontFamily: "Prata" ,
                      color: Color.fromRGBO(88, 89, 91, 1),
                      fontSize: 28,
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 220,
                    color: Color.fromRGBO(168, 212, 239, 0.66)
                  )
                ]
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color:Color.fromRGBO(177,218,251, 0.3),
              ),
            ),
            const Image(image:AssetImage("assets/dashboard_images/train.png"),width: 250),
            Padding(
              padding: const EdgeInsets.only(top : 100.0, left: 195),
              child:Text(
              "Where do you want to go ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Roboto" ,
                color: Color.fromRGBO(88, 89, 91, 1),
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),
            ))
          ],
        ),
        Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(left : 8.0, right: 8.0 , top: 130),
                child: Image(image:AssetImage("assets/dashboard_images/background.png"),width: 350),
              ),
              GestureDetector(
                onTap: () {
                    //TODO
                  if (Station1Value == Station2Value) {
                        showDialog(
                            context: context,
                            builder: (context) => PopUpFail(title: "Search Fail", subtitle: "The departement station is the same as the arrival one"));
                      } else {
                  switch(TypeValue){
                    case "Long Distance" : searchArg.Type = "Long" ; break ;
                    case "Bonlieue Tunis" : searchArg.Type = "BTunis" ; break ;
                    case "Bonlieue Sahel" : searchArg.Type = "BSahel" ; break ;
                  }
                    searchArg.DepStat = StationsList.indexOf(Station1Value) ;
                    searchArg.ArrStat = StationsList.indexOf(Station2Value);
                    searchArg.Date = _dateController.text;
                    globals.refresh = 0 ;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Navigation(title: "navigation", user : _user , selectedPos: 1,searchArg: searchArg),
                      ));
                  }},
                child: Container(
                  margin: EdgeInsets.only(right: 15,left: 15,top: 200),
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(168, 212, 239, 1),
                          Color.fromRGBO(204, 235, 230, 1),

                        ]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)) ,
                  ),
                  child:  Center(
                    child: Text(
                      'SEARCH',
                      style: TextStyle(
                          color:Color.fromRGBO(76, 149, 147, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15,top: 15),
                height: 160,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color:Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 2,
                      offset: Offset.fromDirection(0,0)
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 30.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                               Text(
                                      "DEPARTURE STATION",
                                      style: TextStyle(
                                          color: Color.fromRGBO(58, 136, 195, 1),
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w700 ,
                                          fontSize: 10
                                      )),
                                DropdownButton<String>(
                                  value: Station1Value,
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
                                  elevation: 10,
                                  style: const TextStyle(color: Color.fromRGBO(88, 89, 91, 1)),
                                  underline: Container(
                                    height: 2,
                                    color: Color.fromRGBO(76, 149, 147, 1),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      Station1Value = newValue!;
                                    });
                                  },
                                  items: StationsList
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                               Text(
                                      "ARRIVAL STATION",
                                      style: TextStyle(
                                          color: Color.fromRGBO(58, 136, 195, 1),
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w700 ,
                                          fontSize: 10
                                      )),
                                DropdownButton<String>(
                                  value: Station2Value,
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
                                  elevation: 10,
                                  style: const TextStyle(color: Color.fromRGBO(88, 89, 91, 1)),
                                  underline: Container(
                                    height: 2,
                                    color: Color.fromRGBO(76, 149, 147, 1),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      Station2Value = newValue!;
                                    });
                                  },
                                  items: StationsList
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ]
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                const Padding(
                                  padding:  EdgeInsets.only(bottom: 8.0),
                                  child:  Text(
                                      "DATE",
                                      style: TextStyle(
                                          color: Color.fromRGBO(58, 136, 195, 1),
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w700 ,
                                          fontSize: 10
                                      )),
                                ),
                                SizedBox(
                                  height: 30,
                                    width: 123,
                                    child: BasicDateField())
                              ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                  Text(
                                      "TYPE",
                                      style: TextStyle(
                                          color: Color.fromRGBO(58, 136, 195, 1),
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w700 ,
                                          fontSize: 10
                                      )),
                                DropdownButton<String>(
                                  value: TypeValue,
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
                                  elevation: 10,
                                  style: const TextStyle(color: Color.fromRGBO(88, 89, 91, 1)),
                                  underline: Container(
                                    height: 2,
                                    color: Color.fromRGBO(76, 149, 147, 1),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      TypeValue = newValue!;
                                      switch (newValue){
                                        case "Long Distance" : {StationsList = globals.LongDist ; break ;}
                                        case "Bonlieue Tunis" : StationsList = globals.TunisBDist ; break ;
                                        case "Bonlieue Sahel" : StationsList = globals.SahelBDist ; break ;
                                      };
                                      Station1Value = StationsList.first;
                                      Station2Value = StationsList.last;
                                    });
                                  },
                                  items: <String>['Long Distance', 'Bonlieue Tunis', 'Bonlieue Sahel']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ]
                          ),
                        )
                      ],
                    )
                  ],
                )
                ),
              ]
        )]
      )]
    )
                )
      )
    );
  }
}
