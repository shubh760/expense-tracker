import 'dart:developer';

import 'package:expense_tracker/helper/hive_data_helper.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreenViewmodel extends ChangeNotifier {
  List<ExpenseData> allItems = [];
  double totalAmount = 0.0;
  double incomingAmount = 0.0;
  double spentAmount = 0.0;
  String? name;
  double homeExpense = 0;
  double foodExpense = 0;
  double billExpense = 0;
  double otherExpense = 0;
  int selectedidx = 0;
  List<ExpenseData> analyticList = [];

  void changeIndex(int index) {
    selectedidx = index;
    if (index == 0) {
      analyticList = filterCurrentMonthExpenses(allItems);
      final totalspentAmount = analyticList.fold(0.0, (sum, expense) {
        if (expense.expenseId == 1) {
          return sum + (expense.amount ?? 0.0);
        }
        return sum;
      });

      double homedata = analyticList.fold(0.0, (sum, expense) {
        if (expense.expenseId == 1 && expense.categoryId == 0) {
          return sum + (expense.amount ?? 0.0);
        }
        return sum;
      });
      double foodData = analyticList.fold(0.0, (sum, expense) {
        if (expense.expenseId == 1 && expense.categoryId == 1) {
          return sum + (expense.amount ?? 0.0);
        }
        return sum;
      });
      double Billdata = analyticList.fold(0.0, (sum, expense) {
        if (expense.expenseId == 1 && expense.categoryId == 2) {
          return sum + (expense.amount ?? 0.0);
        }
        return sum;
      });
      double otherdata = analyticList.fold(0.0, (sum, expense) {
        if (expense.expenseId == 1 && expense.categoryId == 3) {
          return sum + (expense.amount ?? 0.0);
        }
        return sum;
      });
      log(foodData.toString() + "kajdhsfkjahsdf");
      homeExpense = homedata == 0.0 ? 0 : ((homedata / totalspentAmount) * 100);
      foodExpense =
          foodData == otherdata ? 0 : ((foodData / totalspentAmount) * 100);
      billExpense = Billdata == 0.0 ? 0 : ((Billdata / totalspentAmount) * 100);
      otherExpense =
          otherdata == 0.0 ? 0 : ((otherdata / totalspentAmount) * 100);
    }
    if (index == 1) {
      analyticList = filterCurrentWeekExpenses(allItems);
      final totalspentAmount = analyticList.fold(0.0, (sum, expense) {
        if (expense.expenseId == 1) {
          return sum + (expense.amount ?? 0.0);
        }
        return sum;
      });

      double homedata = analyticList.fold(0.0, (sum, expense) {
        if (expense.expenseId == 1 && expense.categoryId == 0) {
          return sum + (expense.amount ?? 0.0);
        }
        return sum;
      });
      double foodData = analyticList.fold(0.0, (sum, expense) {
        if (expense.expenseId == 1 && expense.categoryId == 1) {
          return sum + (expense.amount ?? 0.0);
        }
        return sum;
      });
      double Billdata = analyticList.fold(0.0, (sum, expense) {
        if (expense.expenseId == 1 && expense.categoryId == 2) {
          return sum + (expense.amount ?? 0.0);
        }
        return sum;
      });
      double otherdata = analyticList.fold(0.0, (sum, expense) {
        if (expense.expenseId == 1 && expense.categoryId == 3) {
          return sum + (expense.amount ?? 0.0);
        }
        return sum;
      });

      print(homedata);

      print((homedata / totalspentAmount) * 100);

      homeExpense = homedata != 0.0 ? ((homedata / totalspentAmount) * 100) : 0;
      foodExpense = foodData != 0.0 ? ((foodData / totalspentAmount) * 100) : 0;
      billExpense = Billdata == 0.0 ? 0 : ((Billdata / totalspentAmount) * 100);
      otherExpense =
          otherdata == 0.0 ? 0 : ((otherdata / totalspentAmount) * 100);
    }
    notifyListeners();
  }

  void getAllJsonData() async {
    final allJsonData = await HiveJsonHelper.getAllJsonData();
    allItems = allJsonData.map((json) => ExpenseData.fromJson(json)).toList();
    getTotalAmountData();
    name = await UserPreferences.getName();
    analyticList = filterCurrentMonthExpenses(allItems);
    final totalspentAmount = analyticList.fold(0.0, (sum, expense) {
      if (expense.expenseId == 1) {
        return sum + (expense.amount ?? 0.0);
      }
      return sum;
    });

    double homedata = analyticList.fold(0.0, (sum, expense) {
      if (expense.expenseId == 1 && expense.categoryId == 0) {
        return sum + (expense.amount ?? 0.0);
      }
      return sum;
    });
    double foodData = analyticList.fold(0.0, (sum, expense) {
      if (expense.expenseId == 1 && expense.categoryId == 1) {
        return sum + (expense.amount ?? 0.0);
      }
      return sum;
    });
    double Billdata = analyticList.fold(0.0, (sum, expense) {
      if (expense.expenseId == 1 && expense.categoryId == 2) {
        return sum + (expense.amount ?? 0.0);
      }
      return sum;
    });
    double otherdata = analyticList.fold(0.0, (sum, expense) {
      if (expense.expenseId == 1 && expense.categoryId == 3) {
        return sum + (expense.amount ?? 0.0);
      }
      return sum;
    });

    log(foodData.toString() + "kajdhsfkjahsdf");

    homeExpense = homedata == 0.0 ? 0 : ((homedata / totalspentAmount) * 100);
    foodExpense = foodData == 0.0 ? 0 : ((foodData / totalspentAmount) * 100);
    billExpense = Billdata == 0.0 ? 0 : ((Billdata / totalspentAmount) * 100);
    otherExpense =
        otherdata == 0.0 ? 0 : ((otherdata / totalspentAmount) * 100);
    notifyListeners();
  }

  getTotalAmountData() {
    incomingAmount = allItems.fold(0.0, (sum, expense) {
      print(expense.toJson());
      if (expense.expenseId == 0) {
        return sum + (expense.amount ?? 0.0);
      }
      return sum;
    });

    spentAmount = allItems.fold(0.0, (sum, expense) {
      if (expense.expenseId == 1) {
        return sum + (expense.amount ?? 0.0);
      }
      return sum;
    });

    print(incomingAmount);
    print(spentAmount);
    totalAmount = incomingAmount - spentAmount;
    notifyListeners();
  }

  List<ExpenseData> filterCurrentWeekExpenses(List<ExpenseData> expenses) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');

    // Get today's date
    DateTime today = DateTime.now();

    // Calculate the start (Monday) and end (Sunday) of the current week
    DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(Duration(days: 6));

    // Filter the list for dates that are within the current week
    List<ExpenseData> currentWeekExpenses = expenses.where((expense) {
      DateTime expenseDate = formatter.parse(expense.date!);
      return expenseDate.isAfter(startOfWeek.subtract(Duration(days: 1))) &&
          expenseDate.isBefore(endOfWeek.add(Duration(days: 1)));
    }).toList();

    return currentWeekExpenses;
  }

  List<ExpenseData> filterCurrentMonthExpenses(List<ExpenseData> expenses) {
    // Date format for parsing 'dd MMM yyyy'
    final DateFormat formatter = DateFormat('dd MMM yyyy');

    // Get today's date
    DateTime today = DateTime.now();

    // Calculate the start and end of the current month
    DateTime startOfMonth = DateTime(today.year, today.month, 1);
    DateTime endOfMonth = DateTime(
        today.year, today.month + 1, 0); // Last day of the current month

    // Filter the list for dates that are within the current month
    List<ExpenseData> currentMonthExpenses = expenses.where((expense) {
      DateTime expenseDate = formatter.parse(expense.date!);
      return expenseDate.isAfter(startOfMonth.subtract(Duration(days: 1))) &&
          expenseDate.isBefore(endOfMonth.add(Duration(days: 1)));
    }).toList();

    return currentMonthExpenses;
  }
}
