import 'dart:math';

import 'package:flutter/material.dart';
import 'package:negativo/components/transaction_form.dart';
import 'package:negativo/components/transaction_list.dart';
import 'package:negativo/models/transaction.dart';

main() {
  runApp(Negativo());
}

class Negativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _baseColor = const Color.fromARGB(255, 216, 19, 95);

  final _transactions = [
    Transaction(
      id: '1',
      title: 'Conta de Luz',
      value: 100.0,
      date: DateTime.now(),
    ),
    Transaction(id: '2', title: 'Boleto', value: 200.0, date: DateTime.now()),
    Transaction(
      id: '3',
      title: 'Mensalidade escola',
      value: 300.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'Mensalidade escola',
      value: 300.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'Mensalidade escola',
      value: 300.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'Mensalidade escola',
      value: 300.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'Mensalidade escola',
      value: 300.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'Mensalidade escola',
      value: 300.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'Mensalidade escola',
      value: 300.0,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Negativo'),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {_openTransactionFormModal(context);})],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(child: Text('Gráfico'), elevation: 5),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: _baseColor,
        foregroundColor: Colors.white,
        onPressed: () {_openTransactionFormModal(context);},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
