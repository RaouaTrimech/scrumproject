import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerSearch extends StatefulWidget{
  DatePickerSearch({ Key? key}) : super(key: key);

  @override
  _DatePickerSearchState createState() => _DatePickerSearchState();
}
class _DatePickerSearchState extends State<DatePickerSearch> {
  /* Date Picker */
  DateTime? _chosenDateTime ;

// Show the modal that contains the CupertinoDatePicker
  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          height: 500,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (val) {
                      setState(() {
                        _chosenDateTime = val;
                      });
                          }),
              ),

              // Close the modal
              CupertinoButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(ctx).pop(),
              )
            ],
          ),
        ));}
/***************/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoButton(
                padding: EdgeInsetsDirectional.zero,
                onPressed: () => _showDatePicker(context),
                child: const Icon(Icons.calendar_today,
                    color: Color.fromRGBO(88, 89, 91, 1),size: 20),
              ),
              Center(
                child: Text(_chosenDateTime != null
                    ? DateFormat('yyyy-MM-dd').format(_chosenDateTime!)
                    : 'Pick a date!',
                    style: TextStyle(
                        color: Color.fromRGBO(88, 89, 91, 1),
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500 ,
                        fontSize: 15
                    )),
              ),
            ],
          ),
      ),
    );
  }
}