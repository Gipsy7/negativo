import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final _baseColor = const Color.fromARGB(255, 216, 19, 95);

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                  TextField(
                    controller: valueController,
                    decoration: InputDecoration(
                      labelText: 'Valor (R\$)',
                    ),
                  ),
                  TextButton(onPressed:   (){
                    final title = titleController.text.isEmpty ? 'Gasto aleatório' : titleController.text;
                    final value = double.tryParse(valueController.text) ?? 0.0;
                    onSubmit(title, value);
                  },
                    child: Text('Adicionar transação', style: TextStyle(color: _baseColor),
                    ),
                  ),
                ]
              ),
            )
          );
  }
}