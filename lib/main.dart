import 'package:flutter/material.dart';
import 'menu-homepage.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Templates',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenuHomepage(),
    );
  }
}
