import 'package:flutter/material.dart';
import 'package:todoproject/screens/AddSimpleTodo.dart';
import 'package:todoproject/screens/HomeScreen.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: AddSimpleTodo(),
    );
  }
}
