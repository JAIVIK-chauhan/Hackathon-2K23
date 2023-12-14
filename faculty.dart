import 'package:classico/Hackathon/SplashScreen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(FacultyApp());
}

class FacultyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
          @override
      ),
      home: FacultyHomeScreen(),
    );
  }
}

class FacultyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty Portal'),
        centerTitle: true,
      ),
      body: FacultyDashboard(),
    );
  }
}

class FacultyDashboard extends StatefulWidget {
  @override
  _FacultyDashboardState createState() => _FacultyDashboardState();
}

class _FacultyDashboardState extends State<FacultyDashboard> {
  String selectedDate = '';
  List<String> attendanceHistory = [];

  void takeAttendance() {
    // Simulated attendance taking logic
    setState(() {
      selectedDate = DateTime.now().toString();
      attendanceHistory.insert(0, selectedDate);
    });

    // Navigate to the TakeAttendanceScreen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => splashscreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[
                Color(0xffa8edea),Color(0xfffed6e3)
              ]
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course: Computer Science',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Select Date:',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 200,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Pick a date',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
            ),
            SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                takeAttendance();
              },
              child: Text('Take Attendance'),
            ),
            SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StopAttendanceScreen(),
                  ),
                );
              },
              child: Text('Stop Attendance'),
            ),
            SizedBox(height: 16),
            Text(
              'Attendance History:',
              style: TextStyle(fontSize: 20
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: attendanceHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Date: ${attendanceHistory[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class StopAttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:45 ),
              child: Image.asset(
                'assets/images/home.jpg',
                 ),
            ),

          ],
        ),
      ),
    );
  }
}

