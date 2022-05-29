import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scrumproject/Utilisateurs/Log%20In/Log%20In.dart';
import 'Globals/Popup.dart';
import 'Trains/Available trains/Train_List.dart';
import 'Utilisateurs/Dashboard/Dashboard.dart';
void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
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
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blue,
            ),
          ),


      home:
        //trainList()
      LogIn()
     /* TrainTicket(Type : "GRANDES LIGNES",

          Station1: "Station1",
          Station2: "Station2",
          Date: "04/05/2021",
          Line: "04",
          TravelTime : "13:00")*/
    );
  }
}
