import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hackathon.dart';

class splashscreen extends StatefulWidget{
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5),(){

      Navigator.pushReplacement(context as BuildContext,
          MaterialPageRoute(
            builder: (context) => WifiAttendanceScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[
                  Color(0xffaccbee),Color(0xffe7f0fd)
                ]
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 40,top: 30,bottom:20),
              child: Center(
                child: Text('   Welcome to Wi-Fi Attendance System ', style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  //backgroundColor: Colors.black26,
                ),),
              ),
            ),
            Center(child: Image.asset('assets/images/w.png')),

          ],
        ),
      )
    );
  }
}