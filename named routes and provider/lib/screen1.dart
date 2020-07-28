import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/main.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // переменная забирает данные из аргументов
    final List args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Screen 1'),
      ),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                RaisedButton(
                  padding: EdgeInsets.all(5.0),
                  color: Colors.red,
                  child: Text('Go Forwards To Screen 2'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/two',
                        arguments: 'hello from page 2');
                  },
                ),
                Text(
                  '${args[0]}',
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${args[1]}',
                ),
                Text('${Provider.of<Data>(context).data}'),
                Text('${Provider.of<Data>(context, listen: false).data}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
