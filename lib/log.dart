import 'package:flutter/material.dart';
import 'setup.dart';
import 'Log2.dart';

class LogPage extends StatefulWidget {
  LogPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {

  Color one = Color(colorL[0]);
  Color two = Color(colorL[1]);
  Color three = Color(colorL[2]);
  Color four = Color(colorL[3]);

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
                    "\n\n          Let's get to logging! \nWhat would you like to log?",
                    style: TextStyle(fontSize: 30, fontFamily: 'Georgia', color: Colors.blue[900]),
                  )
                ),
                Align(
                    alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: FlatButton(
                          onPressed:() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Log2Page(title: labels[0])),
                            );
                          },
                          color: one,
                          textColor: Colors.white,
                          child: Text (
                            labels[0],
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: FlatButton(
                        onPressed:() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Log2Page(title:labels[1])),
                          );
                        },
                        color: two,
                        textColor: Colors.white,
                        child: Text (
                          labels[1],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: FlatButton(
                        onPressed:() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Log2Page(title:labels[2])),
                          );
                        },
                        color: three,
                        textColor: Colors.white,
                        child: Text (
                          labels[2],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: FlatButton(
                        onPressed:() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Log2Page(title:labels[3])),
                          );
                        },
                        color: four,
                        textColor: Colors.white,
                        child: Text (
                          labels[3],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                  ),
                ),
                ],
              ),
            ),
    );
  }
}
