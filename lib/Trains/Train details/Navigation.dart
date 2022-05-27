import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

import '../../Utilisateurs/Account/Account.dart';
import '../../Utilisateurs/Dashboard/Dashboard.dart';
import '../../Utilisateurs/Entities/utilisateur.dart';
import '../Available trains/Train_List.dart';

class Navigation extends StatefulWidget {
  Navigation({Key? key, required this.title , required this.user}) : super(key: key);
  final String title;
  final Utilisateur user ;

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedPos = 0;
  double bottomNavBarHeight = 60;
  late Utilisateur _user ;

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Home", Colors.white, labelStyle: TextStyle(color: Color.fromRGBO(58, 136, 195, 1),fontWeight: FontWeight.bold)),
    new TabItem(Icons.train, "Train List",Colors.white, labelStyle: TextStyle(color: Color.fromRGBO(58, 136, 195, 1),fontWeight: FontWeight.bold)),
    new TabItem(Icons.account_circle, "Account",Colors.white,labelStyle: TextStyle(color: Color.fromRGBO(58, 136, 195, 1),fontWeight: FontWeight.bold)),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
    _user= widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(child: bodyContainer(), padding: EdgeInsets.only(bottom: bottomNavBarHeight),),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Widget? Page;
    switch (selectedPos) {
      case 0:
        Page = Dashboard();
        break;
      case 1:
        Page = const trainList();
        break;
      case 2:
        Page = Account(user : _user );
        break;
    }

    return GestureDetector(
      child: Center(
          child: Page
        ),
      onTap: () {
        if (_navigationController.value == tabItems.length - 1) {
          _navigationController.value = 0;
        } else {
          _navigationController.value++;
        }
      },
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      selectedIconColor: Color.fromRGBO(58, 136, 195, 1),
      normalIconColor: Colors.white,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Color.fromRGBO(168, 212, 239, 1),
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}