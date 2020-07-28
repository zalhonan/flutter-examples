import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './angela.dart';

void main() {
  runApp(AmgelaApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Some fancy title'),
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/1.jpg'),
              ),
              Text(
                'Shibari master',
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 40.0,
                  color: Colors.white,
                ),
              ),
              Text(
                'Available for hire',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 20.0,
                  color: Colors.teal.shade100,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 200,
                child: Center(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                    height: 1.0,
                    color: Colors.teal.shade100,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.teal.shade900,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '8-800-555-3535',
                        style: TextStyle(fontFamily: 'Oswald', fontSize: 20.0),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.teal.shade900,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Jigurda@gmail.com',
                        style: TextStyle(fontFamily: 'Oswald', fontSize: 20.0),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.pink,
          child: Icon(Icons.access_time),
        ),
      ),
    );
  }
}
