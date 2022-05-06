import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scrumproject/Train_Ticket/TrainTicket.dart';
import 'package:scrumproject/Utilisateurs/Log%20In/Log%20In.dart';
import 'Train details/Navigation.dart';

import 'Train_Ticket/ConfirmTicketPopUp.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
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

      home:
      trainDetails()
     /* TrainTicket(Type : "GRANDES LIGNES",

          Station1: "Station1",
          Station2: "Station2",
          Date: "04/05/2021",
          Line: "04",
          TravelTime : "13:00")*/
    );
  }
}
