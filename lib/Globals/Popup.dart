import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopUpSuccess extends StatelessWidget {
  const PopUpSuccess({Key? key, required this.title , required this.subtitle}) : super(key: key);
  final String title ;
  final String subtitle ;
  @override
  Widget build(BuildContext context) {
    return Container(
      child : AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(
                    Radius.circular(10.0))),
            content: Builder(
              builder: (context) {
                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;

                return Container(
                  height: height - 410,
                  width: width - 360,
                  child : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          const Image(image: AssetImage("assets/success.png"),width: 250,),
                          Text(title,
                            style: const TextStyle(
                                color: Color.fromRGBO(88,89,91, 1),
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                fontSize: 32
                            ),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                              child: Text(subtitle,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Color.fromRGBO(105,103,103, 1),
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w100,
                                    fontSize: 20
                                ),
                            ),
                          ),
                        ]
                    ),
                  ));}),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context) ,
                      child: Text('OK'),

                    )
                  ],
                ),
                );
  }}
  /*Container(
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
}*/
