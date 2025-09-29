import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:negativo/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });

  final Transaction tr;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            color: Color(0xFF00B4D8),
            borderRadius: BorderRadius.circular(5),
          ),
          width: 90,
          height: 40,
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: FittedBox(child: Text('R\$ ${tr.value.toStringAsFixed(2)}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
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
        trailing: 
        MediaQuery.of(  context).size.width < 480 ?
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            onRemove(tr.id);
          },
        ) :
        TextButton(onPressed: () {
          onRemove(tr.id);
        }, child: const Text('Excluir', style: TextStyle(color: Colors.red),))
      ),
    );
  }
}