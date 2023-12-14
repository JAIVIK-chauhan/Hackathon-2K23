import 'package:classico/Hackathon/SplashScreen.dart';
import 'package:classico/to%20do%20list/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(WifiAttendanceApp());
}

class WifiAttendanceApp extends StatefulWidget {
  @override
  State<WifiAttendanceApp> createState() => _WifiAttendanceAppState();
}

class _WifiAttendanceAppState extends State<WifiAttendanceApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: splashscreen(),
    );
  }
}

class WifiAttendanceScreen extends StatefulWidget {
  @override
  _WifiAttendanceScreenState createState() => _WifiAttendanceScreenState();
}

class _WifiAttendanceScreenState extends State<WifiAttendanceScreen> {
  bool isPresent = false;
  List<String> attendanceHistory = [];

  void markAttendance() {

    setState(() {
      isPresent = !isPresent;
      attendanceHistory.insert(
        0,
        'Attendance marked: ${isPresent ? "Present" : "Absent"} - ${DateTime.now()}',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wi-Fi Attendance System', style: TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.w900,
          backgroundColor: Colors.blueAccent,
        ),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.history),
            iconSize: 45,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AttendanceHistoryScreen(
                    attendanceHistory: attendanceHistory,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body:
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[
                  Color(0xfffff1eb),Color(0xfface0f9)
                ]
            )
        ),
        child: Row(
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[


                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                      alignment: Alignment.topLeft,
                      height: 240,
                      width: 200,

                      child: Image.asset('assets/images/boy_Icon.png')
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                ),

                Padding(
                  padding: const EdgeInsets.only(top:30,left: 80,bottom: 5),
                  child: FilledButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.amber, backgroundColor: Colors.black, // Text Color (Foreground color)
                    ),
                    child: const Text(
                      'Connect Wi-fi',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80,bottom: 5),
                  child: FilledButton(
                    onPressed: () {
                      markAttendance();
                      },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.amber, backgroundColor: Colors.black, // Text Color (Foreground color)
                    ),
                    child: const Text(
                      'Mark Present',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 105,bottom: 5),
                  child: FilledButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.amber, backgroundColor: Colors.black, // Text Color (Foreground color)
                    ),
                    child: const Text(
                      'History',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )],
            ),
            Column(
              children: [
                SizedBox(
                  height: 90,
                ),
                Container(
                  alignment: Alignment.topRight,
                  height: 45,
                  width: 60,
                ),
                Text('Name:', style: TextStyle(
                  fontSize: 23,

                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  // backgroundColor: Colors.black26,

                ),),
                SizedBox(
                  height: 15,
                ),
                Text('Roll no:', style: TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  //backgroundColor: Colors.cyanAccent,
                ),),
                SizedBox(
                  height: 15,
                ),
                Text('Date:', style: TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  //backgroundColor: Colors.black26,
                ),),
                SizedBox(
                  height: 15,
                ),
                Text('Time:', style: TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  //backgroundColor: Colors.black26,
                ),),
                SizedBox(
                  height: 15,
                ),
                Text('Lecture:', style: TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  //backgroundColor: Colors.black26,
                ),),
              ],
            ),
          ],
        ),
      ),

    );
  }
}

class AttendanceHistoryScreen extends StatelessWidget {
  final List<String> attendanceHistory;

  AttendanceHistoryScreen({required this.attendanceHistory});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[
                Color(0xffaccbee),Color(0xffe7f0fd)
              ]
          )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Attendance History',style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w800,
            backgroundColor: Colors.blueAccent,
          ),),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: attendanceHistory.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(attendanceHistory[index]),
            );
          },
        ),
      ),
    );
  }
}

class CustomBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[
                Color(0xffaccbee),Color(0xffe7f0fd)
              ]
          )
      ),
    );
  }
}