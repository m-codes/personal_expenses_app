import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      //ThemeData is an object not a widget, provided by flutter
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'QuickSand',
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpensSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
              )),
          appBarTheme: AppBarTheme(
            //Assigned a new test theme to appbar. It is based on default text theme (ThemeData.light().textTheme.)
            //copy with allows overwritting of certain values styles
            textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                  fontFamily: 'OpensSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          )),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Petrol',
      amount: 45.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Food Shopping',
      amount: 45.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Shoes',
      amount: 55.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Netflix',
      amount: 10.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Spotify',
      amount: 5.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Takeaway',
      amount: 25.00,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get _recentTransactions {
    //.where is an alternative to a for loop
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String tranTitle, double tranAmount, DateTime chosenDate) {
    final newTran = Transaction(
      title: tranTitle,
      amount: tranAmount,
      date: chosenDate,
      id: DateTime.now().toString(), //Temporary ID
    );

    setState(() {
      _userTransactions.add(newTran);
    });
  }

  //Starts the process of adding a new transaction
  //Takes build context in from the app below (ctx)
  //Then start building the sheet with showModalBottomSheet and
  //passes its own context to the builder
  //Not needed at the moment so (_) is used
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            //return the widget you want to see inside modal sheet
            child: NewTransaction(_addNewTransaction),
            //Stops sheet being closed from tapping
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            //called as an anonomous function in order to pass context
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start, it is the default
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
