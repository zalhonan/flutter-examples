import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/main.dart';
import 'screen1.dart';
import 'screen2.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Screen 0'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                color: Colors.red,
                child: Text('Go To Screen 1'),
                onPressed: () {
                  //Navigate to Screen 1
                  // для передачи данных в путь используется параметр arguments. Передаем лист
                  Navigator.pushNamed(context, '/one',
                      arguments: ['Джигурда был тут', 1]);
                },
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text('Go To Screen 2'),
                onPressed: () {
                  // для передачи данных в путь используется параметр arguments
                  Navigator.pushNamed(context, '/two', arguments: 'Джигурда');
                },
              ),
              // для обращения к данным используется дата объект и поле в нем
              Text('${Provider.of<Data>(context).data}'),
              // если не нужно слушать изменения - ставится listen: false
              Text('${Provider.of<Data>(context, listen: false).data}'),
              // для изменения используется метод дата-объекта changeString
              TextField(
                onChanged: (newText) {
                  Provider.of<Data>(context).changeString(newText);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
