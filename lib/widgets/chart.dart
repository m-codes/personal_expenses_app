import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransacationValues {
    //generate is a utility constructor on the list class
    return List.generate(
      7,
      (index) {
        //Keep subtracting a day from current date in order to get previous week
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
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
          //Dateformat from intl package. DateFormat.E gives the day abbreviated (e.g. Tue)
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum,
        };
      },
      //Reveresed used so chart bars display oldest to newest, from left to right
    ).reversed.toList();
  }

  double get totalSpending {
    //fold lets you change a list to another type
    //Pass it a starting value and then return a new value in the function, which will be added to starting value
    //sum == currently calculated sum, which is param one (0.0). item == element being looked at
    return groupedTransacationValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //Create a map of widgets based on the generated list
            children: groupedTransacationValues.map(
              (data) {
                //Flexible used to stop large lable of a bar effecting the whole row
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    data['day'],
                    data['amount'],
                    totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      );
  }
}
