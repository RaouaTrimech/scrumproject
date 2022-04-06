import 'package:flutter/material.dart';

import 'ButtomNavbar.dart';



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
            height: 45,
          ),
          Container(
            height : 170 ,
            color: Color.fromRGBO(240, 249, 247, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin : EdgeInsets.all(13.15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13.15),
                    child: Image.asset("long_distance.png", width: 155 , height: 138.15),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(),
          )
        ]
    )),
          const ButtomNavbar()]));
  }
}


