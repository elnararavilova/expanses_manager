import 'package:flutter/material.dart';
import '../models/transaction.dart';

class ExpenseDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Transaction expense = ModalRoute.of(context)!.settings.arguments as Transaction;

    return Scaffold(
      appBar: AppBar(
        title: Text('Детали расхода'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Название: ${expense.title}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Описание: ${expense.description}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Сумма: ${expense.amount.toStringAsFixed(2)}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Дата: ${expense.date.toLocal().toString().split(' ')[0]}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
