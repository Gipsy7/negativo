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
                  child: Row(children: <Widget>[
                      Container(
                        margin:EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color.fromARGB(255, 0, 202, 238),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${tr.value.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
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
                            color: Colors.white,
                          ),
                        ),
                        Text(DateFormat('d MMM y H:mm').format(tr.date),
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 174, 255),
                          ),
                        ),
                      ],)
          ]));
        },
      ),
    );
  }
}