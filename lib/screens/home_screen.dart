import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/transaction_viewmodel.dart';
import '../viewmodels/theme_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionViewModel = Provider.of<TransactionViewModel>(context);
    final themeViewModel = Provider.of<ThemeViewModel>(context);

    double expense = transactionViewModel.expenses.fold(0, (sum, item) => sum + item.amount);
    double income = transactionViewModel.incomes.fold(0, (sum, item) => sum + item.amount);
    double totalBalance = income - expense;

    return Scaffold(
      appBar: AppBar(
        title: Text('Главная'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Баланс: ${totalBalance.toStringAsFixed(2)} ${themeViewModel.currency}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/expenses');
              },
              child: Text('Расходы'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/incomes');
              },
              child: Text('Доходы'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Text('Настройки'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/network');
              },
              child: Text('Курсы валют'),
            ),
          ],
        ),
      ),
    );
  }
}
