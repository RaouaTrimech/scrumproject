import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scrumproject/Admin/DashboardA.dart';

import '../Globals/PopupFail.dart';


class LogInA extends StatefulWidget {
  const LogInA({Key? key}) : super(key: key);

  @override
  State<LogInA> createState() => _LogInAState();
}

class _LogInAState extends State<LogInA> {

  late String _password ;
  bool _obscured = true;

  final passwordController = TextEditingController();

  // Toggles the password show status

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    passwordController.dispose();
    super.dispose();
  }

  //the formkey uniquely identifies the Form Widget and allows validation of the Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildPassword(){
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscured,
      controller: passwordController,
      decoration: InputDecoration(labelText: 'Password') ,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is Required';
        }
        return null;
      },
      onSaved: (value){
        void initState() {
          _password = value!;
        }
      },
    ) ;
  }
//page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:Column(
            children: [
              Column(
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
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context,true);
                      },
                      child:Container(
                        height: 41 ,
                        width: 500,
                        color:const Color.fromRGBO(204, 235, 230, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.arrow_back,
                                  color: const Color.fromRGBO(76, 149, 147, 0.81) , size : 25),
                            ),
                            Center(
                              child: Text('BACK',style: TextStyle(color: Color.fromRGBO(76, 149, 147, 0.81) ,
                                  fontFamily: 'Roboto', fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              ),
                            )],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: const Image(image:AssetImage("assets/Logo.png"),width: 250 , height: 100),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50 , bottom: 10),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        fontFamily: "Prata" ,
                        color: Color.fromRGBO(88, 89, 91, 1),
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40 , vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          _buildPassword(),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (passwordController.text == "admin")
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DashboardA(),
                                      ));
                                } else {
                                  showDialog(
                                  context: context,
                                  builder: (context) => PopUpFail(title: "LogIn Fail", subtitle: "Incorrect password !"));
                                  };
                              },
                            child: Container(
                              margin: EdgeInsets.only(top: 40),
                              height: 58,
                              width: 354,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(168, 212, 239, 1),
                                      Color.fromRGBO(204, 235, 230, 1),

                                    ]
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(15.0)) ,
                              ),
                              child:  Center(
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                      color:Color.fromRGBO(76, 149, 147, 1),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                  SizedBox(
                    height: 125,
                  ),
                  Container(height: 63, color: Color.fromRGBO(168, 212, 239, 1),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
