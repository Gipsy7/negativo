import 'dart:math';

import 'package:flutter/material.dart';
import 'package:negativo/components/chart.dart';
import 'package:negativo/components/transaction_form.dart';
import 'package:negativo/components/transaction_list.dart';
import 'package:negativo/models/transaction.dart';
import 'package:google_fonts/google_fonts.dart';

main() {
  runApp(Negativo());
}

class Negativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        textTheme: GoogleFonts.orbitronTextTheme(),
        primaryColor: Color(0xFF0A2342), // Azul escuro Godzilla
        primaryColorDark: Color(0xFF071A2C), // Azul quase preto
        primaryColorLight: Color(0xFF1E5A99), // Azul mais claro
        scaffoldBackgroundColor: Color(0xFF101C2C), // Fundo cinza/azul escuro
        cardColor: Color(0xFF162447), // Azul neon dos espinhos
        primaryIconTheme: IconThemeData(color: Color(0xFF00B4D8)), // Ícones azul neon
        primaryTextTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        hintColor: Colors.white70,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A2342),
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFF00B4D8)),
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: GoogleFonts.orbitron().fontFamily,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF00B4D8),
          foregroundColor: Colors.white,
        ), colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Color(0xFF00B4D8),
          backgroundColor: Color(0xFF101C2C),
          cardColor: Color(0xFF162447),
          errorColor: Color(0xFFB00020),
        ).copyWith(
          secondary: Color(0xFF00B4D8), // Azul neon para botões/flutuantes
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          surface: Color(0xFF162447),
          onSurface: Colors.white,
        ).copyWith(secondary: Color(0xFF00B4D8)),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _transactions = [
    Transaction(
      id: '1',
      title: 'Conta de Antiga',
      value: 100.0,
      date: DateTime.now().subtract(  Duration(days: 33)),
    ),
    Transaction(id: '2', title: 'Boleto', value: 200.0, date: DateTime.now()),
    Transaction(
      id: '3',
      title: 'Mensalidade escola',
      value: 300.0,
      date: DateTime.now().subtract(  Duration(days: 5)),
    ),
    Transaction(
      id: '3',
      title: 'Mensalidade escola',
      value: 300.0,
      date: DateTime.now().subtract(  Duration(days: 1)),
    ),
    Transaction(
      id: '3',
      title: 'Mensalidade escola',
      value: 300.0,
      date: DateTime.now().subtract(  Duration(days: 2)),
    ),
    Transaction(
      id: '3',
      title: 'Mensalidade escola',
      value: 300.0,
      date: DateTime.now().subtract(  Duration(days: 4)),
    ),
    Transaction(
      id: '3',
      title: 'Mensalidade escola',
      value: 300.0,
      date: DateTime.now().subtract(  Duration(days: 6)),
    ),
    Transaction(
      id: '3',
      title: 'Mensalidade escola',
      value: 300.0,
      date: DateTime.now().subtract(  Duration(days: 3)),
    ),
    Transaction(
      id: '3',
      title: 'Mensalidade escola',
      value: 300.0,
      date: DateTime.now().subtract(  Duration(days: 5)),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

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
        title: Row(
          children: [
            Image.asset(
              'assets/ChatGPT Image 25 de set. de 2025, 21_52_13.png', // nome do arquivo do ícone
              height: 32,
              width: 32,
            ),
            SizedBox(width: 8),
            Text(
              'Contabizilla',
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _openTransactionFormModal(context);
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.5, // Deixa a imagem discreta
              child: Image.asset(
                'assets/4e7971ee-9710-4dca-9990-bcf12a93b5f6.png', // Caminho da imagem
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Chart(_recentTransactions),
                TransactionList(_recentTransactions),
                SizedBox(height: 500), // Espaço extra para rolagem
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _openTransactionFormModal(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
