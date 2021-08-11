import 'dart:math';

import 'package:crop_planning_techm/services/task_db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService extends GetxController {
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  final dbHelper = TaskDBHelper.instance;

  //initilize
  @override
  void onInit() {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    initLocalNotification();

    super.onInit();
  }

  Future<void> initLocalNotification() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future instantNofitication(
      {@required String title, @required String body}) async {
    var android = AndroidNotificationDetails("id", "channel", "description");

    var ios = IOSNotificationDetails();

    var platform = new NotificationDetails(android: android, iOS: ios);

    await _flutterLocalNotificationsPlugin.show(0, title, body, platform);
  }

  Future scheduledZonedNotification(
      {@required String title,
      @required String body,
      @required String scheduleDate}) async {
    // var interval = RepeatInterval.everyMinute;
    print('SCHEDULED');
    // var bigPicture = BigPictureStyleInformation(
    //     DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
    //     largeIcon: DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
    //     contentTitle: "Demo image notification",
    //     summaryText: "This is some text",
    //     htmlFormatContent: true,
    //     htmlFormatContentTitle: true);

    var android = AndroidNotificationDetails("id", "channel", "description");
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('id', 'channel', 'description');
    //var platform = new NotificationDetails(android: android);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    tz.TZDateTime currentScheduled = _nextScheduledDate(scheduleDate);
    print(currentScheduled);
    if (currentScheduled != null) {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        Random().nextInt(100000),
        title,
        body,
        currentScheduled,
        //_nextInstanceOfReminder(/*hour, minutes*/ taskListModel.taskDateTime),
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        androidAllowWhileIdle: true,
      );
      print('NOTIFICATION SCHEDULED');
    }
  }

  tz.TZDateTime _nextScheduledDate(
      /*int hour, int minutes*/
      String dateTime) {
    DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm").parse(dateTime);
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, tempDate.year,
        tempDate.month, tempDate.day, tempDate.hour, tempDate.minute);
    if (scheduledDate.isBefore(now)) {
      return null;
    }
    return scheduledDate;
  }

  //Cancel notification

  // Future cancelNotification() async {
  //   await _flutterLocalNotificationsPlugin.cancelAll();
  // }
}
