import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var now = DateFormat.Hm().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: Text('HomeAlone'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/main.jpg'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 0.0),
                Center(
                  child: Text(now.toString()),
                ),
                Center(
                  child: Text(
                    'Hälytyksen aloitusaika',
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(height: 0.0),
                Center(
                  child: Text(
                    '9.00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Text(
                    'Hälytys kuitattava',
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(height: 0.0),
                Center(
                  child: Text(
                    '2' + ' h',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(height: 0.0),
                Center(
                  child: Text(
                    'aikana',
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(height: 200.0),
                ElevatedButton.icon(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.grey.shade600),
                    icon: Icon(
                      Icons.timer,
                      color: Colors.black87,
                      size: 24.0,
                    ),
                    label: Text('Vaihda hälytyksen aika'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/alarm');
                      print('Pressed');
                    }),
                SizedBox(height: 30.0),
                ElevatedButton.icon(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.grey.shade600),
                    icon: Icon(
                      Icons.sms_rounded,
                      color: Colors.black87,
                      size: 24.0,
                    ),
                    label: Text('Aseta viestin tiedot'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/sms');
                      print('Pressed');
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
