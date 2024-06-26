import 'package:expense_manager/screens/edit_income_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/transaction_viewmodel.dart';
import '../viewmodels/theme_viewmodel.dart';

class IncomesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionViewModel = Provider.of<TransactionViewModel>(context);
    final themeViewModel = Provider.of<ThemeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Доходы'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/addIncome');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: transactionViewModel.incomes.length,
        itemBuilder: (context, index) {
          final income = transactionViewModel.incomes[index];
          return ListTile(
            title: Text('${income.title} - ${income.amount.toStringAsFixed(2)} ${themeViewModel.currency}'),
            onTap: () {
              Navigator.pushNamed(context, '/incomeDetail', arguments: income);
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditIncomeScreen(income: income),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    transactionViewModel.deleteIncome(income.id);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
