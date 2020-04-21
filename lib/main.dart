import 'package:flutter/material.dart';
import 'setup.dart';
import 'calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '24 Hours',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '24 Hours'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarPage(title:'Calendar')),
              );
            },
          )
        ],
      ),
      body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: Icon(
                Icons.done_all,
                size: 100,
                color: Colors.blue[900],
              ),
            ),
            Container(
              child: RichText(
                text: TextSpan(
                  text: '   WELCOME',
                  style: TextStyle(fontSize: 50, fontFamily: 'Roboto', color: Colors.blue[900], fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(text: '\n  TO YOUR DAILY TIME TRACKER!', style:TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SetupPage(title:'Setup')),
                      );
                    },
                    child: Text(
                      'tap get to logging! ',
                        style: TextStyle(fontStyle: FontStyle.italic, fontFamily: 'Georgia', fontSize: 20, color: Colors.blue[900]),
                    )
                  )
                )
              )
            )
            ]
          )
    );
  }
}
