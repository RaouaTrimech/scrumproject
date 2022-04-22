import 'package:flutter/material.dart';

class TrainHeader extends StatelessWidget {
  String TrainName ;
  String Station1 ;
  String Station2 ;
  String Date ;
  String Line ;
  String TrainImage ;
  TrainHeader({Key? key, required this.TrainName ,
    required this.Station1 , required this.Station2 ,
  required this.Date , required this.Line ,
  required this.TrainImage }) : super(key: key);
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
                   TrainName,
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
                                 Date,
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
                                 Line,
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
                 child:  const Center(
                   child: Text(
                     'BOOK YOUR TICKET',
                     style: TextStyle(
                         color:Color.fromRGBO(76, 149, 147, 1),
                         fontSize: 13.11,
                         fontWeight: FontWeight.bold),),
                 ),

               )
             ]
         )
       ],
     ),
   );
  }

}