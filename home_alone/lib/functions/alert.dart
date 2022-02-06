// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// import 'package:flutter_sms/flutter_sms.dart';
// import 'package:home_alone/pages/sms.dart';
//
//
// bool ok = true;
//
// showAlertDialog(BuildContext context) {
//   Timer t = Timer(Duration(seconds: 15), () {
//     _sendSMS();
//   });
//   // set up the button
//   Widget yesButton = TextButton(
//       child: Text("KYLLÄ"),
//       onPressed: () {
//         if (ok == true) {
//           t.cancel();
//           Navigator.of(context).pop();
//         }
//       });
//
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text("HomeAlone"),
//     content: Text("Onko kaikki hyvin?"),
//     actions: [
//       yesButton,
//     ],
//   );
//
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

// void _getHelp() {
//   Timer t = Timer(Duration(seconds: 15), () {
//     fireAlarm();
//   });

// void fireAlarm() {
//   print('Alarm Fired at ${DateTime.now()}');
// }