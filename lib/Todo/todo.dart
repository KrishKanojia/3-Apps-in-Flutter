import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<dynamic> lst = [];
  String output = "";

  List<bool> checking = [];

  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Todo App",
        ),
      ),
      body: ListView.builder(
          itemExtent: 106.0,
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 3,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.grey[300],
                height: 50,
                margin: EdgeInsets.only(top: 15),
                child: ListTile(
                  title: Container(
                    width: 50,
                    child: Row(
                      children: [
                        VerticalDivider(
                          color: Color(0xff6C63FF),
                          thickness: 5,
                          indent: 10,
                          endIndent: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              checking[index] = !checking[index];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff6C63FF)),
                            child: checking[index]
                                ? Icon(
                                    Icons.check,
                                    size: 25.0,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.circle,
                                    size: 25.0,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          lst[index],
                        ),
                      ],
                    ),
                  ),
                  trailing: Container(
                    width: 50.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Update Item",
                                        style: TextStyle(
                                          color: Color(0xff6C63FF),
                                        ),
                                      ),
                                      content: TextField(
                                        onChanged: (value) {
                                          output = value.toString();
                                        },
                                        decoration: new InputDecoration(
                                          border: new OutlineInputBorder(
                                            borderSide: new BorderSide(
                                              color: Color(0xff6C63FF),
                                            ),
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            setState(() {
                                              lst.replaceRange(
                                                  index, index + 1, {output});
                                            });
                                          },
                                          child: Text(
                                            "OK",
                                            style: TextStyle(
                                              color: Color(0xff6C63FF),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Icon(Icons.edit, color: Color(0xff6C63FF)),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  lst.removeAt(index);
                                });
                              },
                              child: Icon(
                                Icons.delete,
                                color: Color(0xff6C63FF),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Add Item",
                  style: TextStyle(
                    color: Color(0xff6C63FF),
                  ),
                ),
                content: TextField(
                  onChanged: (value) {
                    output = value.toString();
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        lst.add(output);
                        checking.add(false);
                      });
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(
                        color: Color(0xff6C63FF),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Color(0xff6C63FF),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
