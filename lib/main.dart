import 'package:flutter/material.dart';
import 'package:test_container/lane_input_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lane Input App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LaneInputPage(),
    );
  }
}