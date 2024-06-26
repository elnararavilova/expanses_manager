import 'package:flutter/material.dart';
import '../models/transaction.dart';

class IncomeDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Transaction income = ModalRoute.of(context)!.settings.arguments as Transaction;

    return Scaffold(
      appBar: AppBar(
        title: Text('Детали дохода'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Название: ${income.title}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Описание: ${income.description}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Сумма: ${income.amount.toStringAsFixed(2)}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Дата: ${income.date.toLocal().toString().split(' ')[0]}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
