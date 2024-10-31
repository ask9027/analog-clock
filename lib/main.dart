import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const AnalogClockApp());
}

class AnalogClockApp extends StatelessWidget {
  const AnalogClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: AnalogClock()),
      ),
    );
  }
}

class AnalogClock extends StatefulWidget {
  const AnalogClock({super.key});

  @override
  State<AnalogClock> createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  late Timer timer;
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = 200.0;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Clock face
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[900],
              border: Border.all(width: 2, color: Colors.white),
            ),
          ),
          // Hour hand
          Transform.rotate(
            angle: (pi / 6) * dateTime.hour + (pi / 360) * dateTime.minute,
            child: Container(width: 4, height: size * 0.25, color: Colors.red),
          ),
          // Minute hand
          Transform.rotate(
            angle: (pi / 30) * dateTime.minute,
            child: Container(width: 2, height: size * 0.35, color: Colors.blue),
          ),
          // Second hand
          Transform.rotate(
            angle: (pi / 30) * dateTime.second,
            child: Container(width: 1, height: size * 0.4, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
