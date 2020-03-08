import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start, it is the default
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //Wrapped Card widget in container in order to change size
          //as a Card widgets size is based on the Text size
          Container(
            width: double.infinity,
            //Card: Pre-styled container widget. Using to hold chart
            child: Card(
              color: Colors.blueAccent,
              child: Text('Add chart here'),
              elevation: 5,
            ),
          ),
          UserTransactions(),
        ],
      ),
    );
  }
}
