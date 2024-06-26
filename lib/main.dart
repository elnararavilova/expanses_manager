import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/transaction_viewmodel.dart';
import 'viewmodels/theme_viewmodel.dart';
import 'screens/home_screen.dart';
import 'screens/expenses_screen.dart';
import 'screens/incomes_screen.dart';
import 'screens/add_expense_screen.dart';
import 'screens/edit_expense_screen.dart';
import 'screens/add_income_screen.dart';
import 'screens/edit_income_screen.dart';
import 'screens/expense_detail_screen.dart';
import 'screens/income_detail_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/network_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
      ],
      child: Consumer<ThemeViewModel>(
        builder: (context, themeViewModel, child) {
          return MaterialApp(
            title: 'Finance App',
            theme: themeViewModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            initialRoute: '/',
            routes: {
              '/': (context) => HomeScreen(),
              '/expenses': (context) => ExpensesScreen(),
              '/incomes': (context) => IncomesScreen(),
              '/addExpense': (context) => AddExpenseScreen(),
              '/addIncome': (context) => AddIncomeScreen(),
              '/expenseDetail': (context) => ExpenseDetailScreen(),
              '/incomeDetail': (context) => IncomeDetailScreen(),
              '/settings': (context) => SettingsScreen(),
              '/network': (context) => NetworkScreen(),
            },
          );
        },
      ),
    );
  }
}
