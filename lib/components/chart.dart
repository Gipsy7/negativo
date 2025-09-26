import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:negativo/components/chart_bar.dart';
import 'package:negativo/models/transaction.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      String day = DateFormat.E().format(weekDay).substring(0, 1);

      double totalSum = 0.0;

       totalSum += recentTransactions.where((tx) {
         return tx.date.day == weekDay.day &&
             tx.date.month == weekDay.month &&
             tx.date.year == weekDay.year;
       }).fold(0.0, (sum, tx) => sum + tx.value);

      return {
        'day': day,
        'value': totalSum,
      };
    }).reversed.toList();
  }

    double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr){
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: tr['day'].toString(),
                  value: double.parse(tr['value'].toString()),
                  percentage: tr['value'] as double == 0 ? 0 : (tr['value'] as double) / _weekTotalValue,
                ),
              );
            })
            .toList(),
        ),
      ),
    );
  }
}