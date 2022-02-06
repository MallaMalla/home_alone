import 'package:flutter/material.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/services.dart';
import 'package:home_alone/pages/sms.dart';

class Alarm extends StatefulWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  TextEditingController _hourController = TextEditingController();
  final _minuteController = TextEditingController();
  final TextEditingController _smsHourController = TextEditingController();
  String alarmHour = '';
  String alarmMinutes = '';
  String alarmStopHour = '';
  bool isOn = true;
  int alarmID = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade500,
        title: Text('Hälytyksen asetukset'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/help.jpg'),
                  radius: 50.0,
                ),
              ),
              Divider(
                height: 90.0,
                thickness: 1,
                color: Colors.brown.shade700,
              ),
              Text(
                'Hälytyksen aloitusajankohta:',
                style: TextStyle(
                  color: Colors.brown.shade700,
                  letterSpacing: 2.0,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      maxLength: 2,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: _hourController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: '09'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      controller: _minuteController,
                      maxLength: 2,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: '00'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                'Odotetaan hälytyksen kuittausta ennen viesin lähetystä (h):',
                style: TextStyle(
                  color: Colors.brown.shade700,
                  letterSpacing: 2.0,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: _smsHourController,
                      maxLength: 1,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: '2'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.brown.shade500),
                    onPressed: () {
                      setState(() {
                        alarmStopHour = _smsHourController.text;
                        alarmHour = _hourController.text;
                        alarmMinutes = _minuteController.text;
                      });
                    },
                    child: Text('Tallenna'),
                  ),
                  SizedBox(width: 10.0),
                  Flexible(
                    child: Text('Hälytys alkaa klo ' +
                        alarmHour.toString() +
                        '.' +
                        alarmMinutes.toString() +
                        '.' +
                        '\nViesti lähetetään ' +
                        '$alarmStopHour' +
                        ' h kuluttua '
                            'hälytyksen alkamisesta, jos hälytystä ei kuitata.'),
                  ),
                ],
              ),
              Switch(
                  activeColor: Colors.brown.shade800,
                  activeTrackColor: Colors.brown.shade500,
                  inactiveThumbColor: Colors.brown.shade200,
                  inactiveTrackColor: Colors.brown.shade100,
                  value: isOn,
                  onChanged: (value) {
                    setState(() {
                      isOn = value;
                    });
                    if (isOn == true) {
                      AndroidAlarmManager.oneShotAt(
                          DateTime(2022, 02, 05, 09, 00, 00),
                          alarmID,
                          showAlertDialog(context),
                          exact: true,
                          allowWhileIdle: true,
                          wakeup: true,
                          rescheduleOnReboot: true,
                          alarmClock: true);
                    } else {
                      AndroidAlarmManager.cancel(alarmID);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
