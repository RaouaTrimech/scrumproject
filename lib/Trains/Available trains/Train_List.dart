import 'package:flutter/material.dart';
import 'trainButtons.dart';

class trainList extends StatefulWidget {
  const trainList({Key? key}) : super(key: key);

  @override
  State<trainList> createState() => _trainListState();
}

class _trainListState extends State<trainList> {
  late List<bool> Selected ;
  String Filter = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Selected = [false,false,false];
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
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Available Trains",
                        style: TextStyle(
                          fontFamily: "Prata" ,
                          color: Color.fromRGBO(88, 89, 91, 1),
                          fontSize: 40,
                        ),
                      ),
                       Padding(
                         padding: const EdgeInsets.only(bottom : 12.0,top: 10),
                         child: SizedBox(
                          height: 45,
                          child : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children : [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    if(Selected[0] == true ){Selected[0] = false ; Filter = "";} else {
                                     if((Selected[0] == false)&&(Selected[1] == false)&&(Selected[2] == false)){
                                     Selected[0] = true ;
                                     } else {
                                     if((Selected[1] == true)||(Selected[2]==true)){
                                     Selected[1] = false ;
                                     Selected[2] = false ;
                                     Selected[0] = true ; }}
                                     Filter = "Long";
                                  }});
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: ( Selected[0] == true ) ?
                                        [Color.fromRGBO(168, 212, 239, 1), Color.fromRGBO(204, 235, 230, 1.0)]:
                                        [Color.fromRGBO(229, 229, 229, 1),Color.fromRGBO(229, 229, 229, 1.0)]
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(25.0)) ,
                                  ),
                                  child :  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Long Distance',
                                        style: TextStyle(
                                            color: (Selected[0] == true ) ?
                                            Color.fromRGBO(76, 149, 147, 1): Color.fromRGBO(88,89, 91, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                )
                                ,
                              ),
                              GestureDetector(
                                onTap: (){
                                 setState(() {
                                   if(Selected[1] == true ){Selected[1] = false ; Filter = "";} else {
                                   if((Selected[0] == false)&&(Selected[1] == false)&&(Selected[2] == false)){
                                     Selected[1] = true ;
                                   } else {
                                     if((Selected[0] == true)||(Selected[2]==true)){
                                       Selected[0] = false ;
                                       Selected[2] = false ;
                                       Selected[1] = true ; }}
                                   Filter = "BTunis";
                                 }});
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: (Selected[1] == true ) ?
                                        [Color.fromRGBO(168, 212, 239, 1), Color.fromRGBO(204, 235, 230, 1.0),]:
                                    [Color.fromRGBO(229, 229, 229, 1),Color.fromRGBO(229, 229, 229, 1)]
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(25.0)) ,
                                  ),
                                  child :  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Bonlieue Tunis',
                                        style: TextStyle(
                                            color: (Selected[1] == true ) ?
                                            Color.fromRGBO(76, 149, 147, 1): Color.fromRGBO(88,89, 91, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                )
                                ,
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    if(Selected[2] == true ){Selected[2] = false ; Filter = "";} else {
                                        if((Selected[0] == false)&&(Selected[1] == false)&&(Selected[2] == false)){
                                        Selected[2] = true ;
                                        } else {
                                        if((Selected[0] == true)||(Selected[1]==true)){
                                        Selected[0] = false ;
                                        Selected[1] = false ;
                                        Selected[2] = true ; }}
                                        Filter = "BSahel";}
                                    });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: (Selected[2] == true ) ?
                                                [Color.fromRGBO(168, 212, 239, 1), Color.fromRGBO(204, 235, 230, 1.0),]:
                                                [Color.fromRGBO(229, 229, 229, 1),Color.fromRGBO(229, 229, 229, 1)]
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(25.0)) ,
                                  ),
                                  child :  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Bonlieue Sahel',
                                        style: TextStyle(
                                            color: (Selected[2] == true ) ?
                                                    Color.fromRGBO(76, 149, 147, 1): Color.fromRGBO(88,89, 91, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                )
                                ,
                              )
                            ]
                          )
                      ),
                       ),
                      Expanded(
                        child:trainButtons(filter : Filter),
                      ),
                    ]
                ))]),
    );
  }
}
