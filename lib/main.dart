import 'package:flutter/material.dart';
import 'package:negativo/models/transaction.dart';

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

  final _transactions = [Transaction(id: '1', title: 'Conta de Luz', value: 100.0, date: DateTime.now()),
                         Transaction(id: '2', title: 'Boleto', value: 200.0, date: DateTime.now()),
                         Transaction(id: '3', title: 'Mensalidade escola', value: 300.0, date: DateTime.now()),
                        ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Negativo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transactions.map((tr) {
              return Card(
                child: Row(children: <Widget>[
                    Container(
                      margin:EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        tr.value.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(tr.title.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(tr.date.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],)
        ]));
            }).toList(),
          )
        ],
      )
    );
  }
}