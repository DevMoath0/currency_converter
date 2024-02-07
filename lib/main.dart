import 'package:currency_converter/screen/home_screen.dart';
import 'package:currency_converter/screen/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const LoadingScreen());

  //To make the app refuse landscape mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) async {
    await Future.delayed(
      //The duration for the loading screen
      const Duration(seconds: 1),
    );
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
