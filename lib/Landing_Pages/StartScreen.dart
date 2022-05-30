import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrumproject/Utilisateurs/Log%20In/Log%20In.dart';

import '../Admin/LogInA.dart';


class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  bool OnTapUser = false ;
  bool OnTapAdmin = false ;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(0, -1),
                  end: Alignment(0, 0),
                  colors: [
                    Color.fromRGBO(168, 212, 239, 1),
                    Color.fromRGBO(204, 235, 230, 1),
                  ]
              )),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Image.asset("assets/Landing_Pages/Background.png"
                , fit: BoxFit.fill,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100 , bottom: 10),
                    child: Text(
                      "Open Application as",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Prata" ,
                        color: Color.fromRGBO(88, 89, 91, 1),
                        fontSize: 30,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => LogIn(),
                          ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 60),
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        border: Border.all(width : 3 , color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(25.0))
                        ),
                      child:  Center(
                        child: Text(
                          'A USER',
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15 , bottom: 15),
                    child: Text(
                      "Or",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Prata" ,
                        color: Color.fromRGBO(88, 89, 91, 1),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => LogInA(),
                          ));
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          border: Border.all(width : 3 , color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(25.0))
                      ),
                      child:  Center(
                        child: Text(
                          'AN ADMIN',
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
