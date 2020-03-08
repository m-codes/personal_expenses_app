import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date; //Built into dart

  //{} makes them named arguments and automatically bounds them to there var name
  Transaction({
    //required is not a dart package, must be import 'foundaton.dart' from flutter
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}
