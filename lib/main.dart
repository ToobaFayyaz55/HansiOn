import 'package:flutter/material.dart';
import 'package:HansiOn/view/HomeScreen.dart';
import 'package:HansiOn/view/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showSplash = true;

  void showSplashScreen() async {
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      showSplash = false;
    });
  }

  @override
  void initState() {
    super.initState();
    showSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HansiOn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: showSplash ? splashScreen() : HomeScreen(),
    );
  }
}
