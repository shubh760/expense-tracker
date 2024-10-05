import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:expense_tracker/consts/color_const.dart';
import 'package:expense_tracker/helper/route_helper.dart';
import 'package:expense_tracker/view/dashboard/dashboard_provider.dart';
import 'package:expense_tracker/view/forms/add_expense_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, model, child) {
      return Scaffold(
        extendBody: true,
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: PageView.builder(
            itemCount: model.buildScreen.length,
            controller: model.pageController,
            itemBuilder: (context, index) {
              return model.buildScreen[index];
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Go.animateTo(context, AddExpenseView());
          },
          shape: const CircleBorder(),
          child: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: colors.gradientColor,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: const Center(
              child: Icon(
                Icons.add_rounded,
                size: 45,
                color: colors.disableColor,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            return Icon(
              iconList[index],
              size: 34,
              color: isActive ? colors.blackColor : colors.disableColor,
            );
          },
          activeIndex: model.bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.smoothEdge,
          onTap: (index) => model.changeBottomNavIndex(index),
        ),
      );
    });
  }
}

List<IconData> iconList = [
  Icons.home,
  Icons.menu,
];
