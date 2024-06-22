import 'dart:async';
import 'dart:core';
import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotifications {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String>();

  static void onNotificationTap(NotificationResponse notificationResponse) {
    onNotifications.add(notificationResponse.payload!);
  }

  static Future init() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {
        onNotifications.add('$id $title $body $payload');
      },
    );
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: onNotificationTap,
    );
  }

  Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }

  Future showShuduledNotification({
    required int id,
    required String title,
    required String payload,
    required DateTime sheduleDate,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    tz.initializeTimeZones();
// Get the local timezone string
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();

// Set the local location
    tz.setLocalLocation(tz.getLocation(timeZoneName));
    //set now locan time
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime.from(sheduleDate, tz.local);

    // Check if the scheduledDate is in the past, and if so, add a 5 minutes to it
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(minutes: 5));
    }

    try {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        "Don't ignore your reminder",
        scheduledDate,
        notificationDetails,
        payload: payload,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
      //call the on notification received function when it is triggred
      Timer(scheduledDate.difference(now), () {
        onNotificationReceived(id);
      });
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  void cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

//call reminders cubit with the triggred reminder id
  static void onNotificationReceived(int id) async {
    log(id.toString());
  }
}
