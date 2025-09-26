import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:negativo/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty ? 
      Column(
        children: [
          SizedBox(height: 20),
          Center(child: Text('Nenhuma transaçãozilla cadastrada', style: TextStyle(color: Colors.white70))),
          SizedBox(height: 20),
          Container(
            height: 200,
            child: Image.asset(
              'assets/4fb1d427-a208-4ea9-9481-abc9973e2a60.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ) : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 35,
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: FittedBox(child: Text('R\$ ${tr.value.toStringAsFixed(2)}',)),
                ),
              ),
              title: Text(
                tr.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
              ),
              subtitle: Text(
                DateFormat('d MMM y').format(tr.date),
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          );
        },

      ),
    );
  }
}