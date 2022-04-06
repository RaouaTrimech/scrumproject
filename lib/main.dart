import 'package:flutter/material.dart';
import 'package:scrumproject/Log%20In/Log%20In.dart';
import 'package:scrumproject/Sign%20Up/Sign%20Up.dart';

import 'Train details/Train_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrum Project',
    /*  theme: ThemeData(
        brightness: Brightness.light,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 40, color: Color.fromRGBO(88, 89, 91, 100),fontFamily: "Prata"),
          bodyText2: TextStyle(fontSize: 40, fontFamily: "Roboto-Medium"),
        )
      ),*/
      home: trainDetails(),
    );
  }
}
