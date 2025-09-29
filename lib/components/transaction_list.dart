import 'package:flutter/material.dart';
import 'package:negativo/components/transaction_Item.dart';
import 'package:negativo/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty ? 
    LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            SizedBox(height: constraints.maxHeight * 0.05,),
            Center(child: Text('Nenhuma transaçãozilla cadastrada', style: TextStyle(color: Colors.white70))),
            SizedBox(height: constraints.maxHeight * 0.05,),
          Container(
            height: constraints.maxHeight * 0.4,
            child: Image.asset(
              'assets/4fb1d427-a208-4ea9-9481-abc9973e2a60.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
      },
    ) : ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        final tr = transactions[index];
        return TransactionItem(tr: tr, onRemove: onRemove);
      },
    
    );
  }
}

