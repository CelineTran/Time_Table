import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:pie_chart/pie_chart.dart';
import 'setup.dart';
import 'log.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _controller;
  Map<DateTime, List <dynamic>> _events;
  Map<String, double> dataMap = new Map();


  List<Color> colorList = [
    Color(colorL[0]),
    Color(colorL[1]),
    Color(colorL[2]),
    Color(colorL[3]),
    Colors.blue,
  ];

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
  void initState(){
    super.initState();
    getTimes();
    dataMap.putIfAbsent(labels[0], () => (hour1));
    dataMap.putIfAbsent(labels[1], () => (hour2));
    dataMap.putIfAbsent(labels[2], () => (hour3));
    dataMap.putIfAbsent(labels[3], () => (hour4));
    dataMap.putIfAbsent("Other", () => left);
    _controller = CalendarController();
    _events ={};
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map){
    Map<String,dynamic> newMap = {};
    map.forEach((key, value){
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map){
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value){
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

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

  @override
  Widget build(BuildContext context) {
    getDate();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogPage(title:'Log')),
                );
              },
            )
          ],
        ),
        body: Container(
            decoration: BoxDecoration(color: Colors.black87),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              TableCalendar(
                  calendarController: _controller,
                  events: _events,
                  calendarStyle: CalendarStyle(
                    outsideStyle: TextStyle(color: Colors.white60),
                    outsideWeekendStyle: TextStyle(color: Colors.white60),
                    weekdayStyle: TextStyle(color: Colors.white70),
                    weekendStyle: TextStyle(color: Colors.white),
                    selectedColor: Theme.of(context).primaryColor,
                    todayStyle: TextStyle(color: Colors.white),
                  ),
                  headerStyle: HeaderStyle(
                    titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
                    centerHeaderTitle: true,
                    rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
                    leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.white54),
                    weekendStyle: TextStyle(color: Colors.white),
                  ),
                onDaySelected: (date, events){
                    //do something
                },
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                child: PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 1000),
                  chartLegendSpacing: 32.0,
                  chartRadius: MediaQuery.of(context).size.width/2.7,
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
            ]
          )
        )
    );
  }
}
