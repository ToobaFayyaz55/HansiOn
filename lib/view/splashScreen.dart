import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              width: MediaQuery.of(context).size.width,
              height: 300,
              fit: BoxFit.contain,
              "assets/logo.jpg"),
          SizedBox(height: 20),
          Text("HansiOn App", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
