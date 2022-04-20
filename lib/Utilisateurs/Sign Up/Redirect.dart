import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrumproject/Utilisateurs/Sign%20Up/Sign%20Up.dart';

import '../Log In/Log In.dart';

class Redirect extends StatelessWidget {
  String RedirectNature;
   Redirect({Key? key, required this.RedirectNature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 125,
        ),
        Container(
          height: 63,
          color: Color.fromRGBO(168, 212, 239, 1),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
              (RedirectNature == 'Sign Up')? 'Already have an account   ' : "Don't have an account?   ",
                style: TextStyle(
                  color: Colors.white ,
                  fontFamily: "Roboto"
                ),
              ),
              (RedirectNature == 'Sign In')? ElevatedButton(
                child:  Text( RedirectNature),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LogIn()),
                  );
                },
              ):
              ElevatedButton(
                child:  Text(RedirectNature),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
              )
          ],
          )

        ),
      ],
    );
  }
}
