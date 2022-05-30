import 'dart:convert';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrumproject/Admin/DashboardA.dart';
import 'package:scrumproject/Globals/Popup.dart';
import 'package:scrumproject/Utilisateurs/Entities/utilisateur.dart';
import 'package:http/http.dart' as http;
import '../../../Globals/global.dart' as globals ;
import '../../Globals/PopupFail.dart';

class AddTrain extends StatefulWidget {
  const AddTrain({Key? key}) : super(key: key);

  @override
  State<AddTrain> createState() => _AddTrainState();
}

class _AddTrainState extends State<AddTrain> {

  final nameController = TextEditingController();
  final depDateTimeController = TextEditingController();
  final arrDateTimeController = TextEditingController();

  String TypeValue = 'Long Distance';
  int LineValue = 1;
  List<String> StationsList = globals.LongDist ;
  late String Station1Value ;
  late String Station2Value  ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Station1Value = StationsList.first ;
    Station2Value = StationsList.last ;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    depDateTimeController.dispose();
    arrDateTimeController.dispose();
    super.dispose();
  }

  //the formkey uniquely identifies the Form Widget and allows validation of the Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String url = "http://"+globals.IPAddress+":8080/add";

  Future save() async {
    var dateDep = DateTime.parse(depDateTimeController.text);
    var dateArr = DateTime.parse(arrDateTimeController.text);
    if (dateArr.isBefore(dateDep)) {
      showDialog(
          context: context,
          builder: (context) => const PopUpFail(title: "Add Fail", subtitle: "The arrival date is prior to the departure date"));
    } else {
    String type="";
    switch(TypeValue){
      case "Long Distance": type = "Long";break;
      case "Bonlieue Tunis":type = "BTunis";break;
      case "Bonlieue Sahel":type = "BSahel";break;
    }
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'trainName':nameController.text,
          'type': type, 'departure': depDateTimeController.text.replaceAll(' ', 'T')+"Z",
        'arrival': arrDateTimeController.text.replaceAll(' ', 'T')+"Z",
        'stationDep':StationsList.indexOf(Station1Value),
        'stationArr':StationsList.indexOf(Station2Value),
        'line':LineValue}));
    print(res.body);
    if (res.body != null) {
      showDialog(
          context: context,
          builder: (context) => PopUpSuccess(title: "Success", subtitle: "Train added successfully !"));
    };
    }}

  Widget _buildName(){
    return TextFormField(
        controller: nameController,
        decoration: InputDecoration(hintText: 'Name') ,
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
  Widget _buildDateTimePicker(String Label,TextEditingController controller){
    final format = DateFormat("yyyy-MM-dd HH:mm:ss.SSS");
      return Scaffold(
          body : DateTimeField(
            format: format,
            controller: controller,
            decoration: InputDecoration(hintText: (controller.text == '') ? Label : '') ,
            style: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(88, 89, 91, 1),
            ),
            resetIcon: Icon(Icons.restore, size: 20,),
            onShowPicker: (context, currentValue) async {
              final date = await showDatePicker(
                  context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(const Duration(days: 0)),
                lastDate: DateTime(2100),);
              if (date != null) {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.combine(date, time);
              } else {
                return currentValue;
              }
            },
          )
      );
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
                            "Add Train",
                            style: TextStyle(
                              fontFamily: "Prata" ,
                              color: Color.fromRGBO(88, 89, 91, 1),
                              fontSize: 37,
                            ),
                          ),
                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 10),
                        color: Colors.transparent,
                        height: 30,
                        width: 250,
                        child :_buildName()),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        color: Colors.transparent,
                        height: 30,
                        width: 250,
                        child : _buildDateTimePicker("Departure",depDateTimeController)),
                          Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              color: Colors.transparent,
                              height: 30,
                              width: 250,
                              child :_buildDateTimePicker("Arrival",arrDateTimeController)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text("Type",style: TextStyle(color: Color.fromRGBO(88, 89, 91, 1)),),
                                DropdownButton<String>(
                                  value: TypeValue,
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
                                  elevation: 10,
                                  style: const TextStyle(color: Color.fromRGBO(88, 89, 91, 1)),
                                  underline: Container(
                                    height: 1,
                                    width: 100,
                                    color: Color.fromRGBO(88, 89, 91, 1),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      TypeValue = newValue!;
                                      switch (newValue){
                                        case "Long Distance" : {StationsList = globals.LongDist ; break ;}
                                        case "Bonlieue Tunis" : StationsList = globals.TunisBDist ; break ;
                                        case "Bonlieue Sahel" : StationsList = globals.SahelBDist ; break ;
                                      };
                                      Station1Value = StationsList.first;
                                      Station2Value = StationsList.last;
                                    });
                                  },
                                  items: <String>['Long Distance', 'Bonlieue Tunis', 'Bonlieue Sahel']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Line",style: TextStyle(color: Color.fromRGBO(88, 89, 91, 1)),),
                                DropdownButton<int>(
                                  value: LineValue,
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
                                  elevation: 10,
                                  style: const TextStyle(color: Color.fromRGBO(88, 89, 91, 1)),
                                  underline: Container(
                                    height: 1,
                                    width: 100,
                                    color: Color.fromRGBO(88, 89, 91, 1),
                                  ),
                                  onChanged: (int? newValue) {
                                    setState(() {
                                      LineValue = newValue!;
                                    });
                                  },
                                  items: <int>[1,2,3,4,5,6]
                                      .map<DropdownMenuItem<int>>((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                ),
                              ],
                            )
                          ]),
                      ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                              Column(
                                children: [
                                  Text("Departure Station",style: TextStyle(color: Color.fromRGBO(88, 89, 91, 1)),),
                                  DropdownButton<String>(
                                    value: Station1Value,
                                    icon: const Icon(Icons.arrow_drop_down_sharp),
                                    elevation: 10,
                                    style: const TextStyle(color: Color.fromRGBO(88, 89, 91, 1)),
                                    underline: Container(
                                      height: 1,
                                      color: Color.fromRGBO(88, 89, 91, 1),
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        Station1Value = newValue!;
                                      });
                                    },
                                    items: StationsList
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  )
                                ],
                              ),
                                  Column(
                                    children: [
                                      Text("Arrival Station",style: TextStyle(color: Color.fromRGBO(88, 89, 91, 1)),),
                                      DropdownButton<String>(
                                        value: Station2Value,
                                        icon: const Icon(Icons.arrow_drop_down_sharp),
                                        elevation: 10,
                                        style: const TextStyle(color: Color.fromRGBO(88, 89, 91, 1)),
                                        underline: Container(
                                          height: 1,
                                          color: Color.fromRGBO(88, 89, 91, 1),
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            Station2Value = newValue!;
                                          });
                                        },
                                        items: StationsList
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      )
                                    ],
                                  ),])),
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
                              margin: EdgeInsets.only(top: 25),
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
                                  'Add',
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
            SizedBox(
              height: 50,
            ),
            Container(height: 63, color: Color.fromRGBO(168, 212, 239, 1),)
          ],
        ),
      ),
    );
  }
}
