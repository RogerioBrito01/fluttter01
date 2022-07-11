import 'package:flutter/material.dart';
import 'package:flutter01/pages/Buttom_page.dart';
import 'package:flutter01/pages/api.dart';
import 'package:flutter01/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/button': (context) => const BottomPage(),
        '/api': (context) => const ApiPage(),
      },
    );
  }
}
