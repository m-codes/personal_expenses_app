import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  //Hold a list of Transactions. Transactions being the object I created (NOT a widget)
  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String tranTitle, double tranAmount) {
    final newTran = Transaction(
      title: tranTitle,
      amount: tranAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(), //Temporary ID
    );

    setState(() {
      _userTransactions.add(newTran);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
