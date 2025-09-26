import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  _submitForm(){
    final title = "${titleController.text}zilla";
    final value = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty || value <= 0){
      return;
    }

    widget.onSubmit(title, value);
  }

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
                    onSubmitted: (value) => _submitForm(),
                    decoration: InputDecoration(
                      labelText: 'Títulozilla',
                      labelStyle: TextStyle(color: Colors.white),
                      
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: valueController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (value) => _submitForm(),
                    decoration: InputDecoration(
                      labelText: 'Valorzilla (R\$)',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(onPressed:   (){
                    _submitForm();
                  },
                    child: Text('Adicionar transaçãozilla',style: GoogleFonts.orbitron(),),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      elevation: 5,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]
              ),
            )
          );
  }
}