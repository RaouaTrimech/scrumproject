import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scrumproject/Available%20trains/Train_List.dart';
import 'package:scrumproject/Utilisateurs/utilisateur.dart';
import 'package:http/http.dart' as http;
import '../Dashboard.dart';
import '../Sign Up/Redirect.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  late String _email;
  late String _password;
  bool _obscured = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Toggles the password show status

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  //the formkey uniquely identifies the Form Widget and allows validation of the Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Utilisateur user = Utilisateur("","", "");
  String url = "http://192.168.100.159:8080/login";

  Future save() async {
    user.email = emailController.text ;
    user.password = passwordController.text ;
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'name':user.name,'email': user.email, 'password': user.password}));
    print(res.body);
    if (res.body != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => trainList(),
          ));
    }
  }

//verification email

  Widget _buildEmail(){
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(labelText: 'Email') ,
      // The validator receives the text that the user has entered
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is Required';
        }
        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }
        return null;
      },
      onSaved: (value){
        void initState() {
          _email = value! ;
        }
      },
    ) ;
  }
  Widget _buildPassword(){
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscured,
      controller: passwordController,
      decoration: InputDecoration(labelText: 'Password') ,
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is Required';
        }
        /*if (!RegExp(
            "^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{5,}")
            .hasMatch(value)) {
          return 'Please enter a valid Password';
        }*/
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
                  Container(
                    height:41 ,
                    color:Color.fromRGBO(204, 235, 230, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: const Image(image:AssetImage("assets/Logo.png"),width: 250 , height: 100),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20 , bottom: 10),
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
                          _buildEmail(),
                          _buildPassword(),

                          GestureDetector(
                            onTap: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState!.validate()) {
                                // Process data.
                                save();
                              }
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
                ],
              ),
            Redirect( RedirectNature: 'Sign Up'),
          ],
        ),
    ),
      ),
    );
  }
}
