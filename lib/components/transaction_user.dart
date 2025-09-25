import 'dart:math';

import 'package:flutter/material.dart';
import 'package:negativo/components/transaction_form.dart';
import 'package:negativo/components/transaction_list.dart';
import 'package:negativo/models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final _transactions = [Transaction(id: '1', title: 'Conta de Luz', value: 100.0, date: DateTime.now()),
                         Transaction(id: '2', title: 'Boleto', value: 200.0, date: DateTime.now()),
                         Transaction(id: '3', title: 'Mensalidade escola', value: 300.0, date: DateTime.now()),
                        ];

  _addTransaction(String title, double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_transactions),
        TransactionForm(_addTransaction)
      ],
    );
  }
}