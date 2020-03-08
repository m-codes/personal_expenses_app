import 'package:flutter/material.dart';
import 'package:personal_expenses_app/transaction.dart';

import './transaction.dart';

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
  //Hold a list of Transactions. Transactions being the object I created (NOT a widget)
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Petrol',
      amount: 45,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Food Shopping',
      amount: 45,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          Column(
            //Map gives an iterable, using to list in order to produce a list of widgets
            //map takes a function, that gets executed on everything in transactions list
            children: transactions.map((tran) {
              return Card(
                child: Text(tran.title),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
