import 'main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:numberpicker/numberpicker.dart';
//import 'package:intl/intl.dart';
//import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class CalendarPage extends StatefulWidget {

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _dateTime = DateTime.now();
    int? tempdate;
    NumberPicker? integerNumberPicker;

    
    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inHours / 24).round();
    }
    

    void _showDatePicker() {
      var appState = context.read<MyAppState>();

      showDatePicker(
        helpText: "Select your first day of last period",
        context: context, 
        initialDate: DateTime.now(),
        firstDate: DateTime(2022,1,1), 
        lastDate: DateTime.now(),
      ).then((value) {     
        setState((){
          _dateTime = value!;
        });
        tempdate = (daysBetween(_dateTime, DateTime.now()));
        appState.pregnancy_week = (tempdate! ~/ 7)+1;
      },
      onError: (e) {_dateTime = DateTime.now();}
      );

    } 
    _handleValueChanged(int value) {
      var appState = context.read<MyAppState>();
      appState.pregnancy_week = value;
      } 

  _handleValueChangedExternally(int value) {
      var appState = context.read<MyAppState>();
      appState.pregnancy_week = value;
      //integerNumberPicker.animateInt(value);
      }

    void _showIntegerDialog()  {
      var appState = context.read<MyAppState>();

      showDialog<int>(
        context: context, 
        builder: (BuildContext context,){
          return AlertDialog(
            title: Text("pick number"),
            content: StatefulBuilder(
              builder: (context, setState) {
                return NumberPicker(
          value: appState.pregnancy_week,
          minValue: 0,
          maxValue: 60,
          step: 1,
          onChanged: _handleValueChangedExternally,
          haptics: true,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black26),
          ),

                );

          //title: new Text("Pick a int value"),
        
        }
        ),
         actions: [
          TextButton(
            child: Text("OK",),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          // TextButton(
          //   child: Text("Cancel",),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // )
        ],);


    });}
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var appState = context.read<MyAppState>();

    
    integerNumberPicker = NumberPicker(
      value: appState.pregnancy_week,
      minValue: 0,
      maxValue: 100,
      step: 10,
      onChanged: _handleValueChanged,
    );
    
    
    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant,
      appBar: AppBar(
        title: Text("Settings"),
        leading: Icon(Icons.calendar_month)),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // display chosen date
            Text('You are ' + appState.pregnancy_week.toString() +' Week(s) Pregnant', style: TextStyle(fontSize: 30)),
            Text("When was your first day of last period?", style: TextStyle(fontSize: 18),),
            MaterialButton(onPressed: _showDatePicker,
            child: const Padding(padding: EdgeInsets.all(20.0),
            child: Text('Preganacy Calculator',
                softWrap: true,
                style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                )),
                ),
                color: colorScheme.secondary,
      ),
            Text('If you already know your pregnancy week, click this for manual setting', style: TextStyle(fontSize: 15)),

      MaterialButton(onPressed: _showIntegerDialog,
            child: const Padding(padding: EdgeInsets.all(15.0),
            child: Text('Set pregnancy week',
                softWrap: true,
                style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                )),
                ),
                color: colorScheme.secondary,
      ),
          ],
        ),),);
  }

  
  }