import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = "";

  Widget btn(String value) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + value;
          });
        },
        child: Text(
          value,
          style: TextStyle(fontSize: 30),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(10),
          primary: Color(0xff3c403c), // <-- Button color
          onPrimary: Color(0xff6C63FF), // <-- Splash color
        ),
      ),
    );
  }

  clearr() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double ans = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = ans.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          "Calculator App",
        ),
      ),
      backgroundColor: Color(0xff3c403c),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                result,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Color(0xFF505450),
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    btn("7"),
                    btn("8"),
                    btn("9"),
                    btn("*"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    btn("4"),
                    btn("5"),
                    btn("6"),
                    btn("-"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    btn("1"),
                    btn("2"),
                    btn("3"),
                    btn("+"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    btn("0"),
                    btn("/"),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ElevatedButton(
                        onPressed: clearr,
                        child: Text(
                          "C",
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                          primary: Color(0xff6C63FF),
                          onPrimary: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ElevatedButton(
                        onPressed: output,
                        child: Text(
                          "=",
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                          primary: Color(0xff6C63FF),
                          onPrimary: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
