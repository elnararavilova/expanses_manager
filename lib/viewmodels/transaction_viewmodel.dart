import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionViewModel extends ChangeNotifier {
  List<Transaction> _expenses = [];
  List<Transaction> _incomes = [];

  List<Transaction> get expenses => _expenses;
  List<Transaction> get incomes => _incomes;

  void addExpense(Transaction expense) {
    _expenses.add(expense);
    notifyListeners();
  }

  void updateExpense(Transaction updatedExpense) {
    final index = _expenses.indexWhere((expense) => expense.id == updatedExpense.id);
    if (index != -1) {
      _expenses[index] = updatedExpense;
      notifyListeners();
    }
  }

  void deleteExpense(String id) {
    _expenses.removeWhere((expense) => expense.id == id);
    notifyListeners();
  }

  void addIncome(Transaction income) {
    _incomes.add(income);
    notifyListeners();
  }

  void updateIncome(Transaction updatedIncome) {
    final index = _incomes.indexWhere((income) => income.id == updatedIncome.id);
    if (index != -1) {
      _incomes[index] = updatedIncome;
      notifyListeners();
    }
  }

  void deleteIncome(String id) {
    _incomes.removeWhere((income) => income.id == id);
    notifyListeners();
  }
}
