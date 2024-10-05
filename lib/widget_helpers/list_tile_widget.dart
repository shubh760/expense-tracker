import 'package:expense_tracker/consts/color_const.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widget_helpers/app_text.dart';
import 'package:expense_tracker/widget_helpers/expense_arrow.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final ExpenseData data;
  const CustomListTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return RoundedListTile(
      borderRadius: 18,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: colors.colorGradients[data.categoryId! % 4]),
        child: Center(
          child: Icon(
            icons[data.categoryId! % 4],
            color: colors.tileColor,
          ),
        ),
      ),
      title: AppText(text: categoryList[data.categoryId ?? 0]),
      subtitle: Text(data.amount!.toStringAsFixed(2)),
      // onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

      trailing: Column(
        children: [
          DirectionalArrow(
            id: data.expenseId!,
            size: 20,
          ),
          SizedBox(height: 4),
          Text(data.date!.toString()),
        ],
      ),
    );
  }
}

class RoundedListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry contentPadding;
  final Color backgroundColor;
  final Color shadowColor;
  final double elevation;
  final double borderRadius;

  const RoundedListTile({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.backgroundColor = colors.tileColor,
    this.shadowColor = Colors.grey,
    this.elevation = 2.0,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Material(
        color: backgroundColor,
        elevation: elevation,
        shadowColor: shadowColor,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: ListTile(
              contentPadding: contentPadding,
              leading: leading,
              title: title,
              subtitle: subtitle,
              trailing: trailing,
            ),
          ),
        ),
      ),
    );
  }
}

List<IconData> icons = [
  Icons.home,
  Icons.food_bank,
  Icons.menu,
  Icons.onetwothree
];

List categoryList = ["Home", "Food", "Bills", "Others"];
