import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter/material.dart';

class NotificationService extends ChangeNotifier {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  
  static const int NOTIFICATION_ID = 0;

  NotificationService() {
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
          onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {
            // Handle iOS notification when app is in foreground
          }
        );
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
        // Handle notification tap
        if (notificationResponse.payload == 'add_expense') {
          // Navigate to add expense page
          navigateToAddExpensePage();
        }
      },
    );

    // Schedule the daily reminder automatically
    await scheduleExpenseReminder();
  }

  Future<void> scheduleExpenseReminder() async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      20, // 8 PM
      0,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      NOTIFICATION_ID,
      'Expense Reminder',
      'Don\'t forget to track your expenses today!',
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'expense_reminder_channel',
          'Expense Reminders',
          channelDescription: 'Daily reminders to track expenses',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'add_expense',
    );

    notifyListeners();
  }

  void navigateToAddExpensePage() {
   
  }

  Future<void> cancelNotification() async {
    await _flutterLocalNotificationsPlugin.cancel(NOTIFICATION_ID);
    notifyListeners();
  }
}
