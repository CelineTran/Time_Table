import 'package:flutter/material.dart';
import 'setup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Table',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Time Table'),
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          decoration: BoxDecoration(color: Colors.black87),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Icon(
                Icons.done_all,
                size: 100,
                color: Colors.blue[900],
              ),
            ),
            Container(
              child: RichText(
                text: TextSpan(
                  text: '\n  WELCOME',
                  style: TextStyle(fontSize: 50, fontFamily: 'Georgia', color: Colors.blue[900]),
                  children: <TextSpan>[
                    TextSpan(text: '\n   TO YOUR DAILY TIME TRACKER!', style:TextStyle(fontSize: 20)),
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
                      'tap to continue... ',
                        style: TextStyle(fontStyle: FontStyle.italic, fontFamily: 'Georgia', fontSize: 20, color: Colors.blue[900]),
                    )
                  )
                )
              )
            )
            ]
          )
        )
    );
  }
}
