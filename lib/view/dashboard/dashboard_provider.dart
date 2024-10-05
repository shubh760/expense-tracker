import 'package:expense_tracker/view/analytics/analytics_view.dart';
import 'package:expense_tracker/view/home/home_screen_view.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  int _bottomNavIndex = 0;
  int get bottomNavIndex => _bottomNavIndex;

  final _pageController = PageController();
  PageController get pageController => _pageController;

  void changeBottomNavIndex(int index) {
    _bottomNavIndex = index;
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
    notifyListeners();
  }

  List buildScreen = [
    const HomeScreenView(),
    const AnalyticsView(),
  ];
}
