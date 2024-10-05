import 'dart:convert';

ExpenseData expenseDataFromJson(String str) =>
    ExpenseData.fromJson(json.decode(str));

String expenseDataToJson(ExpenseData data) =>
    json.encode(data.toJson());

class ExpenseData {
  String? id;
  int? index;
  double? amount;
  int? categoryId;
  int? expenseId;
  String? date;

  ExpenseData({
    this.id,
    this.index,
    this.amount,
    this.categoryId,
    this.expenseId,
    this.date,
  });

  ExpenseData copyWith({
    String? id,
    int? index,
    double? amount,
    int? categoryId,
    int? expenseId,
    String? date,
  }) =>
      ExpenseData(
        id: id ?? this.id,
        index: index ?? this.index,
        amount: amount ?? this.amount,
        categoryId: categoryId ?? this.categoryId,
        expenseId: expenseId ?? this.expenseId,
        date: date ?? this.date,
      );

  factory ExpenseData.fromJson(Map<String, dynamic> json) => ExpenseData(
        id: json["id"],
        index: json["index"],
        amount: (json["amount"] as num).toDouble(),
        categoryId: json["category_id"],
        expenseId: json["expense_id"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "index": index,
        "amount": amount,
        "category_id": categoryId,
        "expense_id": expenseId,
        "date": date,
      };
}
