import 'package:flutter/material.dart';

class TransactionAddButton extends StatelessWidget {

  final void Function(BuildContext) _openTransactionFormModal;
  final void Function() _playSound;
  const TransactionAddButton(this._openTransactionFormModal, this._playSound);

  @override
  Widget build(BuildContext context) {
      return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _openTransactionFormModal(context);
          _playSound();
        },
      );
  }
}