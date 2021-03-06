import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scrumproject/Utilisateurs/Sign%20Up/Redirect.dart';
import 'package:scrumproject/Utilisateurs/Entities/utilisateur.dart';
import 'package:http/http.dart' as http;
import '../../../Globals/global.dart' as globals ;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   String? _password;
   bool _obscured = true;

   final nameController = TextEditingController();
   final emailController = TextEditingController();
   final passwordController = TextEditingController();

   @override
   void dispose() {
     // Clean up the controller when the widget is disposed.
     nameController.dispose();
     emailController.dispose();
     passwordController.dispose();
     super.dispose();
   }

 //the formkey uniquely identifies the Form Widget and allows validation of the Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Utilisateur user = Utilisateur("", "","");
  String url = "http://"+globals.IPAddress+":8080/register";

  Future save() async {
    user.name = nameController.text ;
    user.email = emailController.text ;
    user.password = passwordController.text ;
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'name':user.name,'email': user.email, 'password': user.password}));
    print(res.body);
    if (res.body != null) {
      Navigator.pop(context);
    }
  }
  
  
  Widget _buildName(){
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(labelText: 'Name') ,
      //maxLength: 20,
      // The validator receives the text that the user has entered
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      }
    ) ;
  }
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
      }
    ) ;
  }
  Widget _buildPassword(){
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscured,
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
          _password = value;
      },
    ) ;
  }
  Widget _buildConfirmPassword(){
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscured,
      controller: passwordController,
      decoration: InputDecoration(labelText: 'Confirm Password') ,
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'ConfirmPassword is Required';
        }
        /*if (!RegExp(
            "^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{5,}")
            .hasMatch(value)) {
          return 'Please enter a valid Password';
        }*/
        if(value != _password){
          return  'Please enter a valid Password';
        }
        return null;
      },
      onChanged: (value){
          _password = value;
      },
    ) ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child : Column(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
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
            Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40 , vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Create Account",
                          style: TextStyle(
                            fontFamily: "Prata" ,
                            color: Color.fromRGBO(88, 89, 91, 1),
                            fontSize: 37,
                          ),
                        ),
                        _buildName(),
                        _buildEmail(),
                        _buildPassword(),
                        _buildConfirmPassword(),

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
                             margin: EdgeInsets.only(top: 50),
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
                               'SIGN UP',
                               style: TextStyle(
                                   color:Color.fromRGBO(76, 149, 147, 1),
                                   fontSize: 18,
                                   fontWeight: FontWeight.bold),),
                           ),
                           ),
                         ),
                      ],
                    )
                  ),

                ),
                ],
            ),
          Redirect( RedirectNature: 'Sign In'),
        ],
      ),
    ),
    );
  }
}
