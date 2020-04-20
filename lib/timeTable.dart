import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:time_table/calendar.dart';
import 'package:time_table/log.dart';
import 'setup.dart';
import 'calendar.dart';

// ignore: camel_case_types
class timeTablePage extends StatefulWidget {
  timeTablePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _timeTablePageState createState() => _timeTablePageState();
}

// ignore: camel_case_types
class _timeTablePageState extends State<timeTablePage> {

  var date;
  var day;
  var month;

  void getDate(){
    date = DateTime.now();
    switch (date.weekday){
      case 1:
        day = "Monday";
        break;
      case 2:
        day = "Tuesday";
        break;
      case 3:
        day = "Wednesday";
        break;
      case 4:
        day = "Thursday";
        break;
      case 5:
        day = "Friday";
        break;
      case 6:
        day = "Saturday";
        break;
      case 7:
        day = "Sunday";
        break;
    }

    switch (date.month){
      case 1:
        month = "January";
        break;
      case 2:
        month = "February";
        break;
      case 3:
        month = "March";
        break;
      case 4:
        month = "April";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "June";
        break;
      case 7:
        month = "July";
        break;
      case 8:
        month = "August";
        break;
      case 9:
        month = "September";
        break;
      case 10:
        month = "October";
        break;
      case 11:
        month = "November";
        break;
      case 12:
        month = "December";
        break;
    }
  }

  List<Color> colorList = [
    Color(colorL[0]),
    Color(colorL[1]),
    Color(colorL[2]),
    Color(colorL[3]),
    Colors.blue,
  ];

  Map<String, double> dataMap = new Map();
  var hour1 = intTime1;
  var hour2 = intTime2;
  var hour3 = intTime3;
  var hour4 = intTime4;
  var left = 0.0;

  void getTimes(){
    if(labels[1] == "N/A")
      hour2 = 24 - hour1;
    else if(labels[2] == "N/A")
      hour3 = 24 - (hour1 + hour2);
    else if(labels[3] == "N/A")
      hour4 = 24 - (hour1 + hour2 + hour3);

    left = 24 - (hour1 + hour2 + hour3 + hour4);
  }
  @override
  void initState() {
    super.initState();
    getTimes();
    dataMap.putIfAbsent(labels[0], () => (hour1));
    dataMap.putIfAbsent(labels[1], () => (hour2));
    dataMap.putIfAbsent(labels[2], () => (hour3));
    dataMap.putIfAbsent(labels[3], () => (hour4));
    dataMap.putIfAbsent("Other", () => left);
  }

  @override
  Widget build(BuildContext context) {
    getDate();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black87),
        child: Column(
          children: <Widget>[
            Text(
                "\n" + day + ", " + month + " " + (date.day).toString() + "\n\n",
                style: TextStyle(fontSize: 40, fontFamily: 'Georgia', color: Colors.blue[900])
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 1000),
                chartLegendSpacing: 32.0,
                chartRadius: MediaQuery.of(context).size.width/2,
                showChartValuesInPercentage: true,
                showChartValues: true,
                showChartValuesOutside: false,
                chartValueBackgroundColor: Colors.grey[200],
                colorList: colorList,
                showLegends: true,
                legendPosition: LegendPosition.right,
                decimalPlaces: 1,
                showChartValueLabel: true,
                initialAngle: 0,
                legendStyle: TextStyle(
                  color: Colors.white,
                ),
                chartValueStyle: defaultChartValueStyle.copyWith(
                  color: Colors.blueGrey[900].withOpacity(0.9),
                ),
                chartType: ChartType.ring,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child:FlatButton(
                  color: Colors.blue[900],
                  textColor: Colors.white,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogPage(title:'Log')),
                    );
                  },
                  child: Text(
                    'Log More',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
              ),
            ),
            Container(
             margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child:FlatButton(
                color: Colors.blue[900],
                textColor: Colors.white,
                onPressed: (){
                 Navigator.push(
                  context,
                 MaterialPageRoute(builder: (context) => CalendarPage(title:'Calendar')),
                );
               },
               child: Text(
                'Go to Calendar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
               )
              ),
            ),

          ],
        ),
      ),
    );
  }
}