import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  DateTime? selectedDate = DateTime.now();

  _submitForm() {
    final title = "${titleController.text}zilla";
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, selectedDate!);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate as DateTime?;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10 + MediaQuery.of(context).viewInsets.bottom,),
          child: Column(
            children: <Widget>[
              TextField(
                controller: titleController,
                onSubmitted: (value) => _submitForm(),
                decoration: InputDecoration(
                  labelText: 'Títulozilla',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 12),
                ),
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (value) => _submitForm(),
                decoration: InputDecoration(
                  labelText: 'Valorzilla (R\$)',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 12),
                ),
                style: TextStyle(color: Colors.white),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Datazilla: ${selectedDate != null ? DateFormat('dd/MM/yyyy').format(selectedDate!) : 'Nenhuma data selecionada'}',
                        style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: _showDatePicker,
                      child: Text(
                        'Selecionar data',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
                    child: Text('Adicionar', style: GoogleFonts.orbitron()),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Color(0xFF00B4D8),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      elevation: 5,
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
