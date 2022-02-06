import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:home_alone/pages/home.dart';
import 'package:home_alone/pages/alarm.dart';
import 'package:home_alone/pages/sms.dart';

void main() async {
  runApp(MaterialApp(initialRoute: '/home', routes: {
    '/home': (context) => Home(),
    '/alarm': (context) => Alarm(),
    '/sms': (context) => SMS(),
  }));
  await AndroidAlarmManager.initialize(); //tarkastaa olemassaolevat hälytykset.
}
