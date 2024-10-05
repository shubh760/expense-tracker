import 'package:expense_tracker/consts/color_const.dart';
import 'package:expense_tracker/helper/date_utils.dart';
import 'package:expense_tracker/view/forms/add_expense_viewmodel.dart';
import 'package:expense_tracker/view/forms/widgets/custom_dropdown.dart';
import 'package:expense_tracker/view/forms/widgets/gredient_textfield.dart';
import 'package:expense_tracker/view/home/home_screen_viewmodel.dart';
import 'package:expense_tracker/widget_helpers/app_text.dart';
import 'package:expense_tracker/widget_helpers/spacers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExpenseView extends StatelessWidget {
  const AddExpenseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddExpenseViewmodel>(builder: (context, model, child) {
      var size = MediaQuery.of(context).size;
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpaceRegular,
                const AppText(
                  text: "Add Expense",
                  color: colors.textColor,
                  size: 20.0,
                ),
                verticalSpaceRegular,
                GradientNumericTextField(
                  controller: model.amountController,
                  textGradient: const LinearGradient(
                    colors: colors.gradientColor,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: 30.0,
                ),
                verticalSpaceRegular,
                CustomDropdown(
                  items: ["Home", "Food", "Bills", "Others"],
                  onChanged: (value) {
                    model.updateCategory(value ?? "");
                  },
                  value: model.category,
                  hint: "Category",
                ),
                verticalSpaceMedium,
                CustomDropdown(
                  items: ["Income", "Expense"],
                  onChanged: (value) {
                    model.updateType(value ?? "");
                  },
                  value: model.type,
                  hint: "Type",
                ),
                verticalSpaceMedium,
                GestureDetector(
                  onTap: () async {
                    String? date = await showCustomDatePicker(context);
                    if (date != null) {
                      model.updateDate(date);
                    }
                  },
                  child: CustomDropdown(
                    items: [],
                    onChanged: (value) {},
                    value: model.date,
                    hint: model.date != "" ? model.date : "Date",
                  ),
                ),
                verticalSpaceRegular,
                verticalSpaceMedLarge,
                verticalSpaceMedLarge,
                GestureDetector(
                  onTap: () {
                    model.saveData(context);
                    Provider.of<HomeScreenViewmodel>(context, listen: false)
                        .getAllJsonData();
                  },
                  child: Container(
                    height: 50,
                    width: size.width - 40,
                    decoration: BoxDecoration(
                        gradient:
                            const LinearGradient(colors: colors.gradientColor),
                        borderRadius: BorderRadius.circular(18)),
                    child: const Center(
                      child: AppText(
                        text: "Save",
                        color: colors.tileColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
