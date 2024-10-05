import 'package:expense_tracker/helper/route_helper.dart';
import 'package:expense_tracker/view/onboarding/screens/screen1.dart';
import 'package:expense_tracker/view/onboarding/screens/screen2.dart';
import 'package:expense_tracker/view/onboarding/screens/screen3.dart';
import 'package:expense_tracker/view/profile/create%20profile/create_profile.dart';
import 'package:flutter/material.dart';

class OnboardingViewmodel extends ChangeNotifier {
  double progress = 0.33;
  String buttonText = "Next";

  int _bottomNavIndex = 0;
  int get bottomNavIndex => _bottomNavIndex;

  final _pageController = PageController();
  PageController get pageController => _pageController;

  void changeIndex(BuildContext context,int index) {
    _bottomNavIndex = index;
    if (bottomNavIndex == 2) {
    } else {
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceInOut);
    }

    if (bottomNavIndex == 1) {
      progress = 0.66;
      buttonText = "Continue";
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceInOut);
    }
    if (bottomNavIndex == 2) {
      progress = 1.0;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceInOut);
    }
    if(bottomNavIndex == 3){
      Go.to(context, CreateProfile());
    }

    print(bottomNavIndex);

    notifyListeners();
  }

  List buildScreen = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];
}
