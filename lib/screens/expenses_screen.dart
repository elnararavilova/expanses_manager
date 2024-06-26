import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/transaction_viewmodel.dart';
import '../viewmodels/theme_viewmodel.dart';
import 'edit_expense_screen.dart';

class ExpensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionViewModel = Provider.of<TransactionViewModel>(context);
    final themeViewModel = Provider.of<ThemeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Расходы'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/addExpense');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: transactionViewModel.expenses.length,
        itemBuilder: (context, index) {
          final expense = transactionViewModel.expenses[index];
          return ListTile(
            title: Text('${expense.title} - ${expense.amount.toStringAsFixed(2)} ${themeViewModel.currency}'),
            onTap: () {
              Navigator.pushNamed(context, '/expenseDetail', arguments: expense);
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditExpenseScreen(expense: expense),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    transactionViewModel.deleteExpense(expense.id);
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
