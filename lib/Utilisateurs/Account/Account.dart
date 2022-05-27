import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Globals/Popup.dart';
import '../Log In/Log In.dart';
import '../Entities/utilisateur.dart';

import 'package:http/http.dart' as http;
import '../../../Globals/global.dart' as globals ;

class Account extends StatefulWidget {
  const Account({Key? key,  required this.user}) : super(key: key);
final Utilisateur user ;
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var _expanded = false;
  var _expanded2 = false;
  var _expanded3 = false;

  String? _password;
  bool _obscured = true;
  late Utilisateur _user ;

  late final nameController ;
  late final emailController;
   final passwordController = TextEditingController();
  late String url ;

  @override
  void initState() {
    super.initState();
    _user= widget.user;
    print(_user.email);
    url = "http://"+globals.IPAddress+":8080/userInfo?email="+_user.email;
    print(url);
    emailController = TextEditingController(text: _user.email);
    getUserInfo();
    nameController = TextEditingController(text: _user.name) ;
  }

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

  Future getUserInfo() async {
    var res = await http.get(Uri.parse(url));
      _user.name = res.body ;
    }

    Future update() async {
    int id ;
    Utilisateur util = Utilisateur("","","");
      var res1 = await http.get(Uri.parse("http://"+globals.IPAddress+":8080/getId?email="+_user.email));
      id = int.parse(res1.body) ;
      util.email = emailController.text ;
      util.name = nameController.text ;
      util.password = passwordController.text ;
      var res = await http.post(Uri.parse("http://"+globals.IPAddress+":8080/update"),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'id': id ,'name':util.name,'email': util.email, 'password': _user.password}));
      print(res.body);
      if (res.body != null) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => PopUpSuccess(title : "Success !" , subtitle : "Your modifications were saved.")));
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
          return 'Password is Required !';
        }
        if (value != _user.password) {
          return 'Wrong password !';
        }
        return null;
      },
      onSaved: (value){
        _password = value;
      },
    ) ;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
      child: Column(
      children: [
      Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
       height: 25,
       ),
        Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Padding(
                padding: const EdgeInsets.only(left : 8.0, right: 8.0 , top: 337),
                child: Image(image:AssetImage("assets/dashboard_images/background.png"),width: 350),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 245,245, 0.67),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)) ,
                ),
                child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 500),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return const ListTile(
                          leading : Icon(Icons.person_outline, size: 33,) ,
                          title: Text(
                              "My Account",
                              style: TextStyle(
                                  color: Color.fromRGBO(24, 29, 39, 1),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500 ,
                                  fontSize: 18
                              )),
                          subtitle: Text(
                              "Make changes to your account",
                              style: TextStyle(
                                  color: Color.fromRGBO(105, 103,103, 1),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.normal ,
                                  fontSize: 13
                              )),
                        );
                      },
                      body: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Form(
                          key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                _buildName(),
                                _buildEmail(),
                                _buildPassword(),

                                GestureDetector(
                                  onTap: () {
                                    // Validate will return true if the form is valid, or false if
                                    // the form is invalid.
                                     if (_formKey.currentState!.validate()) {
                                    // Process data.
                                    update();
                                    }
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                                    height: 50,
                                    width: 354,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Color.fromRGBO(168, 212, 239, 1),
                                            Color.fromRGBO(204, 235, 230, 1),

                                          ]
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)) ,
                                    ),
                                    child:  const Center(
                                      child: Text(
                                        'SAVE',
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
                      isExpanded: _expanded,
                      canTapOnHeader: true,
                    ),
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return const ListTile(
                          leading : Icon(Icons.help_outline, size: 33,) ,
                          title: Text(
                              "Help & Support",
                              style: TextStyle(
                                  color: Color.fromRGBO(24, 29, 39, 1),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500 ,
                                  fontSize: 18
                              )),
                        );
                      },
                      isExpanded: _expanded2 ,
                      canTapOnHeader: true,
                      body: const Padding(
                        padding:  EdgeInsets.all(20.0),
                        child: Text(
                            "If you have any questions or issues please contact us on our email address kitari@gmail.com ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(105, 103,103, 1),
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.normal ,
                                fontSize: 13
                            )),
                      )
                    ),
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return const ListTile(
                          leading : Icon(Icons.logout, size: 30,) ,
                          title: Text(
                              "Log out",
                              style: TextStyle(
                                  color: Color.fromRGBO(24, 29, 39, 1),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500 ,
                                  fontSize: 18
                              )),
                        );
                      },
                      body: Padding(
                        padding: const EdgeInsets.only(bottom :8.0, right: 8 , left: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          const Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Text(
                                    "Are you sure you want to log out ? ",
                                    style: TextStyle(
                                        color: Color.fromRGBO(105, 103,103, 1),
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.normal ,
                                        fontSize: 13
                                    )),
                          ),
                            OutlinedButton(
                              child: Text("Yes !"),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LogIn()),
                                );
                              },

                            )
                          ],
                        ),
                      ),
                      isExpanded: _expanded3,
                      canTapOnHeader: true,
                    ),
                  ],
                  expansionCallback: (panelIndex, isExpanded) {
                    setState(() {
                      switch (panelIndex) {
                        case 0 : _expanded = !_expanded ; break;
                        case 1 : _expanded2 = !_expanded2 ; break;
                        case 2 : _expanded3 = !_expanded3 ; break ;
                      }
                    });
                  },
                ),
              ),
            ]
        )
      ]
        )])
      ));
    }}
