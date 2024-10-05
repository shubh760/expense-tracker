import 'package:expense_tracker/consts/color_const.dart';
import 'package:expense_tracker/view/home/home_screen_viewmodel.dart';
import 'package:expense_tracker/widget_helpers/app_text.dart';
import 'package:expense_tracker/widget_helpers/glass_morphic_circle.dart';
import 'package:expense_tracker/widget_helpers/list_tile_widget.dart';
import 'package:expense_tracker/widget_helpers/spacers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  void initState() {
    final provider = Provider.of<HomeScreenViewmodel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      provider.getAllJsonData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenViewmodel>(builder: (context, model, child) {
      var size = MediaQuery.of(context).size;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpaceRegular,
              Row(
                children: [
                  horizontalSpaceRegular,
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        gradient: colors.colorGradients[3],
                        shape: BoxShape.circle),
                  ),
                  horizontalSpaceSmall,
                  Column(
                    children: [
                      const AppText(text: "Welcome!"),
                      AppText(
                        text: model.name ?? "",
                        fontWeight: FontWeight.bold,
                        size: 18.0,
                      )
                    ],
                  )
                ],
              ),
              verticalSpaceRegular,
              Container(
                height: 200,
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: colors.gradientColor,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 8,
                        offset:
                            const Offset(1, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppText(
                      text: "Total Balance",
                      color: colors.tileColor,
                      fontWeight: FontWeight.w500,
                    ),
                    verticalSpaceSmall,
                    AppText(
                      text: "\$${model.totalAmount}",
                      color: colors.tileColor,
                      fontWeight: FontWeight.bold,
                      size: 28.0,
                    ),
                    verticalSpaceSmall,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const GlassmorphicCircleArrow(
                          size: 30,
                          arrowColor: Colors.green,
                        ),
                        horizontalSpaceTiny,
                        Column(
                          children: [
                            const AppText(
                              text: "Income",
                              color: colors.tileColor,
                            ),
                            AppText(
                              text: "\$${model.incomingAmount}",
                              color: colors.tileColor,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const GlassmorphicCircleArrow(
                          size: 30,
                          arrowColor: Colors.red,
                        ),
                        horizontalSpaceTiny,
                        Column(
                          children: [
                            const AppText(
                              text: "Expense",
                              color: colors.tileColor,
                            ),
                            AppText(
                              text: "\$${model.spentAmount}",
                              color: colors.tileColor,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              verticalSpaceRegular,
              const AppText(
                text: "Transaction",
                color: colors.textColor,
                size: 18.0,
              ),
              verticalSpaceRegular,
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.allItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomListTile(
                        data: model.allItems[index],
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
