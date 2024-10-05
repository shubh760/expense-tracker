import 'package:expense_tracker/services/notification_service.dart';
import 'package:expense_tracker/view/analytics/analytics_viewmodel.dart';
import 'package:expense_tracker/view/dashboard/dashboard_provider.dart';
import 'package:expense_tracker/view/forms/add_expense_viewmodel.dart';
import 'package:expense_tracker/view/home/home_screen_viewmodel.dart';
import 'package:expense_tracker/view/onboarding/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProviders {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<DashboardProvider>(
        create: (context) => DashboardProvider()),
    ChangeNotifierProvider<HomeScreenViewmodel>(
        create: (context) => HomeScreenViewmodel()),
    ChangeNotifierProvider<AddExpenseViewmodel>(
        create: (context) => AddExpenseViewmodel()),
    ChangeNotifierProvider<NotificationService>(
        create: (context) => NotificationService()),
    ChangeNotifierProvider<OnboardingViewmodel>(
        create: (context) => OnboardingViewmodel()),
    ChangeNotifierProvider<AnalyticsViewmodel>(
        create: (context) => AnalyticsViewmodel()),
  ];

  static MultiProvider initializeProvider(Widget child) {
    return MultiProvider(
      providers: providers,
      child: child,
    );
  }
}
