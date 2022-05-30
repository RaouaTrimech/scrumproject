import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrumproject/Landing_Pages/StartScreen.dart';

import 'items.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  double currentPage = 0.0;
  final _pageViewController = new PageController();
  
  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      setState(() {
        currentPage = _pageViewController.page!;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    List<Widget> slides = items
        .map((item) => Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0, -1),
                end: Alignment(0, 0),
                colors: [
                  Color.fromRGBO(168, 212, 239, 1),
                  Color.fromRGBO(204, 235, 230, 1),
                ]
            )),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Image.asset(
                item['image'],
                fit: BoxFit.fitWidth,
                width: 160.0,
                alignment: Alignment.bottomCenter,
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top :30.0, bottom: 15),
                      child: Center(
                        child: Text(item['header'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF455A64),
                            )),
                      ),
                    ),
                    Text(
                      item['description'],
                      style: TextStyle(
                          color:  Color(0XFF455A64),
                          letterSpacing: 1.2,
                          fontSize: 16.0,
                          height: 1.3),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    (item["id"] == "3") ?
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => StartScreen(),
                            ));
                      },
                      child:  Container(
                        margin: const EdgeInsets.only(top: 25 ,left: 15.0 , right: 15.0 ),
                        height: 40,
                        width: 300,
                        decoration: const BoxDecoration(
                          color: Color(0XFF455A64),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        child:  const Center(
                          child: Text(
                              'GET STARTED',
                              style: TextStyle(
                                  color:Colors.white,
                                  fontSize: 18,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    )
                        : Container(),
                  ],
                ),
              ),
            )
          ],
        )))
        .toList();

    List<Widget> indicator() => List<Widget>.generate(
        slides.length,
            (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 3.0),
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: currentPage.round() == index
                  ? Color(0XFF256075)
                  : Color(0XFF256075).withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.0)),
        ));

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageViewController,
              itemCount: slides.length,
              itemBuilder: (BuildContext context, int index) {
                return slides[index];
              },
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 30.0),
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicator(),
                  ),
                )
                //  ),
                )
            // )
          ],
        ),
      ),
    );
  }
}
