
import 'dart:async';
import 'dart:convert';
import 'expense.dart';
import 'package:flutter/services.dart';

Future<String> _loadexpensesAsset() async {
  return await rootBundle.loadString('jsons/expenses.json');
}
Future loadexpenses() async
{
  String jsonExpenses = await _loadexpensesAsset();
  //print(jsonExpenses);
  Expense expense = _parseJsonForExpenses(jsonExpenses);

  //print(expense.merchant);

}

Expense _parseJsonForExpenses(String jsonString)
{
  Map decoded = jsonDecode(jsonString);

  List<CashDetail> cash = new List<CashDetail>();
  print(decoded["cart 1"]['name']);
//  for (var exp in decoded['expenses']) {
//    cash.add(new CashDetail(exp['amount'], exp['currency']));
//  }

  return new Expense(decoded['cart 1']['id'], decoded['cart 2']['name'], new ExpenseDetail(cash));
}

Expense _parseExpensesToJson(String jsonString, String key, String value)
{
  Map decoded = jsonDecode(jsonString);
  var expense = {"casas": "dsd"};

  var user = json.encode(expense);
  Map<String, String>content= {key: value};
  //var data = json.encode();
}