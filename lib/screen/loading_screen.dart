import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import '../constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.white,
          child: const Center(
            child: AnimatedLoadingDualSurge(
              expandWidth: 70,
              borderColor: kBabyBlue,
              speed: Duration(milliseconds: 300),
              borderWidth: 4,
            ),
          ),
        ),
      ),
    );
  }
}
