import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransacationValues {
    //generate is a utility constructor on the list class
    return List.generate(7, (index) {
      //Keep subtracting a day from current date in order to get previous week
      final weekDay = DateTime.now().subtract(Duration(days: index),);
      var totalSum = 0.0;

      //Loop to get the total transaction amount for a particular day
      for (var tx in recentTransaction) {
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          totalSum += tx.amount;
        }
      }
      //Returning a map that conatins the day and amount
      return {
        //Dateformat from intl package. DateFormat.E gives the first letter of the weekday
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(children: <Widget>[]),
    );
  }
}
