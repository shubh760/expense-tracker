import 'package:expense_tracker/consts/color_const.dart';
import 'package:expense_tracker/view/home/home_screen_viewmodel.dart';
import 'package:expense_tracker/widget_helpers/app_text.dart';
import 'package:expense_tracker/widget_helpers/list_tile_widget.dart';
import 'package:expense_tracker/widget_helpers/spacers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenViewmodel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        model.changeIndex(0);
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(width: 0),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15.0),
                                topLeft: Radius.circular(15.0)),
                            gradient: LinearGradient(
                                colors: model.selectedidx == 0
                                    ? colors.gradientColor
                                    : [
                                        Colors.transparent,
                                        Colors.transparent
                                      ])),
                        child: Center(
                          child: AppText(
                            text: "Monthly",
                            color: model.selectedidx == 0
                                ? colors.tileColor
                                : colors.textColor,
                          ),
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        model.changeIndex(1);
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(width: 0),
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(15.0),
                                topRight: Radius.circular(15.0)),
                            gradient: LinearGradient(
                                colors: model.selectedidx == 1
                                    ? colors.gradientColor
                                    : [
                                        Colors.transparent,
                                        Colors.transparent
                                      ])),
                        child: Center(
                          child: AppText(
                            text: "Weekly",
                            color: model.selectedidx == 1
                                ? colors.tileColor
                                : colors.textColor,
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              verticalSpaceSmall,
              if (model.spentAmount > 0)
                SizedBox(
                  height: 200,
                  child: PieChart(
                    PieChartData(sections: [
                      PieChartSectionData(
                          title: "Home ${model.homeExpense}%",
                          value: model.homeExpense,
                          color: Color.fromARGB(255, 60, 182, 235),
                          titleStyle: CustomTextStyle.textStyle(
                              color: colors.tileColor),
                          radius: 100),
                      PieChartSectionData(
                          title: "Food ${model.foodExpense}%",
                          value: model.foodExpense,
                          color: Color(0xffe17bc1),
                          titleStyle: CustomTextStyle.textStyle(
                              color: colors.tileColor),
                          radius: 100),
                      PieChartSectionData(
                          title: "Bills ${model.billExpense}%",
                          value: model.billExpense,
                          color: Color(0xfff8907b),
                          titleStyle: CustomTextStyle.textStyle(
                              color: colors.tileColor),
                          radius: 100),
                      PieChartSectionData(
                          title: "Others ${model.otherExpense}%",
                          value: model.otherExpense,
                          color: Color(0xffc16afd),
                          titleStyle: CustomTextStyle.textStyle(
                              color: colors.tileColor),
                          radius: 100),
                    ], sectionsSpace: 0, centerSpaceRadius: 0),
                    swapAnimationDuration: Duration(milliseconds: 150),
                    swapAnimationCurve: Curves.linear,
                  ),
                ),
              if (model.spentAmount > 0)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child:
                        AppText(text: "Total Expense : \$${model.spentAmount}"),
                  ),
                ),
              verticalSpaceRegular,
              AppText(
                  text: model.selectedidx == 0 ? "This Month" : "This Week"),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.analyticList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomListTile(
                        data: model.analyticList[index],
                      ),
                    );
                  }),
            ],
          ),
        ),
      );
    });
  }
}
