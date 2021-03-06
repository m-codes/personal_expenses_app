import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  //Spending percentage total, needed to know percentage of bar to colour in
  final double spendingPctOfTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            //Container added to keep chart form if large numbers entered
            Container(
                height: constraints.maxHeight * .15,
                //toStringAsFixed(0) to remove all decimal places
                //FitedBox makes the label shrink to fit size, as opposed to starting new line
                child: FittedBox(
                    child: Text('\€${spendingAmount.toStringAsFixed(0)}'))),
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            //Conatins the actual bar being displayed
            Container(
              height: constraints.maxHeight * .6,
              width: 10,
              //Stack allows widgets to overlay eachother
              child: Stack(
                children: <Widget>[
                  //Start with base widget (furthest back)
                  //This is the main container. It will be overlayed with other widgets
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            Container(
              height: constraints.maxHeight * .15,
              //Wrapped in fitted box in case application is run on small device. Text is automatically resized
              child: FittedBox(
                child: Text(label),
              ),
            )
          ],
        );
      },
    );
  }
}
