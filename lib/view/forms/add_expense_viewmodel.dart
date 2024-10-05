import 'dart:developer';

import 'package:expense_tracker/helper/hive_data_helper.dart';
import 'package:expense_tracker/helper/route_helper.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widget_helpers/toast_msg.dart';
import 'package:flutter/material.dart';

class AddExpenseViewmodel extends ChangeNotifier {
  final amountController = TextEditingController();
  String date = "";
  String category = "";
  String type = '';
  int categoryId = 0;
  int expenseId = 0;

  List allItems = [];

  void getAllJsonData() async {
    allItems = await HiveJsonHelper.getAllJsonData();
    notifyListeners();
  }

  void updateCategory(String value) {
    category = value;
    if (value == "Home") {
      categoryId = 0;
    } else if (value == "Food") {
      categoryId = 1;
    } else if (value == "Bills") {
      categoryId = 2;
    } else {
      categoryId = 3;
    }
    notifyListeners();
  }

  void updateDate(String value) {
    date = value;
    log(date);
    notifyListeners();
  }

  void updateType(String value) {
    type = value;

    if (value == "Income") {
      expenseId = 0;
    } else {
      expenseId = 1;
    }
    notifyListeners();
  }

  void saveData(BuildContext context) {
    getAllJsonData();
    ExpenseData data = ExpenseData(
      id: allItems.length.toString(),
      index: allItems.length,
      expenseId: expenseId,
      amount: double.parse(amountController.text),
      date: date,
      categoryId: categoryId,
    );

    HiveJsonHelper.addJsonData(data.toJson());
    showToast(context, "Saved successfully");
    Go.back(context);
  }
}
