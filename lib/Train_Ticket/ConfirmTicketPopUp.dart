import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class confirmTicketPopUp extends StatelessWidget {
  const confirmTicketPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 444,
      child: AlertDialog(
            content: Center(
              child: Column(
                  children:[
                    Image(image: AssetImage("assets/success.png"),width: 280,),
                    Text('Ticket booked',
                    style: TextStyle(
                        color: Color.fromRGBO(88,89,91, 1),
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 32
                    ),),
                    Text('Your ticket has been sent to your email ',
                      style: TextStyle(
                          color: Color.fromRGBO(105,103,103, 1),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w100,
                          fontSize: 32
                      ),
                    ),
                  ]
                ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context) ,
                child: Text('OK'),

              )
            ],
            ),
    );
  }
}
