import 'package:flutter/material.dart';
import 'log.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

List labels = new List();
List colorL = new List();
var intTime1 = 0.0;
var intTime2 = 0.0;
var intTime3 = 0.0;
var intTime4 = 0.0;

class SetupPage extends StatefulWidget {
  SetupPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {

  var label1 = "N/A";
  var label2 = "N/A";
  var label3 = "N/A";
  var label4 = "N/A";

  ColorSwatch _tempMainColor;
  Color _tempShadeColor;
  ColorSwatch _mainColor1 = Colors.blue;
  ColorSwatch _mainColor2 = Colors.blue;
  ColorSwatch _mainColor3 = Colors.blue;
  ColorSwatch _mainColor4 = Colors.blue;
  Color _shadeColor = Colors.blue[800];

  void _openDialog1(var num, title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            FlatButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: Text('SUBMIT'),
              onPressed: () {
                Navigator.of(context).pop();
                switch(num){
                  case 1:
                    color1();
                    break;
                  case 2:
                    color2();
                    break;
                  case 3:
                    color3();
                    break;
                  case 4:
                    color4();
                    break;
                }
              },
            ),
          ],
        );
      },
    );
  }

  void color1(){
    setState(() => _mainColor1 = _tempMainColor);
    setState(() => _shadeColor = _tempShadeColor);
  }
  void color2(){
    setState(() => _mainColor2 = _tempMainColor);
    setState(() => _shadeColor = _tempShadeColor);
  }
  void color3(){
    setState(() => _mainColor3 = _tempMainColor);
    setState(() => _shadeColor = _tempShadeColor);
  }
  void color4(){
    setState(() => _mainColor4 = _tempMainColor);
    setState(() => _shadeColor = _tempShadeColor);
  }

  void _openColorPicker(var num) async {
    _openDialog1(
      num,
      "Color picker",
      MaterialColorPicker(
        selectedColor: _shadeColor,
        onColorChange: (color) => setState(() => _tempShadeColor = color),
        onMainColorChange: (color) => setState(() => _tempMainColor = color),
      ),
    );
  }

  void addColorList(){
    colorL.add((_mainColor1).value);
    colorL.add((_mainColor2).value);
    colorL.add((_mainColor3).value);
    colorL.add((_mainColor4).value);
  }

  void addLabels(){
    labels.add(label1);
    labels.add(label2);
    labels.add(label3);
    labels.add(label4);
  }

  @override
  Widget build(BuildContext context) {

    intTime1 = 0.0;
    intTime2 = 0.0;
    intTime3 = 0.0;
    intTime4 = 0.0;

    labels.clear();
    colorL.clear();

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            decoration: BoxDecoration(color: Colors.black87),
            child: Column(
                children: <Widget>[
                  Container(
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "\n Let's get setup! \n",
                          style: TextStyle(fontFamily: 'Georgia', fontSize: 30, color: Colors.blue[900]),
                        )
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Stack(
                        children: <Widget> [
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            width: 300,
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              textCapitalization: TextCapitalization.characters,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: 'Enter your first label!'
                              ),
                              onSubmitted: (text){
                                label1 = text;
                              },
                            )
                          ),
                          Align(
                            alignment: Alignment.topRight,
                              child: Stack (
                                children: <Widget> [
                                  CircleAvatar(
                                    backgroundColor: _mainColor1,
                                    radius: 25,
                                  ),
                                  OutlineButton(
                                    borderSide: BorderSide(color: Colors.transparent),
                                    onPressed: (){
                                      _openColorPicker(1);
                                    },
                                  )
                                ]
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Stack(
                        children: <Widget> [
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              width: 300,
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                textCapitalization: TextCapitalization.characters,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white)
                                    ),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: 'Enter your second label!'
                                ),
                                onSubmitted: (text){
                                  label2 = text;
                                },
                              )
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: Stack (
                                  children: <Widget> [
                                    CircleAvatar(
                                      backgroundColor: _mainColor2,
                                      radius: 25,
                                    ),
                                    OutlineButton(
                                      borderSide: BorderSide(color: Colors.transparent),
                                      onPressed:() {
                                        _openColorPicker(2);
                                      },
                                    )
                                  ]
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Stack(
                        children: <Widget> [
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              width: 300,
                              child: TextField(
                                textCapitalization: TextCapitalization.characters,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white)
                                    ),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: 'Enter your third label!'
                                ),
                                onSubmitted: (text){
                                  label3 = text;
                                },
                              )
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: Stack (
                                  children: <Widget> [
                                    CircleAvatar(
                                      backgroundColor: _mainColor3,
                                      radius: 25,
                                    ),
                                    OutlineButton(
                                      borderSide: BorderSide(color: Colors.transparent),
                                      onPressed:() {
                                        _openColorPicker(3);
                                      },
                                    )
                                  ]
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Stack(
                        children: <Widget> [
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              width: 300,
                              child: TextField(
                                textCapitalization: TextCapitalization.characters,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white)
                                    ),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: 'Enter your fourth label!'
                                ),
                                onSubmitted: (text){
                                  label4 = text;
                                },
                              )
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: Stack (
                                  children: <Widget> [
                                    CircleAvatar(
                                      backgroundColor: _mainColor4,
                                      radius: 25,
                                    ),
                                    OutlineButton(
                                      borderSide: BorderSide(color: Colors.transparent),
                                      onPressed:() {
                                        _openColorPicker(4);
                                      },
                                    )
                                  ]
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        alignment: Alignment.topCenter,
                        child: FlatButton(
                          onPressed: (){
                            addColorList();
                            addLabels();
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LogPage(title:'Log')),
                            );
                          },
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          child: Text(
                            'SAVE!',
                            style: TextStyle(fontSize: 20),
                          )
                        )
                    ),
                  ),
                ]
            )
        )
    );
  }
}