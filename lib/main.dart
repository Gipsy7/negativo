import 'package:flutter/material.dart';
import 'package:negativo/components/transaction_form.dart';
import 'package:negativo/components/transaction_list.dart';
import 'package:negativo/components/transaction_user.dart';
import 'package:negativo/models/transaction.dart';
import 'package:intl/intl.dart';

main() {
  runApp(Negativo());
}

class Negativo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Negativo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          TransactionUser()
        ],
      )
    );
  }
}