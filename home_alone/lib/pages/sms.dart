import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

class SMS extends StatefulWidget {
  const SMS({Key? key}) : super(key: key);

  @override
  _SMSState createState() => _SMSState();
}

// metodi viestin lähettämiseen:
_sendSMS(String message) async {
  List<String> recipients = [
    "+358442941323"
  ]; // Puhelinnumero, johon viesti lähetetään, _numbercontroller myöhemmin. Return.
  String message =
      "En ole kuitannut aamun hälytystä, tarkistathan onko minulla kaikki hyvin. Automaattinen viesti.";
  String _result = await sendSMS(message: message, recipients: recipients)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}

class _SMSState extends State<SMS> {
  TextEditingController _numberController =
      TextEditingController(); //tallennetaan annettu puhelinnumero
  String numberController = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Viestin lähetysasetukset'),
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
                  backgroundImage: AssetImage('assets/msg.jpg'),
                  radius: 50.0,
                ),
              ),
              Divider(
                height: 90.0,
                thickness: 1,
                color: Colors.green,
              ),
              Text(
                'Viesti vastaanottajalle on:',
                style: TextStyle(
                  color: Colors.green.shade900,
                  letterSpacing: 2.0,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                '"En ole kuitannut aamun hälytystä, tarkistathan onko minulla kaikki hyvin. Automaattinen viesti."',
                style: TextStyle(
                  color: Colors.green.shade700,
                  letterSpacing: 2.0,
                  fontSize: 17.0,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'Syötä vastaanottajan numero:',
                style: TextStyle(
                  color: Colors.green.shade900,
                  letterSpacing: 2.0,
                  fontSize: 15.0,
                ),
              ),
              TextField(
                controller: _numberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '+358402369854',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 5.0),
              Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                        setState(() {
                          numberController = _numberController.text;
                        });
                        print('Puhelinnumero: ' + _numberController.text);
                      },
                      child: Text('Valmis')),
                  SizedBox(width: 10.0),
                  Flexible(
                    child: Text('Puhelinnumero on ' + numberController),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Text(
                'Muistathan kertoa viestin vastaanottajalle sovelluksen käytöstä.',
                style: TextStyle(
                  color: Colors.green.shade900,
                  letterSpacing: 2.0,
                  fontSize: 17.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// pop-up ikkuna hälytyksen lauetessa:
bool ok = true;

showAlertDialog(BuildContext context) {
  // käynnistää timerin viesin lähetykseen.
  Timer t = Timer(Duration(hours: 2), () {
    //pitää tuoda tieto alarm.dartista.
    _sendSMS;
  });
  // set up the button
  Widget yesButton = TextButton(
      child: Text("KYLLÄ"),
      onPressed: () {
        if (ok == true) {
          t.cancel(); // pysäyttää laskurin, jos painetaan ok -nappulaa.
          Navigator.of(context).pop();
        }
      });

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("HomeAlone"),
    content: Text("Onko kaikki hyvin?"),
    actions: [
      yesButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
