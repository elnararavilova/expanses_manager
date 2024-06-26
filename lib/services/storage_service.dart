import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/transaction.dart';

class StorageService {
  static const String _expensesKey = 'expenses';
  static const String _incomesKey = 'incomes';

  Future<void> saveExpense(Transaction expense) async {
    final prefs = await SharedPreferences.getInstance();
    final expenses = await getExpenses();
    expenses.add(expense);
    prefs.setString(_expensesKey, json.encode(expenses.map((e) => e.toJson()).toList()));
  }

  Future<void> saveIncome(Transaction income) async {
    final prefs = await SharedPreferences.getInstance();
    final incomes = await getIncomes();
    incomes.add(income);
    prefs.setString(_incomesKey, json.encode(incomes.map((e) => e.toJson()).toList()));
  }

  Future<List<Transaction>> getExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final expensesString = prefs.getString(_expensesKey);
    if (expensesString != null) {
      final List<dynamic> decoded = json.decode(expensesString);
      return decoded.map((e) => Transaction.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<Transaction>> getIncomes() async {
    final prefs = await SharedPreferences.getInstance();
    final incomesString = prefs.getString(_incomesKey);
    if (incomesString != null) {
      final List<dynamic> decoded = json.decode(incomesString);
      return decoded.map((e) => Transaction.fromJson(e)).toList();
    }
    return [];
  }

  Future<void> deleteExpense(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final expenses = await getExpenses();
    final updatedExpenses = expenses.where((expense) => expense.id != id).toList();
    prefs.setString(_expensesKey, json.encode(updatedExpenses.map((e) => e.toJson()).toList()));
  }

  Future<void> deleteIncome(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final incomes = await getIncomes();
    final updatedIncomes = incomes.where((income) => income.id != id).toList();
    prefs.setString(_incomesKey, json.encode(updatedIncomes.map((e) => e.toJson()).toList()));
  }

  Future<void> updateExpense(Transaction expense) async {
    final prefs = await SharedPreferences.getInstance();
    final expenses = await getExpenses();
    final index = expenses.indexWhere((e) => e.id == expense.id);
    if (index != -1) {
      expenses[index] = expense;
      prefs.setString(_expensesKey, json.encode(expenses.map((e) => e.toJson()).toList()));
    }
  }

  Future<void> updateIncome(Transaction income) async {
    final prefs = await SharedPreferences.getInstance();
    final incomes = await getIncomes();
    final index = incomes.indexWhere((e) => e.id == income.id);
    if (index != -1) {
      incomes[index] = income;
      prefs.setString(_incomesKey, json.encode(incomes.map((e) => e.toJson()).toList()));
    }
  }
}
