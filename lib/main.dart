import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //List to store all operator
  List<String> _operator = ['+', '-', '*', '/'];
  String _currentItemSelected = '+';    //'+' operator will be chosen at the start
  final TextEditingController _a1Numerator = TextEditingController();    //numerator1
  final TextEditingController _b1Denominator = TextEditingController();    //denominator1
  final TextEditingController _a2Numerator = TextEditingController();    //numerator2
  final TextEditingController _b2Denominator = TextEditingController();    //denominator2
  int a1 = 0, b1 = 0, a2 = 0, b2 = 0, a3 = 0, b3 = 0, result = 0;
  String img = "assets/Fraction.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,    //to prevent bottom overload
        backgroundColor: Colors.amber,   //apps background colour
        appBar: AppBar(
          title: Text('Fraction Calculator'),
          backgroundColor: Colors.black,   //appbar background colour
          centerTitle: true,    //make appbar title center
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[  
            //image widget 
            Image.asset(img, height: 150.0, fit: BoxFit.cover),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "a1",
                        contentPadding: EdgeInsets.all(10),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.deepPurpleAccent,
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      controller: _a1Numerator,
                    ),
                  ), 
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "a2",
                        contentPadding: EdgeInsets.all(10),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.deepPurpleAccent,
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      controller: _a2Numerator,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text('______________________'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text('______________________'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "b1",
                        contentPadding: EdgeInsets.all(10),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.deepPurpleAccent,
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      controller: _b1Denominator,
                    ),
                  ), 
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "b2",
                        contentPadding: EdgeInsets.all(10),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.deepPurpleAccent,
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      controller: _b2Denominator,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 0, 30),
                child: Text("Choose Operator:",
                  style: TextStyle(fontSize: 20.0,
                    color: Colors.black38,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 50, 30),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      //Drop Down Button widget to choose operators
                      child: DropdownButton<String>(
                        items: _operator.map((String dropdownStringItem){
                          return DropdownMenuItem<String>(
                            value: dropdownStringItem,
                            child: Text(dropdownStringItem,
                            style: TextStyle(fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        }).toList(),

                        onChanged: (String newValueSelected){
                          // your code to execute, when a menu item is selected from drop down
                          _onDropDownSelectedItem(newValueSelected);  
                        },
                        value: _currentItemSelected,    //select + operator at start
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[ 
                Padding(
                  padding: EdgeInsets.all(5),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      minWidth: 150.0,
                      height: 50,
                      color: Colors.red,
                      splashColor: Colors.indigoAccent,   //make button splash when user clicked
                    child: Text("=",
                      style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: _onPressed,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      minWidth: 150.0,
                      height: 50,
                      color: Colors.red,
                      splashColor: Colors.indigoAccent,   //make button splash when user clicked
                    child: Text("Reset",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: _reset,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Text("Result:",
                  style: TextStyle(fontSize: 20.0,
                    color: Colors.black38,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Text("$a3",
                  style: TextStyle(fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text("______________",
                  style: TextStyle(fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: Text("$b3",
                  style: TextStyle(fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  //Calculation process based on chosen operator
  void _onPressed(){
    setState((){
      a1 = int.parse(_a1Numerator.text);
      b1 = int.parse(_b1Denominator.text);
      a2 = int.parse(_a2Numerator.text);
      b2 = int.parse(_b2Denominator.text);
      if (_currentItemSelected == '+'){
        a3 = (a1 * b2) + (b1 * a2);
        b3 = b1 * b2;
      }
      else if (_currentItemSelected == '-'){
        a3 = (a1 * b2) - (b1 * a2);
        b3 = b1 * b2;
      }
      else if (_currentItemSelected == '*'){
        a3 = a1 * a2;
        b3 = b1 * b2;
      }
      else if (_currentItemSelected == '/'){
        a3 = a1 * b2;
        b3 = b1 * a2;
      }
    });
  }
  

  //Reset all the text field and result text
  void _reset(){
    setState(() {
      _a1Numerator.text = "";
      _b1Denominator.text = "";
      _a2Numerator.text = "";
      _b2Denominator.text = "";
      a3 = 0;
      b3 = 0;
    });
  }

  //Function to call the value (operator) selected by user
  void _onDropDownSelectedItem(String newValueSelected){
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}