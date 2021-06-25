import 'package:apps3_in_1/Calculator/calculator.dart';
import 'package:apps3_in_1/Ecommerce/ecommerce.dart';
import 'package:apps3_in_1/todo/todo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Color(0xff6C63FF),
          ),
          splashColor: Color(0xff6C63FF)),
      routes: {
        "/calculator": (context) => Calculator(),
        "/todo": (context) => Todo(),
        "/ecommerce": (context) => ecommerce(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "assets/calculator.png",
    "assets/todo.png",
    "assets/ecommerce.png",
  ];

  List<String> details = [
    "Calulator App",
    "Todo App",
    "Ecommerce App"
  ];

  List<String> routes = [
    "/calculator",
    "/todo",
    "/ecommerce",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen",
        ),
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, routes[index].toString());
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image(
                          image: AssetImage(
                            images[index],
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff6C63FF),
                                Color(0x00000000),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        alignment: Alignment.bottomLeft,
                        height: 200,
                        child: Text(
                          details[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


   

