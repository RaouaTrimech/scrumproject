import 'package:flutter/material.dart';
import '../Train details/ButtomNavbar.dart';
import 'trainButtons.dart';

class trainList extends StatefulWidget {
  const trainList({Key? key}) : super(key: key);

  @override
  State<trainList> createState() => _trainListState();
}

class _trainListState extends State<trainList> {
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
                      Text(
                        "Available Trains",
                        style: TextStyle(
                          fontFamily: "Prata" ,
                          color: Color.fromRGBO(88, 89, 91, 1),
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Expanded(
                        child:trainButtons(),
                      ),
                    ]
                )),
            const ButtomNavbar()]),
    );
  }
}
