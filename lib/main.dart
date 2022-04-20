import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scrumproject/Available%20trains/Train_List.dart';

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
      trainList()
    );
  }
}
