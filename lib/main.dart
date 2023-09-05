import 'package:flutter/material.dart';
import 'package:rh_presence_mobile/screen/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
