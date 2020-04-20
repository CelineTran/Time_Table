import 'package:flutter/material.dart';
import 'package:time_table/setup.dart';
import 'timeTable.dart';
import 'setup.dart';

var description;

class Log2Page extends StatefulWidget {
  Log2Page({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Log2PageState createState() => _Log2PageState();
}

class _Log2PageState extends State<Log2Page> {

  var defaultStart = "Select Start Time";
  var defaultEnd = "Select End Time";
  var totalTime = "00:00";
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  TimeOfDay picked;

  Future<Null> selectStartTime (BuildContext context) async{
    picked = await showTimePicker(
        context: context,
        initialTime: startTime,
    );

    setState(() {
      startTime = picked;
    });

    var period = "pm";
    if(startTime.period == DayPeriod.am)
      period = "am";

    var hour = startTime.hour;
    if(hour > 12)
      hour = startTime.hour - 12;

    var minutes = (startTime.minute).toString();
    if(startTime.minute < 10)
      minutes = "0" + minutes.toString();

    defaultStart = hour.toString() + ":" + minutes + " " + period;
  }

  Future<Null> selectEndTime (BuildContext context) async {
    picked = await showTimePicker(
      context: context,
      initialTime: endTime,
    );

    setState(() {
      endTime = picked;
    });

    var period = "pm";
    if (endTime.period == DayPeriod.am)
      period = "am";

    var hour = endTime.hour;
    if (hour > 12)
      hour = endTime.hour - 12;

    var minutes = (endTime.minute).toString();
    if (endTime.minute < 10)
      minutes = "0" + minutes.toString();

    defaultEnd = hour.toString() + ":" + minutes + " " + period;
  }

  String timeElapsed(){
    var hour = endTime.hour - startTime.hour;
    var minutes;
    if(endTime.minute < startTime.minute) {
      hour -=1;
      minutes = endTime.minute + (60 - startTime.minute);
    }
    else
      minutes = endTime.minute - startTime.minute;

    var strMinutes = "";
    if(minutes < 10)
      strMinutes = "0" + minutes.toString();
    else
      strMinutes = minutes.toString();

    if (widget.title == labels[0])
      intTime1 += hour + (minutes/60);
    else if (widget.title == labels[1])
      intTime2 += hour + (minutes/60);
    else if (widget.title == labels[2])
      intTime3 += hour + (minutes/60);
    else if (widget.title == labels[3])
      intTime4 += hour + (minutes/60);


    return hour.toString() + ":" + strMinutes;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.black87),
          child: Column(
            children: <Widget>[
              Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    '\n' + widget.title,
                    style: TextStyle(fontFamily: 'Georgia', fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                  )
              ),
              Stack(
                children: <Widget> [
                  Container(
                      margin: EdgeInsets.fromLTRB(190, 15, 0, 0),
                      width: 200,
                      child: FlatButton(
                          color: Colors.blue[900],
                          onPressed: (){
                            selectStartTime(context);
                          },
                          child: Text(
                            defaultStart.toString(),
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                      )
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        'Start Time: ',
                        style: TextStyle(fontFamily: 'Georgia', fontSize: 30, color: Colors.white),
                      )
                  ),
                ],
              ),
              Stack(
                children: <Widget> [
                  Container(
                      margin: EdgeInsets.fromLTRB(190, 20, 0, 0),
                      width: 200,
                      child: FlatButton(
                          color: Colors.blue[900],
                          onPressed: (){
                            selectEndTime(context);
                          },
                          child: Text(
                            defaultEnd.toString(),
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                      )
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        'End Time: ',
                        style: TextStyle(fontFamily: 'Georgia', fontSize: 30, color: Colors.white),
                      )
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 155, 0),
                  child: Text(
                    'Description: ',
                    style: TextStyle(fontFamily: 'Georgia', fontSize: 30, color: Colors.white),
                  )
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 350,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Add any description to your activity...'
                    ),
                    onSubmitted: (text){
                      description = text;
                    },
                  )
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    'Total Time: ' + timeElapsed(),
                    style: TextStyle(fontFamily: 'Georgia', fontSize: 30, color: Colors.white),
                  )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child:FlatButton(
                    color: Colors.blue[900],
                    textColor: Colors.white,
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => timeTablePage(title:'Time Table')),
                      );
                    },
                    child: Text(
                      'FINISH',
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Georgia', fontSize: 20),
                    )
                ),
              ),
            ],
          )
        ),
    );
  }
}
